#!/usr/bin/env ruby -w
# Client stub to post stuff continuously to the Redis server

require "rubygems"
require "csv"
require "redis"

channel_title = ARGV[0] || "channel1"
username =  ARGV[1] || ENV['USER']

# Provide a clean stream to the 'loop'
ARGV.shift until ARGV.empty? 

conn_data = []
conn_data << channel_title
conn_data << username 

puts "Connected to channel '" + channel_title + "' as '" + username + "'."

redis_pub = Redis.new

loop do
	print username + " >> "
	chat = gets
	break if chat.chomp.eql?("exit") || chat.chomp.eql?("quit")
	post = conn_data + [chat]
	redis_pub.publish( channel_title, post.to_csv)
end
