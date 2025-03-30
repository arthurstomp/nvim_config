local ls = require('luasnip')
local s, i, t = ls.snippet, ls.insert_node, ls.text_node
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

ls.add_snippets('all', {
  s("hi",  -- LuaSnip expands this to {trig = "hi"}
    { t("Hello, world!"), }
  ),
})
