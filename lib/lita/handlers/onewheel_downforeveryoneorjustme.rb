require 'rest-client'
require 'nokogiri'

module Lita
  module Handlers
    class OnewheelDownForEveryoneOrJustMe < Handler
      route /^isitdown (.*)/, :down_for_everyone_or_just_me, command: true
      route /^down (.*)/, :down_for_everyone_or_just_me, command: true

      def down_for_everyone_or_just_me(response)
        uri = 'www.downforeveryoneorjustme.com/' + response.matches[0][0]
        Lita.logger.info "Calling down for everyone or just me with #{response.matches[0][0]}"
        text = get_reply(uri)
        response.reply text[1].strip
      end

      def get_reply(uri)
        response = RestClient.get(uri)
        noko = Nokogiri.HTML(response)
        container_text = noko.css('#container').text.split(/\n/)

      end
      Lita.register_handler(self)
    end
  end
end
