local A = vim.api

-- Custom filetypes
vim.filetype.add({
    extension = {
        conf = 'conf',
        mdx = 'markdown',
        mjml = 'html',
        kicad_mod = 'scheme',
    },
    pattern = {
        ['.*%.env.*'] = 'sh',
        ['ignore$'] = 'conf',
    },
    filename = {
        ['yup.lock'] = 'yaml',
    },
})

-- Lint AU
A.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()
  end,
})

-- Float Term
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

