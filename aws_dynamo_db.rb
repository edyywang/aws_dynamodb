# load 'aws_dynamo_db.rb'

require 'dotenv'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'base64'

class AwsDynamoDb

  Dotenv.load
  DYNAMO_DB_ACCESS_KEY = ENV['DYNAMO_DB_ACCESS_KEY']
  DYNAMO_DB_SECRET_KEY = ENV['DYNAMO_DB_SECRET_KEY']

  def initialize

  end

  def write_log

  end

  def read_log

  end

end
