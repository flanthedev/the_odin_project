require 'rest-client'
url = "http://localhost:3000/users"
puts RestClient.get(url)

line_break = "\n\n" + "-"*60 + "\n\n\n"
puts line_break

new_user_url = "http://localhost:3000/users/new"
puts RestClient.get(new_user_url)

puts line_break

edit_user_url = "http://localhost:3000/users/:id/edit"
puts RestClient.get(edit_user_url)

puts line_break

show_user_url = "http://localhost:3000/users/:id"
puts RestClient.get(show_user_url)

puts line_break

puts RestClient.post(url,"")
