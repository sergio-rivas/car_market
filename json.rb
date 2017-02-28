require 'json'
require 'open-uri'
make = "ford"
url = "https://www.carqueryapi.com/api/0.3/?callback=?&cmd=getModels&make=#{make}"
serialized = open(url).read
models = JSON.parse(serialized[2..-3])["Models"]

p models
