# Jekyll Theme Nix

A barebones theme for [Jekyll](https://github.com/jekyll/jekyll), which doesn't need any dependencies except `jekyll-redirect-from`, if you want to redirect pages. It is optimized for fast build speeds as well.

Its purpose is to be a minimalistic, single-author theme. Because there is no menu, pages can be manually linked in the body of `index.md`.

It also changes as little as possible from the default browser settings to improve legibility.

[Demo](https://jekyll-theme-nix.michaelnordmeyer.com/)

If this theme feels to bloated to you, you can try [<q>Nixer</q>](https://github.com/michaelnordmeyer/jekyll-theme-nixer), the ultra-minimalistic version of <q>Nix</q>.

## Limited Features

- Dark mode, because we want to be respectful
- Posts
- Pages, including custom error pages
- No visible authors, categories, or tags
- No header or footer
- No pagination for the home page
- A feed.xml containing an Atom feed, but no JSON or outdated RSS feeds
- A sitemap.xml, because search engines should index us
- No semantic info like Open Graph, Twitter cards, or JSON-LD, but inline Microdata

## Minutiae

### Default Colors

The default browser link colors don't look great, if they're inverted in dark mode, just like white is inverted to black for the background:

- Link: <span style="background-color: white; color: #0000ee">&nbsp;#0000ee&nbsp;</span> => <span style="background-color: black; color: #ffff11">&nbsp;#ffff11&nbsp;</span>
- Link visited: <span style="background-color: white; color: #551a8b">&nbsp;#551a8b&nbsp;</span> => <span style="background-color: black; color: #aae574">&nbsp;#aae574&nbsp;</span>

Therefore, they're set to somewhat lighter versions of the default colors:

- Link: <span style="background-color: white; color: #0000ee">&nbsp;#0000ee&nbsp;</span> => <span style="background-color: black; color: lightskyblue">&nbsp;lightskyblue&nbsp;</span>
- Link visited: <span style="background-color: white; color: #551a8b">&nbsp;#551a8b&nbsp;</span> => <span style="background-color: black; color: plum">&nbsp;plum&nbsp;</span>

### Favicon

The favicon is currently `icon.webp` for the light mode, and there's also a dark variant `icon-dark.webp`.

### Nix?

<q>Nix</q> is the grammatically incorrect form of the German <q>nichts</q>, which in English means <q>nothing</q>. It's colloquially used to stress the nothingness.

Or, if you will, it could be UNIX without the <q>U</q>, because of the theme's somewhat archaic properties.

## Installation

Installation from Gem is recommended, but using a remote theme is also possible, even though it will increase build time a little, depending on your internet connection.

### Installation from Gem

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-theme-nix"
```

And add this line to your Jekyll site's `_config.yml`:

```yaml
theme: jekyll-theme-nix
```

Make sure that this is the only `theme:` in `_config.yml`. Afterwards run `bundle install`.

### Installation as Remote Theme

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-remote-theme"
```

And add this line to your Jekyll site's `_config.yml`:

```yaml
remote_theme: michaelnordmeyer/jekyll-theme-nix
```

Make sure that this is the only `remote_theme:` in `_config.yml`, and that there are no other `theme:`.

Finally, add `jekyll-remote-theme` to your plugin section in `_config.yml` as well.

## Feed.xml and Sitemap.xml

Both are included in the theme and don't need dependencies to `jekyll-feed` or `jekyll-sitemap`. For a standard Jekyll installation, they work out-of-the-box.

If hosted with the Github pages plugin, those plugins are already included and will automatically be used instead. To overwrite this, both files have to be copied manually from the theme's repository root to the site's repository root.
