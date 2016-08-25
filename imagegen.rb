File.open("/home/homescreens/out.gen", "w") do |file|
    iter = 0
    Dir.foreach("/home/homescreens/site/images/thumb_sq") do |image|
        next if image == '.' or image == '..'
        path = "./images/thumb_sq/".concat(image)
        puts "Path: ".concat(path)
        fullpath = "./images/full/".concat(image)
        puts "Full Path: ".concat(fullpath)
        if File.file?('/home/homescreens/site/images/full/'.concat(image))
            link = './images/full/'.concat(image)
        else
            tmp = "".concat(image)
            link = './images/webm/'.concat(tmp[0..4].concat('webm'))
        end
        puts "Link: ".concat(link)
        if iter == 0
            file.write("<div class='row'>\n")
        end
        file.write("<a href='#{link}'><img class='image' src='#{path}' /></a>\n")
        iter = iter + 1
        if iter == 4
            file.write("</div>\n")
            iter = 0
        end
    end
    if not iter == 0
        file.write("</div>\n")
    end
end
