version = '0.21.3'

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
  .. ";"
  .. xpm_path
  .. "/?.lua;"
  .. xpm_path
  .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)

require("xpm").setup({
  plugins = {
    -- Let xpm manage itself
    'dtomvan/xpm.xplr',
    'Junker/nuke.xplr',
    'sayanarijit/fzf.xplr',
    'sayanarijit/map.xplr',
    'sayanarijit/find.xplr',
    'sayanarijit/wl-clipboard.xplr',
  },
  auto_install = true,
  auto_cleanup = true,
})

require("fzf").setup{
  mode = "default",
  key = "ctrl-f",
  bin = "fzf",
  args = "--preview 'pistol {}'",
  recursive = false,  -- If true, search all files under $PWD
  enter_dir = true,  -- Enter if the result is directory
}

require("nuke").setup {
  open = {
    run_executables = true, -- default: false
    custom = {
      {mime = "video/mp4", command = "mpv {}"},
      {mime_regex = "^video/.*", command = "mpv {}"},
      {mime_regex = ".*", command = "xdg-open {}"}
    },
  },
  view = {
    show_line_numbers = true, -- default: false
  },
  smart_view = {
    custom = {
      {extension = "so", command = "ldd -r {} | less"},
    },
  },
}

require("wl-clipboard").setup{
  copy_command = "wl-copy -t text/uri-list",
  paste_command = "wl-paste",
  keep_selection = false,
}

local map = require("map")
map.setup{
  mode = "default",  -- or `xplr.config.modes.builtin.default`
  key = "M",
  editor = os.getenv("EDITOR") or "vim",
  editor_key = "ctrl-o",
  prefer_multi_map = false,
  placeholder = "{}",
  spacer = "{_}",
  custom_placeholders = map.placeholders,
}

require("find").setup{
  mode = "default",
  key = "F",
  templates = {
    ["find all"] = {
      key = "a",
      find_command = "find",
      find_args = ". -name ",
      cursor_position = 8,
    },
    ["find files"] = {
      key = "f",
      find_command = "find",
      find_args = ". -name  -type f",
      cursor_position = 8,
    },
    ["find directories"] = {
      key = "d",
      find_command = "find",
      find_args = ". -name  -type d",
      cursor_position = 8,
    },
  },
  refresh_screen_key = "ctrl-r",
}

-- fuzzy search history directories (go_to menu)
xplr.config.modes.builtin.go_to.key_bindings.on_key.h = {
  help = "location history",
  messages = {
    "PopMode",
    {
      BashExec0 = [===[
        PTH=$(cat "${XPLR_PIPE_HISTORY_OUT:?}" | sort -z -u | fzf --read0)
        if [ "$PTH" ]; then
          "$XPLR" -m 'ChangeDirectory: %q' "$PTH"
        fi
      ]===],
    },
  },
}

-- With `export XPLR_BOOKMARK_FILE="$HOME/bookmarks"`
-- Bookmark: mode binding
xplr.config.modes.builtin.default.key_bindings.on_key["b"] = {
  help = "bookmark mode",
  messages = {
    { SwitchModeCustom = "bookmark" },
  },
}
xplr.config.modes.custom.bookmark = {
  name = "bookmark",
  key_bindings = {
    on_key = {
      m = {
        help = "bookmark dir",
        messages = {
          {
            BashExecSilently0 = [[
              PTH="${XPLR_FOCUS_PATH:?}"
              if [ -d "${PTH}" ]; then
                PTH="${PTH}"
              elif [ -f "${PTH}" ]; then
                PTH=$(dirname "${PTH}")
              fi
              PTH_ESC=$(printf %q "$PTH")
              if echo "${PTH:?}" >> "${XPLR_BOOKMARK_FILE:?}"; then
                "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC added to bookmarks"
              else
                "$XPLR" -m 'LogError: %q' "Failed to bookmark $PTH_ESC"
              fi
            ]],
          },
          "PopMode",
        },
      },
      g = {
        help = "go to bookmark",
        messages = {
          {
            BashExec0 = [===[
              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort)
              if [ "$PTH" ]; then
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              fi
            ]===],
          },
          "PopMode",
        },
      },
      d = {
        help = "delete bookmark",
        messages = {
          {
            BashExec0 = [[
              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort)
              sd "$PTH\n" "" "${XPLR_BOOKMARK_FILE:?}"
            ]],
          },
          "PopMode",
        },
      },
      esc = {
        help = "cancel",
        messages = {
          "PopMode",
        },
      },
    },
  },
}





-- default mode keybindings
--
local key = xplr.config.modes.builtin.default.key_bindings.on_key
-- key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
key["o"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o

key["e"] = xplr.config.modes.builtin.action.key_bindings.on_key.e
key["c"] = xplr.config.modes.builtin.selection_ops.key_bindings.on_key.c
key["m"] = xplr.config.modes.builtin.selection_ops.key_bindings.on_key.m

key.v = {
  help = "nuke",
  messages = {"PopMode", {SwitchModeCustom = "nuke"}}
}


-- batch rename
key.R = {
  help = "batch rename",
  messages = {
    {
      BashExec = [===[
       SELECTION=$(cat "${XPLR_PIPE_SELECTION_OUT:?}")
       NODES=${SELECTION:-$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}")}
       if [ "$NODES" ]; then
         echo -e "$NODES" | renamer
         "$XPLR" -m ExplorePwdAsync
       fi
     ]===],
    },
  },
}
