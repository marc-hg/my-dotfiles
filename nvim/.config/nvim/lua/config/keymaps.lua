-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "resume" }
)
vim.cmd([[imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")]])
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

local is_wsl = (function()
  local output = vim.fn.systemlist("uname -r")
  return not not string.find(output[1] or "", "WSL")
end)()
if is_wsl then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "/mnt/v/wsl2/win32yank.exe -i --crlf",
      ["*"] = "/mnt/v/wsl2/win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "/mnt/v/wsl2/win32yank.exe -o --lf",
      ["*"] = "/mnt/v/wsl2/win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
