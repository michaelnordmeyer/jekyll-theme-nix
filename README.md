# Jekyll Theme Nix

A barebones theme for [Jekyll](https://github.com/jekyll/jekyll), which doesn't need any dependencies except `jekyll-redirect-from`, if you want to redirect pages without any web server configuration. It is optimized for fast build speeds as well.

Its purpose is to be a minimalist, single-author theme. Because there is no menu, pages can be manually linked in the body of `index.md`.

It also changes as little as possible from the default browser settings to improve legibility.

[Demo](https://jekyll-theme-nix.michaelnordmeyer.com/)

![Screenshot](/screenshot.png)

If this theme feels to bloated to you, you can try [“Nixer”](https://github.com/michaelnordmeyer/jekyll-theme-nixer), the ultra-minimalist version of “Nix”, or [“Nixest”](https://github.com/michaelnordmeyer/jekyll-theme-nixest), the even less functional version of “Nixer”.

[I wrote up what inspired me to create the three themes](https://michaelnordmeyer.com/i-created-three-ultra-minimalistic-jekyll-themes).

## Limited Features

- Dark mode, because we want to be respectful
- Posts
- Pages, including custom error pages
- No visible authors, categories, or tags on posts and pages
- No header or footer
- No pagination for the home page
- A feed.xml containing an Atom feed, but no JSON or outdated RSS feeds
- A sitemap.xml, because search engines should index us properly
- No semantic info like Open Graph, Twitter cards, or JSON-LD, but inline Microdata

## Minutiae

### Default Colors

The default colors are the colors of the respective browsers, both in light and in dark mode.

### Favicon

`/assets/icons/icon.webp` is the favicon for the light mode, and there's also a dark variant `/assets/icons/icon-dark.webp` for dark mode. They will be used automatically or you can replace them by creating new ones in the same location.

### Nix?

“Nix” is the grammatically incorrect form of the German “nichts”, which in English means “nothing”. It's colloquially used to stress the nothingness.

Or, if you will, it could be UNIX without the “U”, because of the theme's somewhat archaic properties.

## Installation

Installation from Gem is recommended, but using a remote theme is also possible, even though it will increase build times a little, depending on your internet connection and the size of the theme download, because it will be downloaded during each build. Gems are installed locally.

GitHub Pages gem users need to use the remote theme method.

### Installation from Gem

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-theme-nix", group: [:jekyll_plugins]
```

Then run `bundle` in your terminal.

```sh
bundle
```

Also add the theme to your Jekyll site's `_config.yml`:

```yaml
theme: jekyll-theme-nix
```

Make sure that this is the only `theme:` in `_config.yml`, and that there are no other `remote-theme:`.

### Installation as Remote Theme

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-remote-theme", group: [:jekyll_plugins]
```

Then run `bundle` in your terminal.

```sh
bundle
```

Finally add the remote theme to your Jekyll site's `_config.yml`:

```yaml
remote_theme: michaelnordmeyer/jekyll-theme-nix
```

Make sure that this is the only `remote_theme:` in `_config.yml`, and that there are no other `theme:`.
