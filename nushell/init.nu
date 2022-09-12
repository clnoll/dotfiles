let-env config = ($env.config | merge {
  {
    show_banner: false
  }
})

source cnoll-env.nu
source prompt.nu
