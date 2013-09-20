class EnrolmentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @course = Course.find(params[:course_id])
    @enrolment = @course.enrolments.build
  end

  def create
    Rails.logger.debug params
    @enrolment = current_user.enrolments.build(params[:enrolment])
    if @enrolment.save_with_payment
      redirect_to show_enrolled_course_path(@enrolment.course), :notice => "Thank you for enrolling!"
      # Mailer.enrolment_confirmation(enrolment).deliver
      # Mailer.purchase_notification(payment).deliver
    else
      render :new
    end
  end

end