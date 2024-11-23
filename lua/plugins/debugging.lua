local java_configurations = function()
    return {
        {
            name = "Debug Launch (2GB)",
            type = "java",
            request = "launch",
            vmArgs = "" .. "-Xmx2g ",
        },
        {
            name = "Debug Attach (6888)",
            type = "java",
            request = "attach",
            hostName = "127.0.0.1",
            port = 6888,
        },
        {
            name = "Debug Attach (8000)",
            type = "java",
            request = "attach",
            hostName = "127.0.0.1",
            port = 8000,
        },
        {
            name = "Debug Attach (5005)",
            type = "java",
            request = "attach",
            hostName = "127.0.0.1",
            port = 5005,
        },
        {
            name = "Custom config",
            type = "java",
            request = "launch",
            -- You need to extend the classPath to list your dependencies.
            -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
            -- classPaths = {},

            -- If using multi-module projects, remove otherwise.
            projectName = "<Project name>",

            -- javaExec = 'java',
            mainClass = "Main",

            -- If using the JDK9+ module system, this needs to be extended
            -- `nvim-jdtls` would automatically populate this property
            -- modulePaths = {},
            vmArgs = "" .. "-Xmx2g ",
        },
    }
end

local setup_debugging_icons = function()
    vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpoint" })
    vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "DapBreakpoint" })
    vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "DapBreakpoint" })
    vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DapLogPoint" })
    vim.fn.sign_define("DapStopped", { text = "󰁕 ", texthl = "DapStopped" })
end

-- NOTE: Only fetch after dap is initialized
local js_ts_configuration = function()
    return {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
        },
    }
end

-- Inline Debug Text
return {
    {
        -- https://github.com/theHamsta/nvim-dap-virtual-text
        "theHamsta/nvim-dap-virtual-text",
        lazy = true,
        opts = {
            -- Display debug text as a comment
            commented = true,
            -- Customize virtual text
            display_callback = function(variable, buf, stackframe, node, options)
                if options.virt_text_pos == "inline" then
                    return " = " .. variable.value
                else
                    return variable.name .. " = " .. variable.value
                end
            end,
        },
    },

    -- Debugging Support
    {
        -- https://github.com/rcarriga/nvim-dap-ui
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = {
            -- https://github.com/mfussenegger/nvim-dap
            "mfussenegger/nvim-dap",
            -- https://github.com/nvim-neotest/nvim-nio
            "nvim-neotest/nvim-nio",
            -- https://github.com/theHamsta/nvim-dap-virtual-text
            "theHamsta/nvim-dap-virtual-text",   -- inline variable text while debugging
            -- https://github.com/nvim-telescope/telescope-dap.nvim
            "nvim-telescope/telescope-dap.nvim", -- telescope integration with dap
        },
        opts = {
            controls = {
                element = "repl",
                enabled = false,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = "",
                },
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            force_buffers = true,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = "",
            },
            layouts = {
                {
                    elements = {
                        {
                            id = "scopes",
                            size = 0.50,
                        },
                        {
                            id = "stacks",
                            size = 0.30,
                        },
                        {
                            id = "watches",
                            size = 0.10,
                        },
                        {
                            id = "breakpoints",
                            size = 0.10,
                        },
                    },
                    size = 40,
                    position = "left", -- Can be 'left' or 'right'
                },
                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 10,
                    position = "bottom", -- Can be 'bottom' or 'top'
                },
            },
            mappings = {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t",
            },
            render = {
                indent = 1,
                max_value_lines = 100,
            },
        },
        config = function(_, opts)
            local dap = require("dap")
            require("dapui").setup(opts)

            dap.listeners.after.event_initialized["dapui_config"] = function()
                require("dapui").open()
            end

            dap.listeners.before.event_terminated["dapui_config"] = function()
                -- Commented to prevent DAP UI from closing when unit tests finish
                require("dapui").close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                -- Commented to prevent DAP UI from closing when unit tests finish
                require("dapui").close()
            end

            -- INFO: Add dap configurations based on your language/adapter settings
            -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
            dap.configurations.java = java_configurations()

            -- WARN: Commented out as it is not working
            -- dap.configurations.javascript = js_ts_configuration()
            -- dap.configurations.typescript = js_ts_configuration()

            -- Overrides the default debugging icons
            setup_debugging_icons()
        end,
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local opts = {
                debugger_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/js-debug-adapter",
                -- debugger_cmd = { vim.env.HOME .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug-adapter" },
                adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
            }

            require("dap-vscode-js").setup(opts)
        end,
    },
}
