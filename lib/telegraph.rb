require 'faraday'
require 'uri'
require 'nokogiri'
require 'JSON'
require_relative 'telegraph/node_helper'
require_relative 'telegraph/connection'
require_relative 'telegraph/client'
require_relative 'telegraph/account'
require_relative 'telegraph/page'

module Telegraph
  extend Telegraph::Connection

  def self.client(token)
    @client ||= Client.new(token)
  end

  def self.create_account(attrs = {})
    check_short_name(attrs)
    response = get('createAccount', attrs)
    Account.new(response['result'])
  end

  private

  def self.check_short_name(attrs)
    message = "short_name can't be nil or blank"
    raise ArgumentError, message if attrs[:short_name].nil? || attrs[:short_name] == ''
  end
end