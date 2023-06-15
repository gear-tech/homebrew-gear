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

## glinks

```
brew tap gear-tech/gear

# Show all linked websites
$ brew glinks
website:    https://gear-tech.io
github:     https://github.com/gear-tech/gear
discord:    https://discord.gg/gear-protocol
wiki:       https://wiki.gear-tech.io
rustdocs:   https://docs.gear.rs


# Usages
$ brew glinks -h

Usage: brew glinks [options]

Gear linked websites.

  -w, --website                    Open gear official website.
  -g, --github                     Open gear github.
      --discord                    Open gear discord.
      --wiki                       Open gear wiki.
      --docs, --rustdocs           Open gear rust docs.
  -d, --debug                      Display any debugging information.
  -q, --quiet                      Make some output more quiet.
  -v, --verbose                    Make some output more verbose.
  -h, --help                       Show this message.
```

## LICENSE

GPL-3.0-or-later
