return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local close_buffer = function(bufnr)
      local current_buf = vim.api.nvim_get_current_buf()
      local next_buf = vim.fn.bufnr("#")
      if vim.api.nvim_buf_is_valid(next_buf) and vim.api.nvim_buf_is_loaded(next_buf) then
        vim.cmd("buffer " .. next_buf)
      else
        vim.cmd("bnext")
      end

      vim.cmd("bdelete " .. current_buf)
    end


    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "Dirs Tree",
            text_align = "center",
            separator = true
          }
        },
        close_command = function(bufnr)
          close_buffer(bufnr)
        end,
      }
    })

    local keymap = vim.keymap

    keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>")
    keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>")
  end
}
