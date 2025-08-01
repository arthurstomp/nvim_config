return {
  wttr = function()
    local aracaju_handler = io.popen('curl -s https://wttr.in/Aracaju?format=%l:+%C+%t+%p+%m')
    if aracaju_handler then
      local result = aracaju_handler:read('a')
      vim.notify(result)
      aracaju_handler:close()
    end

    local sao_paulo_handler = io.popen('curl -s https://wttr.in/SaoPaulo?format=%l:+%C+%t+%p+%m')
    if sao_paulo_handler then
      local result = sao_paulo_handler:read('a')
      vim.notify(result)
      sao_paulo_handler:close()
    end
  end
}
