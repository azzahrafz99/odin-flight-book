task :analyze_code do
  sh 'bundle exec rubocop app config lib'
end
