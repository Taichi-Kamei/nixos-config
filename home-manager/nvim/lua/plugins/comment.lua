return {
  "numToStr/Comment.nvim",
  commit = "e51f2b142d88bb666dcaa77d93a07f4b419aca70", -- stable older version
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup()
  end,
}
