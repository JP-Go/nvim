local jdtls_install_location = vim.fn.expand('$HOME')
  .. '/.local/share/nvim/mason/packages/jdtls'
local find_launcher = function (base)
    return vim.fs.find(function (name)
        return name:match('.*%.launcher_.*')
    end, {type = 'file',path = base })
end
local launcher_path = find_launcher(jdtls_install_location .. '/plugins/')[1]
local config_path = jdtls_install_location .. '/config_linux'
local workspace_dir = vim.fn.expand('$HOME')
  .. '/.java/workspaces/'
  .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local get_java_agent = function(ls_loc)
  local agent = ''
  local expected_lombok_location = ls_loc .. '/lombok.jar'
  if vim.fn.exists(expected_lombok_location) then
    agent = '-javaagent:' .. expected_lombok_location
  end
  return agent
end

local base_lspconfig = require('plugins.lsp').exports

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    get_java_agent(jdtls_install_location),
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    '-jar',
    launcher_path,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    -- Must point to the
    -- eclipse.jdt.ls installation
    '-configuration',
    config_path,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    '-data',
    workspace_dir,
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {
      jdtls_install_location .. '/lombok.jar',
    },
  },
  on_attach = base_lspconfig.on_attach,
  capabilities = base_lspconfig.capabilities,
}
require('jdtls').start_or_attach(config)
