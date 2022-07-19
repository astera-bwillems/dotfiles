require("luasnip.loaders.from_lua").lazy_load()
local env = SNIP_ENV

return {
    env.s(
        "prism",
        env.fmt(
            '<pre><code class="language-{}">{}</code></pre>',
            {
                env.i(1, "name"), env.i(2)
            }
        )
    ),
}
