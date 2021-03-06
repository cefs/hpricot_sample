require 'hpricot'
require 'open-uri'

puts 'Digite o twitter que deseja acessar:'
puts 'Exemplo: caelum'

twitter = gets

twitter.chomp

twitter = "caelum" if twitter.empty?

doc = Hpricot(open("http://twitter.com/#{twitter}"))
items = doc / ".stream-item"

items.each do |item|
	tweet = item / ".tweet .js-tweet-text"
	puts tweet.inner_text
	puts "----------\n\n"
end
