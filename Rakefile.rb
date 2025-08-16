# frozen_string_literal: true

## Deployment settings
gemspec = File.absolute_path(File.basename(File.dirname(__FILE__)) + ".gemspec")
artefact = Gem::Specification::load(gemspec).name
version = Gem::Specification::load(gemspec).version
domain = "#{artefact}.michaelnordmeyer.com"
ssh_domain = 'michaelnordmeyer.com'
ssh_port = 1111
ssh_user = 'root'
ssh_path = "/var/www/#{domain}/"

task :default => ["build"]

desc 'Builds the robots.txt'
task :robots do
  puts "==> Building #{domain} robots.txt..."
  sh "printf 'Sitemap: https://#{domain}/sitemap.xml\\n\\n' > robots.txt"
  sh "printf 'User-agent: *\\nDisallow: /\\n' >> robots.txt"
end

desc 'Beautifies kramdown output'
task :beautify do
  puts "==> Beautifying #{domain} kramdown output..."
  sh "for file in _site/*.html _site/**/*.html; do sed -i '' -E 's,<((br|hr|img|link|meta).*) />,<\\1>,g' ${file}; done"
  sh "for file in _site/*.html _site/**/*.html; do sed -i '' -E 's/ class=\"footnotes?\"//g' ${file}; done"
  sh "for file in _site/*.html _site/**/*.html; do sed -i '' -E 's/ class=\"reversefootnote\"//g' ${file}; done"
end

desc 'Builds the site for deployment'
task :build do
  Rake::Task[:robots].invoke
  puts "==> Building #{domain}..."
  sh 'JEKYLL_ENV="production" bundle exec jekyll build'
  Rake::Task[:beautify].invoke
end

desc 'Serves the site locally'
task :serve do
  Rake::Task[:robots].invoke
  puts "==> Building and serving #{domain} locally..."
  sh 'bundle exec jekyll serve'
end

desc 'Syncs the content of ./_site to the server via rsync'
task :rsync do
  puts "==> Rsyncing #{domain}'s content to SSH host #{ssh_domain}"
  sh "rsync -e 'ssh -p #{ssh_port}' -vcrlptDShP --delete --rsync-path 'sudo -u root rsync' --chmod=Du=rwx,Dgo=rx,Fu=rw,Fgo=r \
    --exclude=.DS_Store \
    --exclude=._* \
    --exclude=.git \
    --exclude=.gitignore \
    _site/ \
    #{ssh_user}@#{ssh_domain}:#{ssh_path}"
end

desc 'Copies robots.txt to the server via scp'
task :scprobots do
  puts "==> Scp'ing #{domain} robots.txt to SSH host #{ssh_domain}"
  sh "scp -P #{ssh_port} robots.txt #{ssh_user}@#{ssh_domain}:#{ssh_path}/"
end

desc 'Compresses the site via SSH'
task :compress do
  puts "==> Compressing #{domain} via SSH..."
  sh "ssh -p #{ssh_port} #{ssh_user}@#{ssh_domain} 'for file in $(find #{ssh_path} -type f -size +1400c -regex \".*\\.\\(css\\|map\\|html\\|js\\|json\\|svg\\|txt\\|xml\\|xsl\\|xslt\\)$\"); do printf . && gzip -kf \"${file}\" && brotli -kf -q 4 \"${file}\"; done; echo'"
end

desc 'Compresses robots.txt via SSH'
task :compressrobots do
  puts "==> Compressing #{domain} robots.txt via SSH..."
  sh "ssh -p #{ssh_port} #{ssh_user}@#{ssh_domain} 'gzip -kf #{ssh_path}robots.txt && brotli -kf -q 4 #{ssh_path}robots.txt'"
end

desc 'Builds and deploys the site'
task :deploy do
  puts "==> Building and deploying #{domain}..."
  Rake::Task[:build].invoke
  Rake::Task[:rsync].invoke
  Rake::Task[:compress].invoke
  Rake::Task[:clean].invoke
end

desc 'Builds and deploys the robots.txt'
task :deployrobots do
  puts "==> Building and deploying #{domain} robots.txt..."
  Rake::Task[:robots].invoke
  Rake::Task[:scprobots].invoke
  Rake::Task[:compressrobots].invoke
end

desc 'Cleans the source dir'
task :clean do
  puts "==> Cleaning #{domain}..."
  sh 'bundle exec jekyll clean'
end

desc 'Builds the gem'
task :gembuild do
  puts "==> Building #{artefact} gem..."
  sh "gem build #{artefact}.gemspec"
end

desc 'Installs the gem locally according to the gemspec\'s version'
task :geminstall do
  puts "==> Installing #{artefact} gem locally..."
  sh "gem install --local #{artefact}-#{version}.gem"
end

desc 'Uninstalls the gem according to the gemspec\'s version'
task :gemuninstall do
  puts "==> Uninstalling #{artefact} gem..."
  sh "gem uninstall #{artefact} --version #{version}"
end

desc 'Pushes the gem to rubygems.org according to the gemspec\'s version'
task :gempush do
  puts "==> Pushing #{artefact} to rubygems.org..."
  sh "gem push #{artefact}-#{version}.gem"
end

desc 'Pushes the gem to rubygems.org, needs version number like `rake gempush\[1.0.0\]`'
task :gempushversioned, [:version] do |task, args|
  puts "==> Pushing #{artefact} to rubygems.org..."
  sh "gem push #{artefact}-#{args[:version]}.gem"
end
