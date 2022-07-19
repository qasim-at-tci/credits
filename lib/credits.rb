# frozen_string_literal: true

require 'credits/version'
require 'credits/credits'
require 'thor'

module Credits
  class Error < StandardError; end

  class CLI < Thor
    desc 'remaining [token][username]', 'Gives back remaining credits of Travis account'
    def remaining(token, username)
      Credits.request_remaining(token, username)
    end

    desc 'usage [from][to][token][username]', 'Gives back repository usage data of Travis account'
    def usage(from, to, token, username)
      Credits.request_usage(from, to, token, username)
    end
  end
end
