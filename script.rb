#require 'nokogiri'
require 'fileutils'
require 'htmlbeautifier'

TargetDirectory = './target'
FileUtils.rm_rf(TargetDirectory)
FileUtils.mkdir(TargetDirectory)



def get_header(file_name)
title = file_name.sub(/^\d*\s/,'').sub(/.html$/,'')

header = %{
<!DOCTYPE html>
<html>
<head>
<title>#{title} - The Celtic Wiki</title>
</head>
<body>
}
end


footer = %{
</body>
</html>
}

path = './*.html'
Dir[path].each do |f| 
  name = File.basename(f)

  file = File.open(f).read 
  # I am sure these can be made to be one line
  target = File.new('./target/'+name,'w')
  header = get_header(name)

  target.write(HtmlBeautifier.beautify(header + file + footer))
  target.close
end

#file = File.open("users.txt").read 
#beautiful = HtmlBeautifier.beautify(header + file + footer)

