# -*- encoding: UTF-8 -*-
=begin
  古今東西噺家紳士録用の形式変換スクリプト
　Ubuntu 12.4では libavcodec-extra-53 が必要
=end

require 'json'

def kokon_conv(indir,outdir,h)
	infile = indir + "/"+ h["file"].downcase
	id = h["id"]
	title = h["title"]
	speaker = h["speaker"]
	newfname = outdir + "/#{id}#{speaker}「#{title}」.m4a"

	if File.exist?(infile)
		`ffmpeg -i #{infile} #{newfname}`
		#p "ffmpeg -i #{infile} #{newfname}"
	end
	
end

if ARGV.length < 3
	puts "  Usage:ruby kokon_chname.rb <json file> <indir> <outdir>"
	exit
end
if !File.exist?(ARGV[0])
	puts "  No Json File."
	exit
end
if !File.exist?(ARGV[1])
	puts "  No Input Directory."
	exit
end
if !File.exist?(ARGV[2])
	puts "  No Output Directory."
	exit
end

f = open(ARGV[0])
j = JSON.load(f)
f.close
j.each do |r|
	kokon_conv(ARGV[1],ARGV[2],r)
end

