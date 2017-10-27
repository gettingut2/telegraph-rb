require 'faraday'
require 'uri'
require 'nokogiri'
require 'JSON'
require 'singleton'
require_relative 'telegraph/node_helper'
require_relative 'telegraph/connection'
require_relative 'telegraph/client'
require_relative 'telegraph/account'
require_relative 'telegraph/page'
require_relative 'telegraph/configuration'

module Telegraph
  def self.setup(token)
    configuration.key = token
    @client = Client.new(configuration.key)
  end

  def self.client
    @client ||= Client.new(configuration.key)
  end

  def self.create_account(attrs = {})
    client.create_account(configuration, attrs)
  end

  def self.configuration
    Configuration.instance
  end

  private

  def self.check_short_name(attrs)
    message = "short_name can't be nil or blank"
    raise ArgumentError, message if attrs[:short_name].nil? || attrs[:short_name] == ''
  end
end