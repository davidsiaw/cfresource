require 'sinatra'
require 'yaml'

get '*' do
	open('get.log', 'a') do |f|
		thing = {
			params: params

		}.to_yaml

		f.puts thing
	end
end

post '*' do
	open('post.log', 'a') do |f|
		thing = {
			params: params

		}.to_yaml

		f.puts thing
	end
end
