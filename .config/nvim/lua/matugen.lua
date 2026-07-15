 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#141316',
    base01 = '#201f22',
    base02 = '#2b292c',
    base03 = '#938f99',
    base04 = '#cac4cf',
    base05 = '#e6e1e5',
    base06 = '#e6e1e5',
    base07 = '#e6e1e5',
    base08 = '#ffb4ab',
    base09 = '#f1b6d2',
    base0A = '#cac3d8',
    base0B = '#ccc0f0',
    base0C = '#f1b6d2',
    base0D = '#ccc0f0',
    base0E = '#cac3d8',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e6e1e5',          bg = '#141316' })
  hi('TelescopeBorder',         { fg = '#938f99',             bg = '#141316' })
  hi('TelescopePromptNormal',   { fg = '#e6e1e5',          bg = '#141316' })
  hi('TelescopePromptBorder',   { fg = '#938f99',             bg = '#141316' })
  hi('TelescopePromptPrefix',   { fg = '#ccc0f0',             bg = '#141316' })
  hi('TelescopePromptCounter',  { fg = '#cac4cf',  bg = '#141316' })
  hi('TelescopePromptTitle',    { fg = '#141316',             bg = '#ccc0f0' })
  hi('TelescopePreviewTitle',   { fg = '#141316',             bg = '#cac3d8' })
  hi('TelescopeResultsTitle',   { fg = '#141316',             bg = '#f1b6d2' })
  hi('TelescopeSelection',      { fg = '#e6e1e5',          bg = '#2b292c' })
  hi('TelescopeSelectionCaret', { fg = '#ccc0f0',             bg = '#2b292c' })
  hi('TelescopeMatching',       { fg = '#ccc0f0',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
