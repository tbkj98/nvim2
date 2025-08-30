local cmake_build_and_run_command = "cmake --build build --target run"

vim.bo.makeprg = cmake_build_and_run_command
vim.bo.errorformat = "%f:%l:%c: %m"

vim.api.nvim_create_user_command("CMakeClean", function()
  vim.cmd("!cmake --build build --target clean")
end, {})

vim.api.nvim_create_user_command("CMakeBuild", function()
  vim.cmd("!cmake --build build")
end, {})

vim.api.nvim_create_user_command("CMakeBuildSymbols", function()
  vim.cmd("!cmake -S " .. vim.fn.getcwd() .. " -B " .. vim.fn.getcwd() .. "/build -DCMAKE_BUILD_TYPE=Debug")
end, {})

vim.api.nvim_create_user_command("CMakeConfigure", function()
  vim.cmd("!cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON")
end, {})

vim.api.nvim_create_user_command("CMakeRun", function()
  vim.cmd("!" .. cmake_build_and_run_command)
end, {})

vim.keymap.set("n", "<leader>pc", ":CMakeConfigure<CR>", { desc = "Project configure", silent = true })
vim.keymap.set("n", "<leader>pb", ":CMakeBuild<CR>", { desc = "Project build", silent = true })
vim.keymap.set("n", "<leader>pd", ":CMakeBuildSymbols<CR>", { desc = "Project debug build", silent = true })
vim.keymap.set("n", "<leader>px", ":CMakeClean<CR>", { desc = "Project clean", silent = true })
