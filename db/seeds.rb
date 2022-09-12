# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'uri'
require 'net/http'
require 'openssl'
require 'json'

moviesarray = [
  "tt0944947",
  "tt6277462",
  "tt11564570",
  "tt5500218",
  "tt0120737",
  "tt0092099",
  "tt14309446"
]

moviesarray.each do |movie|
  sleep(1)
  url = URI("https://online-movie-database.p.rapidapi.com/title/get-full-credits?tconst=#{movie}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["X-RapidAPI-Key"] = '42a85cc94dmsh3dcf849b3dc46e7p19dc94jsn0aab7a5b474c'
  request["X-RapidAPI-Host"] = 'online-movie-database.p.rapidapi.com'

  response = http.request(request)
  #puts response.read_body

  data = response.read_body

  year = (JSON.parse(data)["base"]["year"]).to_s

  puts year
end
