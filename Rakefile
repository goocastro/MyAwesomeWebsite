task :deploy do
  puts "Deploying to server..."
  system("rsync -rltvz -e ssh public views app.rb config.ru root@gustavocastro.com:/var/www/gustavocastro.com/")
  puts "Changing owner..."
  system("ssh root@gustavocastro.com chown -R www-data:www-data /var/www/gustavocastro.com/")
  puts "Reloading apache..."
  system("ssh root@gustavocastro.com /etc/init.d/apache2 reload")
end 

