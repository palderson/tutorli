class Mailer < ActionMailer::Base
  default from: "noreply@yourdomain.com"

  def purchase_notification(payment)
    @payment = payment.enrolment
    @course = course
    @course_name = HTMLEntities.new.decode(course.name)
    mail(:to => publisher.user.email, :subject => "You have a new enrolment")
  end

  def enrolment_confirmation(enrolment)
    @enrolment = enrolment.user
    @enrolment = enrolment
    @course_name = HTMLEntities.new.decode(course.name)
    mail(:to => enrolment.user.email, :subject => "You've enrolled in a Skillgent course")
  end
end
