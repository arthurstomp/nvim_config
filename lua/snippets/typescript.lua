local ls = require('luasnip')
local s, i, t = ls.snippet, ls.insert_node, ls.text_node
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local snippets = {
  s('fnComp',
    fmt(
      [[
        function {}({}) {{
          return (
            <{}>
              {}
            </{}>
          )
        }}
      ]],
      {
        i(1),
        c(2, {t('{{children}}: PropsWithChildren'), t('')}),
        i(3),
        i(4),
        rep(3)
      }
    )
  ),
  s('lint-disable', t('// eslint-disable-next-line')),
  s('ts-disable', t('// @ts-ignore: Unreachable code error'))
}

ls.add_snippets('typescript', snippets)
ls.add_snippets('typescriptreact', snippets)
