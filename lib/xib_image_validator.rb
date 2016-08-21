require "rexml/document"

class XIBImageValidator
  def self.validate_directory(dirname)
  	puts dirname
    Dir["#{dirname}/**/*.xib"].each do |filename|
    	xml = REXML::Document.new File.new(filename)
    	xml.elements.each("//image") do |elem|
    		image = elem.attributes["name"]
    		puts "#{image}, in #{File.basename(filename)}"
    	end
    end
  end
end