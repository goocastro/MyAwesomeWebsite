task :deploy do
  puts "Deploying to server..."
  system("rsync -rltvz -e ssh Gemfile public views app.rb config.ru goo@gustavocastro.com:/srv/http/gustavocastro.com/")
  puts "Bundlling..."
  system("ssh goo@gustavocastro.com cd /srv/http/gustavocastro.com | bundle install --path ./vendor/cache")
end 

