f = open("gozonji.txt","r")
#f.each do |line|
#puts line
#end

271.times do
num = f.gets.strip
title = f.gets.strip
hanashika = f.gets.strip
fname = f.gets.strip.downcase
stime = f.gets

fname = "gozonji/" + fname + ".mov"
newfname = "new_gozonji/#{hanashika}「#{title}」.mov"
`cp #{fname} #{newfname}`
#puts num + "," + newfname
end

#4.times do
#puts f.gets
#end

f.close
