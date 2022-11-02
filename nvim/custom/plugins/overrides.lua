local M = {}

M.ui = {
  statusline = {
    separator_style = "default", -- default/round/block/arrow

     -- or 
     -- custom separators
     -- separator_style = {
     --    left = " ",
     --    right = "",
     --  },

    overriden_modules = nil,
   },

   -- lazyload it when there are 1+ buffers
   tabufline = {
      enabled = true,
      lazyload = true,
      overriden_modules = nil,
   },
}

return M
