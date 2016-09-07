##
# will create html for every image inside `data/NNNN`
# and write to `screens.html`
#
# how to use this file:
# $ ruby imagegen.rb
##

dirs = []
html = ''

Dir.foreach('site/data/') do |directory|
	next if directory == '.' or directory == '..'

	dirs.push(directory)
end

dirs = dirs.each_slice(4).to_a

dirs.each do |dir|
	html = html.concat('<div class="row">')

	dir.each do |id|
		image = Dir.glob('site/data/' + id + '/full.*')
		if not image.count == 1
			image = 'error!!11 image not found'
		else
			image = image[0].split('/').last
		end

		html = html.concat("\n")
		html = html.concat('    <a href="data/' + id + '/' + image + '"><img class="image" src="data/' + id + '/thumb.png"></a>')
	end

	html = html.concat("\n</div>\n")
end

template = File.read('site/screens.tmpl')
render = template.gsub(/\{contents\}/, html)
File.open('site/screens.html', 'w') { |file| file.puts render }
