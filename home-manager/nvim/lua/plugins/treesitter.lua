return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
   
    local configs = require("nvim-treesitter.config")  

    configs.setup({ 
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "json", "jsonc", "java", "typescript", "javascript", 
        "tsx", "yaml", "typst", "html", "css", "prisma",
        "markdown", "markdown_inline", "svelte", "graphql",
        "bash", "lua", "vim", "dockerfile", "gitignore",
        "query", "vimdoc", "c", "cpp", "make", "latex",
        "ninja", "rst", "rust", "python", "asm"
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
