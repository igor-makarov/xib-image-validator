require "rexml/document"

class XIBImageValidator
  def self.validate_directory(options)
  	dirname = options[:dirname]
  	verbose = options[:verbose]
  	STDERR.puts "Scanning #{dirname}" if verbose
  	images = Set.new
  	images.merge Set.new Dir["#{dirname}/**/*.png"] { |f| strip_image_name(f) }
  	images.merge Set.new Dir["#{dirname}/**/*.pdf"] { |f| strip_image_name(f) }
  	STDERR.puts "Found #{images.count} distinct images in directory" if verbose

    Dir["#{dirname}/**/*.xib"].each do |filename|
    	xml = REXML::Document.new File.new(filename)
    	xml.elements.each("//image | //state | //imageView") do |elem|
    		if(elem.name == "image") 
    			image = elem.attributes["name"]
    		elsif (elem.name == "state" || elem.name == "imageView") 
    			image = elem.attributes["image"]
			end

			if(image) 
				imageTrimmed = strip_image_name(image)
				STDERR.puts "#{imageTrimmed} (<#{elem.name}/>) in #{File.basename(filename)}" if verbose
				if(!(images.include? imageTrimmed)) 
					STDERR.puts "The image reference \"#{image}\" does not have corresponding image" if verbose
					puts image
				end
			end
    	end
    end
  end
end

def strip_image_name(imageName)
	File.basename(imageName).sub(/(\@[0-9]x)?\..*/, "")
end