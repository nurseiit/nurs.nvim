local function definition_jump_patch(result)
  if not vim.tbl_islist(result) or type(result) ~= "table" then
    return result
  end

  return { result[1] }
end

return {
  handlers = {
    ["textDocument/definition"] = function(err, result, method, ...)
      vim.lsp.handlers["textDocument/definition"](err, definition_jump_patch(result), method, ...)
    end,
  },
}
