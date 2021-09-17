local common_on_attach = require('lsps').common_on_attach

require('lspconfig').jdtls.setup({
    cmd = {
        '/usr/lib/jvm/java-16-openjdk/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '-Xmx2G',
        '-jar',
        '/home/jp/.local/lib/java-lsp/plugins/org.eclipse.equinox.launcher_1.6.300.v20210813-1054.jar',
        '-configuration',
        '/home/jp/.local/lib/java-lsp/config_linux',
        '-data',
        '/home/jp/workspace',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
    },
    on_attach = common_on_attach,
})
