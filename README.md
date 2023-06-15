# homebrew-gear

Homebrew tap for gear binaries, for installing gear:

```
brew tap gear-tech/gear
brew install gear

# If you want to install a specified version
brew install gear@0.1.6

# For vara
brew install vara

# Versioned vara
brew install vara@1.1
```

## Formula

Supported versions

| gear         | vara        |
| ------------ | ----------- |
| gear@nightly | vara@stable |
| gear@0.1.6   | vara@1.1    |
| gear@0.1.5   | vara@1.0    |
| gear@0.1.4   |             |
| gear@0.1.3   |             |
| gear@0.1.2   |             |
| gear@0.1.1   |             |

## Commands

<kbd>gi</kbd>

```
brew tap gear-tech/gear
brew gi

Usage: brew gi [--tag=] [--to=]

gear binaries installer.

      --tag                        Install a specific version of gear.
      --to                         Install gear to a specific path.
  -d, --debug                      Display any debugging information.
  -q, --quiet                      Make some output more quiet.
  -v, --verbose                    Make some output more verbose.
  -h, --help                       Show this message.
```

## LICENSE

GPL-3.0-or-later
