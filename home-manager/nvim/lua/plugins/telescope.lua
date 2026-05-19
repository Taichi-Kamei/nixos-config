return {
  "nvim-telescope/telescope.nvim", version = '*',
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "false" },
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    pcall(telescope.load_extension, "fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", { desc = 'Telescope buffers' })
    keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", { desc = 'Telescope help tags' })
    keymap.set('n', "<leader>ft", "<cmd>TodoTelescope<cr>", {})

    vim.keymap.set("n", "<leader>fv", function()
      require("telescope.builtin").find_files({
        prompt_title = "Open PDF in Zathura",
        find_command = { "find", ".", "-name", "*.pdf" },
        attach_mappings = function(_, map)
          map("i", "<CR>", function(prompt_bufnr)
            local selected = require("telescope.actions.state").get_selected_entry()
            require("telescope.actions").close(prompt_bufnr)
            vim.fn.jobstart({ "zathura", selected.path }, { detach = true })
          end)
          return true
        end,
      })
    end, { desc = "Find PDF and open in Zathura" })
  end,
}
