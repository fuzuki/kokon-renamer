# -*- encoding: UTF-8 -*-
=begin
  古今東西噺家紳士録用のjsonファイル作成スクリプト
　データはこちらから。http://weblog.simplifysimplify.net/
=end

require 'open-uri'
require 'json'
require 'kconv'

def getsnext(f)
	while l = f.gets
		if !(/^\s*$/ =~ l)
			return l.kconv(Kconv::UTF8, Kconv::SJIS)
		end
	end
	return nil
end

def makelist(url,outfile)
	bl = '<tr class="bl">'
	wh = '<tr class="wh">'
	a = []
	open(url) {|f|
		f.each_line {|line|
			if line.index(bl) || line.index(wh)
				h = {}
				/>(.+)</ =~ getsnext(f)
				h["id"] = $1
				/>(.+)</ =~ getsnext(f)
				/>(.+)</ =~ $1
				h["title"] = $1
				/>(.+)</ =~ getsnext(f)
				/>(.+)</ =~ $1
				h["speaker"] = $1
				/>(.+)</ =~ getsnext(f)
				/>(.+)</ =~ $1
				h["file"] = $1.downcase + ".mov"
				a << h
			end
		}
	}
	open(outfile,"w") do |f|
		JSON.dump(a,f)
	end
end

makelist("http://weblog.simplifysimplify.net/pix/kokon1.html","kokon.json")
makelist("http://weblog.simplifysimplify.net/pix/kokon2.html","gozonji.json")

