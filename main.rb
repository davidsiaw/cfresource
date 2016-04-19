require 'sinatra'
require 'yaml'
require 'json'

get '*' do
	open('/var/log/apache2/access.log', 'a') do |f|
		thing = JSON.parse(JSON.pretty_generate(request.env)).to_yaml

		f.puts thing
	end
end

post '*' do
	open('/var/log/apache2/error.log', 'a') do |f|
		thing = JSON.parse(JSON.pretty_generate(request.env)).to_yaml

		f.puts thing
	end
end
