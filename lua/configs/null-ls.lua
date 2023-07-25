local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.fixjson,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.tags,
    },
})

local h = require('null-ls.helpers')
local methods = require('null-ls.methods')

local FORMATTING = methods.internal.FORMATTING
