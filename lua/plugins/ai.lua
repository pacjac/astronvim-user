local function log_to_file(message)
  local log_file = io.open("/tmp/openai_api_debug.log", "a")
  if log_file then
    log_file:write(os.date "%Y-%m-%d %H:%M:%S" .. " " .. message .. "\n")
    log_file:close()
  end
end

return {
  "David-Kunz/gen.nvim",
  opts = {
    model = "gpt-3.5-turbo", -- or another available model like "gpt-4" if accessible
    host = "api.openai.com", -- OpenAI's API host
    port = "443", -- Standard HTTPS port
    quit_map = "q", -- keymap to close the response window
    retry_map = "<c-r>", -- keymap to re-send the current prompt
    display_mode = "float", -- "float" or "split"
    show_prompt = true,
    show_model = true,
    no_auto_close = true,
    debug = false,
    command = function(options)
      -- Construct the command for the ChatGPT API
      local api_key = os.getenv "OPENAI_API_KEY"

      local messages = {
        { role = "user", content = options.prompt },
      }

      local body = {
        model = options.model,
        stream = true,
        messages = messages,
      }

      local json_body = vim.json.encode(body)
      local escaped_json_body = vim.fn.shellescape(json_body)

      local curl_command = string.format(
        "curl --silent -X POST https://%s:%s/v1/chat/completions "
          .. "-H 'Authorization: Bearer %s' "
          .. "-H 'Content-Type: application/json' "
          .. "-d %s",
        options.host,
        options.port,
        api_key,
        escaped_json_body
      )

      log_to_file(curl_command)

      return curl_command
    end,
  },
}
