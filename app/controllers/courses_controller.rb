class CoursesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def publish
    @course = Course.find(params[:id])
    @course.published = true
    @course.save
    redirect_to my_courses_path
  end

  def my
    @enrolments = current_user.enrolments.includes(:course => :lessons).all
    @published_courses = current_user.published_courses.includes(:lessons).all
  end

  # GET /courses
  # GET /courses.json
  def index
    search_attrs = {}
    [:min, :max, :level_id, :category_id].each do |key|
      search_attrs[key] = params[key] if params[key]
    end
    min = search_attrs.delete(:min)
    max = search_attrs.delete(:max)
    search_attrs[:price] = (min..max) if min && max
    @courses = Course.is_published.where(search_attrs).latest.includes(:lessons).page(params[:page]).per(9)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    enrolled = current_user && current_user.courses.all.include?(@course)
    @enrolment = @course.enrolments.build

    if enrolled || current_user == @course.publisher
      redirect_to show_enrolled_course_path(@course)
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @course }
      end
    end
  end

  def show_enrolled
    @course = Course.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new
    1.times { @course.lessons.build }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])
    @course.publisher = current_user
    respond_to do |format|
      if @course.save
        format.html { redirect_to new_course_lesson_path(@course), :notice => 'Course was successfully created.' }
        format.json { render :json => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, :notice => 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
end
