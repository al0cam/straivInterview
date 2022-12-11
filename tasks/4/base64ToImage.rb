require 'base64'
require 'fileutils'

class Base64ToImage
    
    def read_base64_from_file(path)
        @file_data = File.open(path, 'r').read.gsub!("data:image/png;base64,","")
    end

    def write_image_to_file(path)
        FileUtils.mkdir_p(dirname) unless File.directory?(path)
        File.open(path, 'wb') do |f|
            f.write(Base64.decode64(@file_data))
        end
    end
end

reader = Base64ToImage.new
reader.read_base64_from_file("./tasks/4/base64.txt")
# reader.write_image_to_file("./tasks/4/rails/tmp/image.png")
