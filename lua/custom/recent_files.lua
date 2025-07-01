local M = {}
local buf_name = "__RecentFilesCWD__"
local win_id = nil
local local_bufnr = -1
local keymaps = {}
local current_files = {}
local buffer_times = {}

local function create_buf()
  local bufnr = vim.fn.bufnr(buf_name)
  if bufnr == -1 then
    bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_name(bufnr, buf_name)
  end
  return bufnr
end

local function calculate_display_lines(files)
  local display_lines = {}
  for i, file in ipairs(files) do
    local filename = vim.fn.fnamemodify(file, ":t") -- Get just the filename
    table.insert(display_lines, string.format("[%d] %s", i, filename))
  end
  return display_lines
end

local function get_recent_files()
  local bufs = vim.api.nvim_list_bufs()

  local recent = {}

  for _, buf in ipairs(bufs) do
    local name = vim.api.nvim_buf_get_name(buf)
    if buf ~= local_bufnr and name ~= "" then
      table.insert(recent, buf)
    end
  end

  table.sort(recent, function(a, b)
    return (buffer_times[a] or 0) > (buffer_times[b] or 0)
  end)

  local files = {}

  for _, buf in ipairs(recent) do
    local name = vim.api.nvim_buf_get_name(buf)
    if vim.fn.filereadable(name) == 1 then
      table.insert(files, name)
    end
  end

  return files
end

local function refresh_keymaps()
  keymaps = {} -- reset previous
  local files = current_files or {}
  for i, file in ipairs(files) do
    keymaps["g" .. i] = file -- e.g., g1 -> file path
  end

  -- Default enter opens file on current line
  vim.keymap.set("n", "<CR>", function()
    local line = vim.api.nvim_get_current_line()
    local path = line:match("%] (.+)$")
    if path and vim.fn.filereadable(path) == 1 then
      vim.cmd("edit " .. vim.fn.fnameescape(path))
    end
  end, { buffer = local_bufnr, silent = true })

  -- Define numbered keymaps like g1, g2, etc.
  for k, path in pairs(keymaps) do
    vim.keymap.set("n", k, function()
      if vim.fn.filereadable(path) == 1 then
        vim.cmd("edit " .. vim.fn.fnameescape(path))
      end
    end, { silent = true, desc = "Open recent file " .. k })
  end
end

local function refresh(files)
  if not local_bufnr or not vim.api.nvim_buf_is_valid(local_bufnr) then
    return
  end

  current_files = files or {} -- Store the files globally for access in keymaps

  -- Format with numbers
  local display_lines = calculate_display_lines(files) -- Calculate display lines

  vim.api.nvim_buf_set_option(local_bufnr, "modifiable", true)
  vim.api.nvim_buf_set_lines(local_bufnr, 0, -1, false, display_lines)
  vim.api.nvim_buf_set_option(local_bufnr, "modifiable", false)

  refresh_keymaps() -- Update keymaps after refreshing the buffer
end

function M.open_window()
  local bufnr = create_buf()
  local_bufnr = bufnr -- Store the buffer number for later use
  local files = get_recent_files()
  current_files = files or {} -- Store the files globally for access in keymaps

  -- Format with numbers
  local display_lines = calculate_display_lines(files) -- Calculate display lines

  keymaps = {} -- reset previous
  for i, file in ipairs(files) do
    keymaps["g" .. i] = file -- e.g., g1 -> file path
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, display_lines)
  vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
  vim.api.nvim_buf_set_option(bufnr, "buftype", "nofile")
  vim.api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(bufnr, "filetype", "recentfiles")
  -- Saving the current active window
  local cur_win = vim.api.nvim_get_current_win()

  vim.cmd("40vsplit")
  win_id = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win_id, bufnr)
  vim.api.nvim_win_set_option(win_id, "number", false)
  vim.api.nvim_win_set_option(win_id, "relativenumber", false)

  -- Refocusing cursor to original window
  vim.api.nvim_set_current_win(cur_win)

  refresh_keymaps() -- Set up keymaps for the recent files
end

function M.toggle()
  if win_id and vim.api.nvim_win_is_valid(win_id) then
    vim.api.nvim_win_close(win_id, true)
    win_id = nil
  else
    M.open_window()
  end
end

local function on_files_update(new_list)
  refresh(new_list) -- Refresh the buffer with the new list of files
end

-- Compare oldfiles and trigger callback on change
local function check_oldfiles()
  -- Not doing anything if the buffer is not open
  if not local_bufnr then
    return
  end

  local current = get_recent_files()
  if #current ~= #current_files then
    on_files_update(current)
    return
  end
  for i = 1, #current do
    if current[i] ~= current_files[i] then
      on_files_update(current)
      return
    end
  end
end

-- Start polling
local function start_watching(interval_ms)
  local timer = vim.loop.new_timer()
  timer:start(0, interval_ms or 2000, vim.schedule_wrap(check_oldfiles))
  M._timer = timer
end

-- Stop polling
local function stop_watching()
  if M._timer then
    M._timer:stop()
    M._timer:close()
    M._timer = nil
  end
end

local function create_highlighting()
  local square_bracket_open = "SquareBracketOpen"
  local square_bracket_close = "SquareBracketClose"
  local bracket_number = "BracketNumber"

  vim.cmd([[
      augroup RecentFilesHighlight
          autocmd FileType recentfiles syntax match BracketNumber /^\[\zs\d\+\ze\]/
          autocmd FileType recentfiles syntax match SquareBracketOpen /^\[/
          autocmd FileType recentfiles syntax match SquareBracketClose /^\]/
      augroup END
  ]])

  if not vim.api.nvim_get_hl(0, { name = square_bracket_open, link = true }) then
    vim.api.nvim_set_hl(0, square_bracket_open, { fg = "#ff8800", bg = "#282828", bold = true })
  end
  if not vim.api.nvim_get_hl(0, { name = square_bracket_close, link = true }) then
    vim.api.nvim_set_hl(0, square_bracket_close, { fg = "#ff8800", bg = "#282828", bold = true })
  end
  if not vim.api.nvim_get_hl(0, { name = bracket_number, link = true }) then
    vim.api.nvim_set_hl(0, bracket_number, { fg = "#ff8800", bg = "#282828", bold = true })
  end
end

function M.setup()
  -- Create a user command for toggling recent files
  vim.api.nvim_create_user_command("RecentFiles", M.toggle, {
    desc = "Toggle Recent Files Window",
  })

  -- Keymap to toggle recent files
  vim.keymap.set("n", "<leader>br", M.toggle, { desc = "Buffers: Open toggle recent buffers" })

  -- Starting up the watcher
  start_watching(500) -- Check every 1 Geconds

  vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
      stop_watching() -- Stop the watcher on exit
    end,
  })

  -- Hook: every time a buffer is entered, update access time
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
      buffer_times[args.buf] = vim.loop.hrtime()
    end,
  })

  -- TODO: Fix highlighting
  -- create_highlighting()
end

return M
