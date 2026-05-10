local M = {}

function M.ensure_trailing_slash(path)
  if string.match(path, "/$") then
    return path
  end
  return path .. "/"
end

function M.join(base, relative)
  return M.ensure_trailing_slash(base) .. relative
end

function M.relative_to_base(absolute_path, base)
  local base_prefix = M.ensure_trailing_slash(base)
  local relative_path = string.gsub(absolute_path, "^" .. vim.pesc(base_prefix), "", 1)

  if relative_path == absolute_path then
    return nil
  end

  return relative_path
end

return M
