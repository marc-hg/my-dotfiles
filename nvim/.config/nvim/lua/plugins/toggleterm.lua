return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<M-1>", "<cmd>ToggleTerm 1 direction=horizontal<cr>", desc = "ToggleTerm" },
    { "<M-1>", "<cmd>ToggleTerm 1 direction=horizontal<cr>", desc = "ToggleTerm", mode = "t" },
    { "<M-2>", "<cmd>ToggleTerm 2 direction=float<cr>", desc = "ToggleTerm float" },
    { "<M-2>", "<cmd>ToggleTerm 2 direction=float<cr>", desc = "ToggleTerm float", mode = "t" },
    { "<M-3>", "<cmd>ToggleTerm 3 direction=tab<cr>", desc = "ToggleTerm tab" },
    { "<M-3>", "<cmd>ToggleTerm 3 direction=tab<cr>", desc = "ToggleTerm tab", mode = "t" },
  },
  opts = {
    direction = "float",
  },
}
