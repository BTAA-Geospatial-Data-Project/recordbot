require 'json'
require 'fileutils' #for Windows os
puts "\n\n*********************************************************"
puts "What is your JSON file named? (Exclude the extension)"
inputfile = gets
inputfile = inputfile.chomp

string = File.read("./#{inputfile}.json")
doc = JSON.parse(string)


records = doc.count

i = 1
while i <= records do
output = "output #{i}"
uuid = doc["#{output}"][0]["uuid"]
dir1 = uuid


record = doc["#{output}"][0]

# changed for Windows os
FileUtils.mkdir "#{dir1}"

File.open("#{dir1}/geoblacklight.json","w") do |f|
  f.write(JSON.pretty_generate(record))
end

i += 1
end
