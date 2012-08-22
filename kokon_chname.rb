f = open("kokon.txt","r")
#f.each do |line|
#puts line
#end

257.times do
num = f.gets.strip
title = f.gets.strip
hanashika = f.gets.strip
fname = f.gets.strip.downcase
fname = "kokon/" + fname + ".mov"
newfname = "new_kokon/#{hanashika}「#{title}」.mov"
`cp #{fname} #{newfname}`
#puts num + "," + newfname
end

#4.times do
#puts f.gets
#end

f.close
