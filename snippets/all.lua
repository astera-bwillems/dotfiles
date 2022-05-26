-- SNIP_ENV defined in luasnip setup
require("luasnip.loaders.from_lua").lazy_load()
local env = SNIP_ENV

return {
    env.s("date", env.p(os.date, "%Y-%m-%d")),
    env.s("time", env.p(os.date, "%H:%M"))
}
