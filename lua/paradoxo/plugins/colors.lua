function SetColor()
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "Magenta" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "Cyan" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "tanvirtin/monokai.nvim",
    config = function()
        require('monokai').setup { palette = require('monokai').soda }
        SetColor()
    end
}
