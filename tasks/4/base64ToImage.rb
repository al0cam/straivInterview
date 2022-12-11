require 'base64'
require 'fileutils'

class Base64ToImage
    
    def read_base64_from_file(path)
        @file_data = File.open(path, 'r').read.gsub!("data:image/png;base64,","")
    end

    def write_image_to_file(path,fileName)
        FileUtils.mkdir_p(path) unless File.directory?(path)
        puts path+fileName
        File.open(path+fileName, 'wb') do |f|
            f.write(Base64.decode64(@file_data))
        end
    end
end

reader = Base64ToImage.new
reader.read_base64_from_file("./tasks/4/base64.txt")
reader.write_image_to_file("./tasks/4/rails/tmp/","image.png")
