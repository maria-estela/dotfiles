# What is this?

Dotfiles are collections of files used for configuring tools,
typically in an Unix environment. Many Github users keep their
collection public

#### How to use the Bash configuration

Do not use the configuration directly, but rather point at it from the
file used in your system. For example, if this repo is cloned in
`~/repos/dotfiles` and your system expects a Bash conf file in
`~/.bashrc`, you can structure `~/.bashrc` this way:

```
# defaults from the system
# ...

source ~/repos/dotfiles/bashrc

# other customisations
# ...
```

This way, you can keep system specific settings clearly separated from
the versioned code
