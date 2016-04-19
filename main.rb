require 'sinatra'
require 'yaml'
require 'json'

get '*' do
	open('get.log', 'a') do |f|
		thing = {
			env: JSON.parse(JSON.pretty_generate(request.env)),
			params: params,
			body: request.body.read.to_s

		} .to_yaml

		f.puts thing
	end
end

post '*' do
	open('post.log', 'a') do |f|
		thing = {
			env: JSON.parse(JSON.pretty_generate(request.env)),
			params: params,
			body: request.body.read.to_s

		} .to_yaml

		f.puts thing
	end
end
