class NotificationsMailer < ActionMailer::Base
  default :from => "mailer@yourdomain.com"
  default :to => "something@yourdomain.com"
  
  def new_message(message)
    @message = message
    mail(:subject => "Site Name Site Contact - #{message.subject}")
  end
end
