lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "gruvbox"
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.keys.normal_mode["<M-z>"] = ":set wrap!<cr>"
vim.opt.relativenumber  = true
vim.cmd [[imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true
vim.cmd [[nnoremap q <c-v>]]
lvim.keys.normal_mode["<C-L>"] = false
lvim.keys.normal_mode["<C-l>"] = false
lvim.builtin.treesitter.ensure_installed = {
  "lua",
  "rust",
  "toml",
}
lvim.builtin.dap.active = true
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = {
  "lua",
  "rust",
  "toml",
}
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}

local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
local codelldb_adapter = {
  type = "server",
  port = "${port}",
  executable = {
    command = mason_path .. "bin/codelldb",
    args = { "--port", "${port}" },
    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}
pcall(function()
  require("rust-tools").setup {
    tools = {
      executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
      reload_workspace_from_cargo_toml = true,
      runnables = {
        use_telescope = true,
      },
      inlay_hints = {
        auto = true,
        only_current_line = false,
        show_parameter_hints = false,
        parameter_hints_prefix = "<-",
        other_hints_prefix = "=>",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = "Comment",
      },
      hover_actions = {
        border = "rounded",
      },
      on_initialized = function()
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
          pattern = { "*.rs" },
          callback = function()
            local _, _ = pcall(vim.lsp.codelens.refresh)
          end,
        })
      end,
    },
    dap = {
      adapter = codelldb_adapter,
    },
    server = {
      on_attach = function(client, bufnr)
        require("lvim.lsp").common_on_attach(client, bufnr)
        local rt = require "rust-tools"
        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      end,

      capabilities = require("lvim.lsp").common_capabilities(),
      settings = {
        ["rust-analyzer"] = {
          lens = {
            enable = true,
          },
          checkOnSave = {
            enable = true,
            command = "clippy",
          },
        },
      },
    },
  }
end)

-- CHANGED --
lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.codelldb = codelldb_adapter
  dap.configurations.rust = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
end


lvim.plugins = {
  "simrat39/rust-tools.nvim",
  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  { "github/copilot.vim" },
  { "catppuccin/nvim", as = "catppuccin" },
  { "gruvbox-community/gruvbox", as = "gruvbox" },
  { "tanvirtin/monokai.nvim", as = "monokai" },
  { "cpea2506/one_monokai.nvim", as = "one_monokai" },
  { 'lalitmee/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' },
  { "luisiacc/gruvbox-baby", as = "gruvbox-baby" },
}
lvim.transparent_window = true
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup {
  transparent_background = false,
  custom_highlights = {
    HarpoonWindow = { ctermbg = 238 },
    HarpoonBorder = { fg = "#8AADF4" },
    -- Comment = { fg = colors.flamingo },
    -- TSConstBuiltin = { fg = colors.peach, style = {} },
    -- TSConstant = { fg = colors.sky },
    -- TSComment = { fg = colors.surface2, style = { "italic" } }
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    illuminate = true,
    which_key = true,
    treesitter = true,
    notify = true,
    fidget = true,
    telescope = true
  },
}
-- if statement
local is_wsl = (function()
  local output = vim.fn.systemlist "uname -r"
  return not not string.find(output[1] or "", "WSL")
end)()

if is_wsl then
  vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ['+'] = '/mnt/v/wsl2/win32yank.exe -i --crlf',
      ['*'] = '/mnt/v/wsl2/win32yank.exe -i --crlf',
    },
    paste = {
      ['+'] = '/mnt/v/wsl2/win32yank.exe -o --lf',
      ['*'] = '/mnt/v/wsl2/win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }
end
lvim.builtin.which_key.mappings.t = { function()
  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)
  local folder = string.gsub(file, "/[^/]+$", "")
  folder = folder ~= "" and folder or vim.fn.getcwd()
  vim.cmd("TermExec cmd=\"cd " .. folder .. "\"")
end, "open terminal next to the file" }

lvim.keys.term_mode = {}
vim.keymap.del("t", "<C-l>")
