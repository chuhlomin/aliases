# aliases

This repository contains a collection of useful shell aliases:

* [e](#e) – exporting environment variables from `.env` files
* [clone](#clone) – clone Git repository into `~/Projects/<owner>/<repo>` directory
* [new](#new) – create new Go project with `gonew` tool

## e

`e` is a small shell alias for exporting environment variables from `.env` files.

You can find more alternative solutions here: https://gist.github.com/mihow/9c7f559807069a03e302605691f8557

Usage example:

```bash
$ cat .env
KEY=VALUE

$ echo $KEY

$ e

$ echo $KEY
VALUE
```

Accepts one optional argument – filename:

```bash
e .env.prod
````

Installation:

Bash:

```bash
source e.sh
# to persist append content of e.sh to ~/.bash_profile
```

Fish:

```bash
source e.fish
# to persist copy e.fish to ~/.config/fish/functions/
```

## clone

clone is a wrapper on top of the `git clone` command, it:

1. parses the URL
2. creates "owner" directory in `~/Projects/`
3. clones repository into `~/Projects/<owner>/<repo>`

Works with both SSH and HTTPS URLs.

Usage example:

```bash
$ cd ~/ # run from anywhere
$ clone git@github.com:chuhlomin/terraform.git

Cloning into '/Users/username/Projects/chuhlomin/terraform'...
```

Installation:

```bash
chmod +x clone.sh
mv clone.sh /usr/local/bin/clone
```

## new

`new <template> <new go module>` is an alias for [`gonew`](https://github.com/chuhlomin/gonew):

```bash
gonew github.com/chuhlomin/gonew/<template> github.com/<current_directory>/<new go module>
```

Usage example:

```bash
$ cd ~/Projects/username
$ new server project
gonew: initialized github.com/username/project in ./project
```

Installation:

```bash
chmod +x new.sh
mv new.sh /usr/local/bin/new
```
