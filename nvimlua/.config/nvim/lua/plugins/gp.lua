return {
    {
        "robitx/gp.nvim",
        config = function()
            local conf = {
                -- For customization, refer to Install > Configuration in the Documentation/Readme
            
                providers = {
                    ollama = {
    	              endpoint = "http://localhost:11434/v1/chat/completions",
    	              secret = "dummy_secret",
                    }
                },

                agents = {
                    {
                	provider = "ollama",
			name = "deepseek-8B",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = {
				model = "deepseek-r1:8b",
				temperature = 0.6,
				top_p = 1,
				min_p = 0.05,
			},
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = "You are a general AI assistant.",
                    },
                },

                hooks = {
                    TranslateIT = function(gp, params)
                        local template = "Translate the following text in italian:\n"
                            .. "{{selection}}\n\n"
                            .. "Please respond by writing only the translated text.\n"
                        local agent = gp.get_command_agent()
                        gp.Prompt(params, gp.Target.vnew, agent, template)
                    end,
                },
            }
            require("gp").setup(conf)
            -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
        end,
    }
}
