local ls = require('luasnip')
local s, i, t = ls.snippet, ls.insert_node, ls.text_node
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

ls.add_snippets('ruby', {
  s('rspec',
    fmt(
      [[
        Rspec.describe {} do
          {}
        end
      ]],{
        i(1),
        i(0)
      }
    )
  ),
  s("cl",
    fmt([[
      class {} {}
        {}
      end
      ]], {
      i(1),
      c(2, { t("< ApplicationRecord"), t("") }),
      i(0),
    }
    )
  ),
})
