require 'sinatra'
require 'yaml'
require 'json'
require 'fileutils'

get '*' do
	FileUtils.mkdir_p "/var/log/apache2/"
	open('/var/log/apache2/access.log', 'a') do |f|
		thing = JSON.parse(JSON.pretty_generate(request.env)).to_yaml

		f.puts thing
	end
end

post '*' do
	FileUtils.mkdir_p "/var/log/apache2/"
	open('/var/log/apache2/error.log', 'a') do |f|
		thing = JSON.parse(JSON.pretty_generate(request.env)).to_yaml

		f.puts thing
	end
end
