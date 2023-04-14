return {
  -- add copilot
  "github/copilot.vim",
  keys = {
    {
      "<leader>Cs",
      ":Copilot setup",
      desc = "Setup Copilot",
    },
    {
      "<leader>Ce",
      ":Copilot enable",
      desc = "Enable Copilot",
    },
    {
      "<leader>Cd",
      ":Copilot disable",
      desc = "Disable Copilot",
    },
    {
      "<leader>Cp",
      ":Copilot panel",
      desc = "Open Copilot Panel",
    },
    {
      "<leader>Co",
      ":Copilot signout",
      desc = "Sign out Copilot",
    },
  },
}
