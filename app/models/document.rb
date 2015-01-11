class Document

  PROJECT_DOCUMENT_FOLDER = 'project_documents'
  PUBLIC_PATH = '/public'

  def self.save(upload, project_id)
    filename = File.basename upload.original_filename
    raise if %w(. ..).include? filename
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
    raise unless folder.match /\d+/
    File.join(Rails.root, PUBLIC_PATH, PROJECT_DOCUMENT_FOLDER, folder)
  end

end
