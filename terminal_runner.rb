require 'http'

response = HTTP.get("http://localhost:3000/api/all_products_url").parse

puts JSON.pretty_generate(response)