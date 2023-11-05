# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-nix"
  spec.version       = "1.0.6"
  spec.authors       = ["Michael Nordmeyer"]
  spec.email         = ["michaelnordmeyer@users.noreply.github.com"]

  spec.summary       = "A very minimalistic, single-author Jekyll theme with almost default browser styling, and a dark mode."
  spec.homepage      = "https://github.com/michaelnordmeyer/jekyll-theme-nix"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml|feed\.xml|sitemap\.xml)!i) }

  spec.add_runtime_dependency "jekyll", ">= 3.9.3", "< 5.0"
end
