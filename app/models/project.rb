class Project < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  #attribute :file, attachment: true
  attribute :nickname,  :captcha  => true

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
