-- function startjtdls ()
local project_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local project_name = vim.fn.fnamemodify(project_dir, ':p:h:t')

local workspace_dir = '/home/cla/.cache/jdtls/workspace/' .. project_name

local config = {
    cmd = {'jdt-language-server', '-data', workspace_dir},
    -- root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    root_dir = project_dir,
}

-- require('jdtls').start_or_attach(config)
-- end


-- start the language server
-- "language start"
vim.keymap.set('n', '<localleader>ls', function() require('jdtls').start_or_attach(config) end)
