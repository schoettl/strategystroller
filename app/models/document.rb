class Document

  # Sorry for this class. This is not a real Model class, but it also
  # represents an entity: a document. a project can have any number of
  # attached documents.
  #
  # We didn't wanted to save the files in the database, so we save them
  # in the file system. This class implements the access to this files.
  #
  # Warning: The documents are stored in and served from the public folder.
  # See constants below.

  MAX_FILE_SIZE = 20e6

  PROJECT_DOCUMENT_FOLDER = 'project_documents'
  PUBLIC_PATH = '/public'

  def self.save(upload, project_id)
    filename = File.basename upload.original_filename
    if %w(. ..).include?(filename) || upload.size > MAX_FILE_SIZE
      raise 'Invalid parameters: original filename or size'
    end
    path = File.join(document_folder_path(project_id), filename)
    FileUtils.mkdir_p File.dirname(path)
    File.open(path, 'wb') { |f| f.write(upload.read) }
  end

  def self.list(project_id)
    path = document_folder_path project_id
    return [] unless File.directory? path
    Dir.entries(path).reject { |f| File.directory? f }
  end

  private

  def self.document_folder_path(project_id)
    folder = project_id.to_s
    unless folder.match /\d+/
      raise 'Invalid project id'
    end
    File.join(Rails.root, PUBLIC_PATH, PROJECT_DOCUMENT_FOLDER, folder)
  end

end
