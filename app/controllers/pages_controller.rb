class PagesController < ApplicationController
  def home
    @courses = Course.is_published.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @courses }
    end
  end

  def about
  end

  def policy
    @courses = []
  	Category.all.each do |cat|
      course = cat.courses.latest.first
  		@courses << course if course
  	end
  	@courses = @courses[0..7] if @courses.length > 8
    @categories = Category.all
  end

  def teach
  end
end
