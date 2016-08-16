require 'bundler/gem_tasks'
require 'fileutils'

desc 'Update the Switchery Javascript and CSS files'
task :update do
  def remove_extra_version(version)
    version.scan(/(\d\.\d\.\d)/).flatten.first
  end

  def download_switchery(version)
    base_url = 'https://raw.githubusercontent.com/abpetkov/switchery'
    puts "Downlading Switchery #{version} ..."
    `curl -o vendor/assets/javascripts/switchery.js \
      #{base_url}/#{version}/dist/switchery.js`
    `curl -o vendor/assets/stylesheets/switchery.css \
      #{base_url}/#{version}/dist/switchery.css`
  end

  FileUtils.mkdir_p('vendor/assets/javascripts')
  FileUtils.mkdir_p('vendor/assets/stylesheets')
  download_switchery(remove_extra_version(Switchery::Rails::VERSION))
  puts "\e[32mDone!\e[0m"
end
