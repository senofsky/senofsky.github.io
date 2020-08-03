---
title: How to Screenshot a Specific Area in Wayland
---

"A Picture is Worth a Thousand Words" is a rather trite phrase, but I have
learned that sending a screenshot can be a much simpler endeavor than trying to
describe an issue. Because of this, I configured my system (which uses Wayland
and Sway) to provide an easy-to-use screenshot utility. As a result, I use
small, easy-to-follow screenshots during informal technical communications over
slack or element.

## Setup & Usage

This script can be immediately copy & pasted into your `.bashrc`:

```shell
screenshot() {

    exit_status=$(grim -g "$(slurp)" $1.png)

    if [[ $exit_status -ne 0 ]]; then
        printf "Failed taking a screenshot\n"
    fi
}
```

To use the script, first install the packages `grim` and `slurp`. On Arch Linux:

```shell
sudo pacman -S grim slurp
```

then, restart the shell and execute:

```shell
screenshot path-to-save-screenshot
```


## Personal Note
I personally use a modified version of the script which contains some
user-specific configurations and error handling; it can be found in my
[dotfiles](https://github.com/senofsky/dotfiles/blob/master/scripts/screenshot.sh).
