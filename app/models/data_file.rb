class DataFile < ActiveRecord::Base
  # attr_accessible :title, :body
   def self.save(upload)
    #name =  upload['datafile'].original_filename
    name =  "test"
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  def open
    
  end
  def read
    
  end
end
