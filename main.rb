require 'sinatra'
require 'yaml'
require 'json'

get '*' do
	open('get.log', 'a') do |f|
		thing = JSON.parse(JSON.pretty_generate(request.env)).to_yaml

		puts thing
	end
end

post '*' do
	open('post.log', 'a') do |f|
		thing = JSON.parse(JSON.pretty_generate(request.env)).to_yaml

		puts thing
	end
end
