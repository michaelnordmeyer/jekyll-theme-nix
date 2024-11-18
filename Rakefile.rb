# frozen_string_literal: true

## Deployment settings
artefact = "jekyll-theme-nix"
domain = "#{artefact}.michaelnordmeyer.com"
ssh_domain = "michaelnordmeyer.com"
ssh_port = 1111
ssh_user = "root"
ssh_path = "/var/www/#{domain}/"

task :default => ["build"]

desc "Builds the site for deployment"
task :build do
  puts "==> Building #{domain}..."
  system "JEKYLL_ENV=\"production\" bundle exec jekyll build"
end

desc "Serves the site locally"
task :serve do
  puts "==> Building and serving #{domain} locally..."
  system "bundle exec jekyll serve"
end

desc "Deploys the content of ./_site to the server via rsync"
task :rsync do
  puts "==> Rsyncing #{domain}'s content to SSH host #{ssh_domain}"
  system "rsync -e 'ssh -p 1111' -vcrlptDShP --delete --rsync-path 'sudo -u root rsync' --chmod=Du=rwx,Dgo=rx,Fu=rw,Fgo=r \
    --exclude=.DS_Store \
    --exclude=._* \
    --exclude=.git \
    --exclude=.gitignore \
    _site/ \
    #{ssh_user}@#{ssh_domain}:#{ssh_path}"
  system 'rm -rf _site'
end

desc "Gzips the site via SSH"
task :gzip do
  puts "==> Gzip'ing #{domain} via SSH..."
  system "ssh -p #{ssh_port} #{ssh_user}@#{ssh_domain} 'for file in $(find #{ssh_path} -type f -name \"*.html\" -o -name \"*.css\" -o -name \"*.css.map\" -o -name \"*.js\" -o -name \"*.svg\" -o -name \"*.xml\" -o -name \"*.xsl\" -o -name \"*.xslt\" -o -name \"*.json\" -o -name \"*.txt\"); do printf . && gzip -kf \"${file}\"; done; echo'"
end

desc "Builds the robots.txt"
task :robots do
  puts "==> Building #{domain} robots.txt..."
  system "printf 'Sitemap: https://#{domain}/sitemap.xml\n\n' > robots.txt"
	system "cat ../robots.txt >> robots.txt"
end

desc "Cleans the source dir"
task :clean do
  puts "==> Cleaning #{domain}..."
  system "bundle exec jekyll clean"
end

desc "Builds the gem"
task :gembuild do
  puts "==> Building #{artefact} gem..."
  sh "gem build #{artefact}.gemspec"
end

desc "Installs the gem locally according to the gemspec’s version"
task :geminstall do
  puts "==> Installing #{artefact} gem locally..."
  sh "gem install --local #{artefact}-#{version}.gem"
end

desc "Uninstalls the gem according to the gemspec’s version"
task :gemuninstall do
  puts "==> Uninstalling #{artefact} gem..."
  sh "gem uninstall #{artefact} --version #{version}"
end

desc "Pushes the gem to rubygems.org according to the gemspec’s version"
task :gempush do
  puts "==> Pushing #{artefact} to rubygems.org..."
  sh "gem push #{artefact}-#{version}.gem"
end

desc "Pushes the gem to rubygems.org, needs version number like `rake gempush\[1.0.0\]`"
task :gempushversioned, [:version] do |task, args|
  puts "==> Pushing #{artefact} to rubygems.org..."
  sh "gem push #{artefact}-#{args[:version]}.gem"
end
