class LessonsController < ApplicationController
  # GET /lessons
  # GET /lessons.json
  def index
    if params[:course_id]
      @course = Course.find(params[:course_id])
      @lessons = @course.lessons
    else
      @lessons = Lesson.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @lessons }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @lesson }
    end
  end

  def new
    if params[:course_id]
      @course = Course.find(params[:course_id])
      @lesson = @course.lessons.build
    else
      @lesson = Lesson.new
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @lesson }
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
  end

  def create
    Rails.logger.debug params
    attributes = params[:lesson]
    attributes = extract_values if params[:content]

    if params[:course_id]
      @course = Course.find(params[:course_id])
      @lesson = @course.lessons.build(attributes)
    else
      @lesson = Lesson.new(attributes)
    end

    Rails.logger.debug @lesson.inspect

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to show_enrolled_course_path(@course), :notice => 'Lesson was successfully created. Publish from My Courses.' }
        format.json { render :json => @lesson, :status => :created, :location => @lesson }
      else
        format.html { render :action => "new" }
        format.json { render :json => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lessons/1
  # PUT /lessons/1.json
  def update
    if params[:course_id]
      @course = Course.find(params[:course_id])
      @lesson = Lesson.find(params[:id])
    else
      @lesson = Lesson.find(params[:id])
    end

    attributes = params[:lesson]
    attributes = extract_values if params[:content]

    respond_to do |format|
      if @lesson.update_attributes(attributes)
        format.html { redirect_to show_enrolled_course_path(@course), :notice => 'Lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url }
      format.json { head :no_content }
    end
  end

  private

  def extract_values
      attributes = params[:content] if params[:content]
      result = {}
      attributes.each do |key, value|
        result[key] = value[:value]
      end
      result
  end
end
