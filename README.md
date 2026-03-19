# Brent's .config directory

## Setup

```bash
mkdir -p ~/.config
cd ~/.config
git init
git remote add origin git@github.com:PappasBrent/.config.git
git remote -v
git pull origin master
```

<!-- TODO: Add a root setup.sh script that runs all other setup scripts. -->

Then `cd` into each directory and run its `setup.sh` script.

Some setup scripts require sudo (e.g., Kitty), but not all (e.g., Vim doesn't).

