# Firefox

## Install firefox
### Ubuntu 22.04
- https://www.omgubuntu.co.uk/2022/04/how-to-install-firefox-deb-apt-ubuntu-22-04

## Install FirefoxCSS
1. Type `about:config` into your URL bar. Click on the **I accept the risk** button if you're shown a warning.
2. Seach for **`toolkit.legacyUserProfileCustomizations.stylesheets`** and set it to **`true`**.
3. Go to your profile folder:
4. Copy `chrome` folder into `$HOME/.mozilla/firefox/$(grep "Default=.*\.default*" "$HOME/.mozilla/firefox/profiles.ini" | cut -d"=" -f2)/`
5. Restart<sup>1)</sup> Firefox.

## Recommended extensions
- [UBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
  Necessary. (Essential)

## References and links
- https://github.com/andreasgrafen/cascade
- https://www.reddit.com/r/FirefoxCSS/
