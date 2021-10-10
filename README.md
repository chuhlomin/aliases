# e - export for .env files

`e` is a small shell alias for exporting environment variables from `.env` files.

<img width="762" alt="e demo" src="https://user-images.githubusercontent.com/3620471/136700630-a9b27950-e5bb-43c6-957c-b62118f7d928.png">

You can find more alternative solutions here: https://gist.github.com/mihow/9c7f559807069a03e302605691f8557

## Usage example

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

## Installation

```bash
git clone git@github.com:chuhlomin/e.git
cd e
```

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

## Uninstall

Bash:

```bash
unset -f e
```

Fish:

```bash
functions -e e
```
