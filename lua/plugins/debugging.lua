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

local cpp_configurations = function()
  return {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        -- Building symbols
        vim.cmd("CMakeBuildSymbols")
        -- Building project
        vim.cmd("CMakeBuild")
        -- Pressing keys to continue
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, true, true), "n", true)
        return vim.fn.getcwd() .. "/build/Application"
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
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

local js_ts_configuration = function()
  return {
    -- Launch NestJS application in debug mode
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch NestJS App",
      program = "${workspaceFolder}/dist/main.js", -- Compiled JS entry point
      cwd = "${workspaceFolder}",
      env = {
        NODE_ENV = "development",
      },
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
      -- Auto-attach to child processes (useful for NestJS)
      autoAttachChildProcesses = true,
    },

    -- Launch TypeScript file directly with ts-node
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch TypeScript with ts-node",
      program = "${workspaceFolder}/src/main.ts", -- TypeScript entry point
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
      runtimeArgs = { "--loader", "ts-node/esm" },
      env = {
        NODE_ENV = "development",
        TS_NODE_PROJECT = "${workspaceFolder}/tsconfig.json",
      },
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },

    -- Launch with tsx (faster TypeScript runner)
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch TypeScript with tsx",
      program = "${workspaceFolder}/src/main.ts",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "tsx",
      env = {
        NODE_ENV = "development",
      },
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      console = "integratedTerminal",
    },

    -- Launch NestJS in watch mode
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch NestJS (Watch Mode)",
      program = "${workspaceFolder}/node_modules/@nestjs/cli/bin/nest.js",
      args = { "start", "--debug", "--watch" },
      cwd = "${workspaceFolder}",
      port = 9229,
      env = {
        NODE_ENV = "development",
      },
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      console = "integratedTerminal",
      restart = true,
    },

    -- Attach to running NestJS process
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to NodeJS process",
      port = 9229, -- Default Node.js debug port
      localRoot = "${workspaceFolder}",
      remoteRoot = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },

    -- Debug Jest tests
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      program = "${workspaceFolder}/node_modules/.bin/jest",
      args = { "--runInBand", "--no-coverage", "--no-cache" },
      cwd = "${workspaceFolder}",
      env = {
        NODE_ENV = "test",
      },
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      console = "integratedTerminal",
    },

    -- Debug specific Jest test file
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Current Test File",
      program = "${workspaceFolder}/node_modules/.bin/jest",
      args = { "${file}", "--runInBand", "--no-coverage", "--no-cache" },
      cwd = "${workspaceFolder}",
      env = {
        NODE_ENV = "test",
      },
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      console = "integratedTerminal",
    },

    -- Debug current TypeScript file
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Current TS File",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "tsx",
      env = {
        NODE_ENV = "development",
      },
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
    },
  }
end

local setup_keymaps = function()
  local dap = require("dap")

  vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Start/Continue" })
  vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
  vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
  vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
  vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
end

-- @diagnosis: ignore
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
      --- @diagnostic disable-next-line: unused-local
      display_callback = function(variable, _buf, _stackframe, _node, options)
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
      "theHamsta/nvim-dap-virtual-text", -- inline variable text while debugging
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

      -- TODO: Commented out as it is not working
      dap.configurations.javascript = js_ts_configuration()
      dap.configurations.typescript = js_ts_configuration()

      -- INFO: setting up cpp debugging
      dap.configurations.cpp = cpp_configurations()

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb", -- `mason.nvim` will make this available
          args = { "--port", "${port}" },
        },
      }
      -- Overrides the default debugging icons
      setup_debugging_icons()
      setup_keymaps()
    end,
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local opts = {
        -- debugger_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/js-debug-adapter",
        debugger_cmd = {
          "node",
          vim.env.HOME .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
        },
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      }

      require("dap-vscode-js").setup(opts)
    end,
  },
}
