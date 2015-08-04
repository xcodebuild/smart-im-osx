![gpl](http://img.shields.io/:license-gpl-blue.svg)
# What is this?

Smart-im-osx is a emacs plugin to make your input method on Mac smarter.

For now,it only has support for `evil-mode`.More features will be add soon.

It is **Mac-only**.

# Installation

```bash
make
make install
```

You can also only execute `make install` because there is already a prebuild binary file. 

# Setup

```elisp
(add-to-list 'load-path "/path/to/fcitx.el")
(require 'smart-im-osx)
(smart-im-osx-enable-for-evil)
```

# What should I do if my default keyboard is not US English?

`(setq smart-im-osx-us-keyboard-name <your_default_keyboard_id>)`

You can run `im-select` in this project to get current input method's id.

