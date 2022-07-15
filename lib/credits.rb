require "credits/version"
require "credits/credits"
require 'thor'

module Credits
  class Error < StandardError; end
  
  class CLI < Thor
    desc "remaining [token][username]", "Gives back remaining credits of Travis account"
    def remaining(token, username)
      Credits.request_remaining(token, username)
    end
  end
end
