local overrides = require "custom.plugins.overrides"

return {
  -- Override plugin definition options
  ["NvChad/ui"] = {
    override_options = overrides.ui
  }
}
