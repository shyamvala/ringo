require 'nokogiri'
require 'yaml'
require 'net/http'
require 'wrest'

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
        filter = {'view' => 'Story Wall'}
        Ringo::StoryCard.from_result get 'cards.xml', filter
      end

      def story number
        Ringo::StoryCard.from_card get "cards/#{number}.xml"
      end

      def wall
        result = {}

        stories.each do |story|
          next unless STATUSES.include? story.status
          result[story.status] ||= []
          result[story.status] << story
        end

        result
      end

      def base
        "https://#{host}/api/v2/projects/#{project}".to_uri(username: user, password: password)
      end

      def get url, params={}
        Nokogiri::XML base[url].get(params).body
      end
    end
  end
end
