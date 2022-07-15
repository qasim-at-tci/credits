require 'httparty'

module Credits
	def self.request_remaining token, username
		@owner = nil
		@url = "https://api.travis-ci.com/v2_subscriptions"

		headers = { 
						"Authorization"  => "token #{token}",
						"Content-Type" => "application/json",
						"Accept" => "application/json",
						"Travis-API-Version" => "3",
						"path" => "/v2_subscriptions"
		}
		response = HTTParty.get(
		@url,
		:query => {format: :json},
		:headers => headers
		)

		if (response.code == 200)
			response['v2_subscriptions'].each do |sub|
				if sub['owner']['@type'] == "user" && sub['owner']['login'] == username
					@owner = username
				elsif sub['owner']['@type'] == "organization" && sub['owner']['login'] == username
					@owner = username
				end
			end
		else
		end

		if (response.code == 200 && @owner != nil)
			response['v2_subscriptions'].each do |sub|
				if sub['owner']['@type'] == "user" && sub['owner']['login'] == username
					owner = sub['owner']['login']
					remaining_credits = sub['addons'][0]['current_usage']['remaining']

					print "User: #{owner}\n"
					print "Remaining Travis CI Credits: #{remaining_credits}\n"
				elsif sub['owner']['@type'] == "organization" && sub['owner']['login'] == username
					owner = sub['owner']['login']
					remaining_credits = sub['addons'][0]['current_usage']['remaining']

					print "User: #{owner}\n"
					print "Remaining Travis CI Credits: #{remaining_credits}\n"
				end
			end
		else
			print "Wrong token or username"
		end
	end
end