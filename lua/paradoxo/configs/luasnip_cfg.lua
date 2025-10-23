-- vscode format
require("luasnip.loaders.from_vscode").lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

-- snipmate format
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

-- lua format
require("luasnip.loaders.from_lua").load()
require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })

--
local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
ls.add_snippets("javascript", {
    s("typ", {
        t({ "/**", " * @type {" }),
        i(0, "type"),
        t({ "}", " * */" }),
    }),
})
ls.add_snippets("typescript", {
    s("cl", {
        t("console.log("),
        i(0),
        t(")"),
    }),
})
ls.add_snippets("typescriptreact", {
    s("cl", {
        t("console.log("),
        i(0),
        t(")"),
    }),
})
ls.add_snippets("python", {
    s("tig", {
        t("# type: ignore"),
    }),
    s("no", {
        t("# noqa"),
    }),
    s("docs", {
        t('"""'),
        i(0, "Docstring"),
        t('"""'),
    }),
    s("vld", {
        t("def __validate_"),
        i(1, "prop"),
        t({ "__(self, name: str, value: Any) -> bool:", "\t" }),
        i(0, "# code here"),
        t({ "", "\treturn True" }),
    }),
})
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.conditions")
-- local conds_expand = require("luasnip.extras.conditions.expand")
-- snippets are added via ls.add_snippets(filetype, snippets[, opts]), where
-- opts may specify the `type` of the snippets ("snippets" or "autosnippets",
-- for snippets that should expand directly after the trigger is typed).
--
-- opts can also specify a key. By passing an unique key to each add_snippets, it's possible to reload snippets by
-- re-`:luafile`ing the file in which they are defined (eg. this one).
-- ls.add_snippets("all", {
--     -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
--     s("fn", {
--         -- Simple static text.
--         t("//Parameters: "),
--         -- function, first parameter is the function, second the Placeholders
--         -- whose text it gets as input.
--         f(copy, 2),
--         t({ "", "function " }),
--         -- Placeholder/Insert.
--         i(1),
--         t("("),
--         -- Placeholder with initial text.
--         i(2, "int foo"),
--         -- Linebreak
--         t({ ") {", "\t" }),
--         -- Last Placeholder, exit Point of the snippet.
--         i(0),
--         t({ "", "}" }),
--     })
-- })
