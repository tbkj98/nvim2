return {
  "diepm/vim-rest-console",
  config = function()
    vim.g.vrc_response_default_content_type = "application/json"
    vim.g.vrc_request_default_content_type = "application/json"
    vim.g.vrc_output_buffer_name = "__VRC_OUTPUT.json"
    vim.g.vrc_auto_format_response_patterns = { json = "jq" }

    vim.g.vrc_curl_opts = {
      ["--silent"] = true,
    }
  end,
}
