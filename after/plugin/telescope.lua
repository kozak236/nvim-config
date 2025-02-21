-- Make sure that package is installed before attempting to configure it
local ensure_installed = function()
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/telescope.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    return false
  end
  return true
end

local installed_result = ensure_installed()

if not installed_result then
    print("Telescope is not installed! Restart nvim to complete installation...")
    return
end


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
