-- Make sure that package is installed before attempting to configure it
local ensure_installed = function()
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/harpoon'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    return false
  end
  return true
end

local installed_result = ensure_installed()

if not installed_result then
    print("Harpoon is not installed! Restart nvim to complete installation...")
    return
end

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-y>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-u>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-i>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-o>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<C-p>", function() harpoon:list():select(5) end)
