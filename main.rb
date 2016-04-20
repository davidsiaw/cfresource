require 'sinatra'
require 'yaml'
require 'json'
require 'net/http'

post "*" do
	if request["HTTP_X_AMZ_SNS_MESSAGE_TYPE"] == "SubscriptionConfirmation"

		puts "Received subscription confirmation request"
		content = JSON.read(request.body.read)

		uri = URI.new(content["SubscribeURL"])

		Net::HTTP.start(uri.host, uri.port,
			:use_ssl => uri.scheme == 'https') do |http|
			request = Net::HTTP::Get.new uri

			response = http.request request

			puts "Confirm status: #{response.code}"
		end
	end

	thing = {
		type: "POST",
		env: JSON.parse(JSON.pretty_generate(request.env)),
		params: params,
		body: request.body.read.to_s

	} .to_yaml

	puts thing

end

get '*' do
	thing = {
		type: "GET",
		env: JSON.parse(JSON.pretty_generate(request.env)),
		params: params,
		body: request.body.read.to_s

	} .to_yaml

	puts thing
end
