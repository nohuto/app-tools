# Browser Extensions

Keep the amount of extensions to a minimum, don't use multiple ad-blockers. Also don't install extensions that have no actual use, e.g. "HTPPS Everywhere". Browers support that natively.

If you don't use uBO's functionality on a advanced way (only adding blocklists) rather use Brave Shields if using Brave.

### uBlock Origin - [Firefox](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/) - [Chrome](https://chromewebstore.google.com/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?pli=1)

I use a private DNS server with several lists of [hagezi](https://github.com/hagezi/dns-blocklists), therefore I've a minimal uBO blocklist set focusing on parts that can't be applied via DNS filtering, see my current uBO config [here]().

### Violentmonkey - [Firefox](https://addons.mozilla.org/en-US/firefox/addon/violentmonkey/) - [Chrome](https://chromewebstore.google.com/detail/violentmonkey/jinjaccalgkegednnccohejagnlnfdag)

Only needed whenever using userscripts (you can practically also use a userscript via uBO using `userResourcesLocation`), e.g. [vaft](https://github.com/pixeltris/TwitchAdSolutions/raw/master/vaft/vaft.user.js).

### Password Manager [Firefox](https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/) - [Chrome](https://chromewebstore.google.com/detail/bitwarden-password-manage/nngceckbapebfimnlniiiahkandclblb)

You should never use built-in browser password managers, although they' easy to use, they're often not secure as they don't offer E2EE. Rather use for example [Bitwarden](https://bitwarden.com/).

Read more about password managers [here](https://www.privacyguides.org/en/passwords/).

### Dark Reader - [Firefox](https://addons.mozilla.org/en-US/firefox/addon/darkreader/) - [Chrome](https://chromewebstore.google.com/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh)

If you use for example Mullvad's browser the dark mode won't work properly in most sites (fingerprinting), if that's not the case, you shouldn't install it.