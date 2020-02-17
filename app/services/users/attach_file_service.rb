module Users::AttachFileService
  def self.upload_record_file(record, method, file)
    record.send(method).attach(file)
  end
end
