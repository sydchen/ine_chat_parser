# encoding: utf-8
# http://snippets.aktagon.com/snippets/257-how-to-use-activerecord-without-rails
require 'time'
require 'date'
# require 'groupdate'
# require 'chartkick'
require 'active_record'
require './app'

# sed -i.bak  "s/🏻//g"  line_talk_backup_2016_05.tx
line_no = 0
line_to_dates = {}
date = Date.today

file_name = ARGV[0] || 'taipei.txt'
File.open(file_name, "r").each_line do |line|
  line_no += 1
  if match = line.match(/(\d+:\d+)\t(.+)\t(.*)/)
    time = Time.parse(match[1], date)
    name = match[2]
    user = User.find_or_create_by(name: name) { |u| u.active = true }
    context = match[3].to_s.chomp.truncate(100)#.gsub(regex, '')

    user.posts.create(context: context, spoke_at: time)
  elsif match = line.match(/(\d{4}\/\d{2}\/\d{2})(.*)/)
    line_to_dates[line_no] = match[1]
    date = Time.parse(match[1])
  end
end
