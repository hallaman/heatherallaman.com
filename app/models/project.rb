class Project < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :project_due

  attribute :file_upload, attachment: true, validate: :ok_format?

  attribute :nickname,  :captcha  => true

  def ok_format?
    unless file_upload.nil?
      ext = File.extname(file_upload)

      if !%w( .jpg .jpeg .png .pdf .bmp .eps .docx .doc .tiff .ai .psd .raw .xd .dng ).include? ext.downcase 
        self.errors.add(:file_upload, ext + " not a valid file type. Only images, PDFs, and design files allowed.")
      end
    end
  end

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => %(#{name} wants to collaborate),
      :to => "heather.allaman@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
