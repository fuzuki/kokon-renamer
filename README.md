kokon-renamer
=============

(ご存じ)古今東西噺家紳士録のファイル名と形式を変更するツール。
出力拡張子はm4v。

必須：(ubuntu 12.4)
 ffmpeg
 libavcodec-extra-53
 ruby 1.9以降

使い方：
 ruby kokon_conb.rb <json> <indir> <outdir>
 <json>:kokon.jsonまたはgozonji.json。makekokonlist.rbで生成
 <indir>:元になるmovファイルのあるディレクトリ
 <outdir>:変換後のファイルを出力するでぃレクトリ

