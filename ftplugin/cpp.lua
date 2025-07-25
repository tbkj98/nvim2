local cmake_build_and_run_command = "cmake --build build --target run"

vim.opt.makeprg = cmake_build_and_run_command
vim.opt.errorformat = "%f:%l:%c: %m"

vim.api.nvim_create_user_command("CMakeClean", function()
  vim.cmd("!cmake --build build --target clean")
end, {})

vim.api.nvim_create_user_command("CMakeBuild", function()
  vim.cmd("!cmake --build build")
end, {})

vim.api.nvim_create_user_command("CMakeConfigure", function()
  vim.cmd("!cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON")
end, {})

vim.api.nvim_create_user_command("CMakeRun", function()
  vim.cmd("!" .. cmake_build_and_run_command)
end, {})
