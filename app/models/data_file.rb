class DataFile < ActiveRecord::Base
   PATH="/public/data/"
   def self.save(upload,project_id)
    Rails.logger = Logger.new(STDOUT)
    name =upload['data'].original_filename
    # create the file path
    path = File.join( Rails.root,PATH)
    path = File.join( path,project_id)
    path = File.join(path, name)
    logger.info " path = File.join(path, name)"
    # crate path
    FileUtils.mkdir_p File.dirname(path)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['data'].read) }
  end
  
  def self.documents(project_id)
    path = File.join( Rails.root,PATH)
    path = File.join( path,project_id.to_s)
    Dir.glob(path+"/*")
  end

  def self.show_document(project_id,filename)
    Rails.logger = Logger.new(STDOUT)
    logger.info "Dir.glob(path)" 
    path = File.join( Rails.root,PATH)
    logger.info "Dir.glob(path)"
    path = File.join( path,project_id)
    logger.info "Dir.glob(path)"
    #unless File.exist(path)? 
    #end
    #File.open(path, "r")
    logger.info "Dir.glob(path)"
    File.open(filename, "r")
  end
  def sanitize_filename(filename)
    filename.strip.tap do |name|
      # NOTE: File.basename doesn't work right with Windows paths on Unix
      # get only the filename, not the whole path
      name.sub! /\A.*(\\|\/)/, ''
      # Finally, replace all non alphanumeric, underscore
      # or periods with underscore
      name.gsub! /[^\w\.\-]/, '_'
    end
  end
  
end
