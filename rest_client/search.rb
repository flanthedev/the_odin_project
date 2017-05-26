require 'rest-client'

@searches = 0

loop do

  def input
    puts "enter search term:"
    input = gets.chomp.gsub(" ","+")
    RestClient.get "https://www.bing.com/search?q=#{input}"
  end

  def output(label, data)
    puts "#{label} ".ljust(70, "-")
    if data.is_a?(Hash)
      data.each do |key, val|
        puts "\n#{key}:"
        puts "#{val}"
      end
    else
      puts "\n #{data}"
    end
    puts
  end

  def bing_search
    response = input
    output("Response Headers", response.headers)
    output("Response Cookies", response.cookies)
    output("HTTP Status Code", response.code)
    #output("Resphone Body", response.body)
    @searches += 1
    puts "-"*70+"\n"
    puts "\nSearches: \n\n#{@searches} search completed. Press Ctrl+C to exit\n\n"
    puts "#"*70+"\n\n\n"
  end

bing_search
end
