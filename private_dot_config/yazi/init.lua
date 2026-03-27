require("git"):setup({ order = 1500 })
require("starship"):setup()
require("full-border"):setup()
require("bookmarks"):setup({
  persist = "vim",
  desc_format = "full",
  notify = {
    enable = true,
    timeout = 1,
    message = {
      new = "New bookmark '<key>' -> '<folder>'",
      delete = "Deleted bookmark in '<key>'",
      delete_all = "Deleted all bookmarks",
    },
  },
})
