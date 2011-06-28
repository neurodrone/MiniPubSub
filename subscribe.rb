#!/usr/bin/env ruby -w
# Subcription stub which listens to newly arriving posts from Redis server pertaining to the given channel

require "rubygems"
require "csv"
require "redis"

channel_title = (ARGV[0].nil?) ? "*" : ARGV[0]
redis_sub = Redis.new

puts "Connected to channel '" + channel_title + "'."

redis_sub.psubscribe(channel_title) do |listen|
	listen.pmessage do |pattern, channel, post|
		CSV.parse(post) do |row|
			puts "--#{row[0]}-- (#{row[1]}): #{row[2]}"
		end
	end
end
