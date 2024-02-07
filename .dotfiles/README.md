# Dotfiles

The arrangement of these dotfiles is from [here](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles/). The general idea is that this repository grabs config files from their default locations within the `$HOME` directory and slaps version control onto them. Don't move files, simply run `dotfiles add .acmerc` and your config file is now tracked by this repo.

These files are very personal and opinionated, and are not really up for discussion. Please fork this and use it as a jumping off point but don't ask for changes to the core repository for your needs.

## New Machine Set Up

To set up a new machine to use your version controlled config files, all you need to do is to clone the repository on your new machine telling git that it is a bare repository:

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anandpiyer/.dotfiles.git ~
```

However, some programs create default config files, so this might fail if git finds an existing config file in your $HOME. In that case, a simple solution is to clone to a temporary directory, and then delete it once you are done:

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anandpiyer/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```

There you go. No symlink mess.
