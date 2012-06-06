module Ringo
  class Mingle
    class << self
      def config
        @@config ||= YAML.load File.open('config/mingle.yml')
      end

      def user
        config['user']
      end

      def password
        config['password']
      end

      def project
        config['project']
      end

      def host
        config['host']
      end

      def stories
        Ringo::StoryCard.from_result get 'cards.xml'
      end

      def get url
        uri = URI("https://#{host}/api/v2/projects/#{project}/#{url}")

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
          request = Net::HTTP::Get.new uri.request_uri
          request.basic_auth user, password
          http.request request # Net::HTTPResponse object
        end

        Nokogiri::XML response.body
      end
    end
  end
end
