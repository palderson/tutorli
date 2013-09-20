module CoursesHelper
  def category_options
    Category.all.collect do |category|
      [category.name, category.id]
    end
  end

  def level_options
    Level.all.collect do |level|
      [level.number, level.id]
    end
  end
	
  def current_cat?(category)
    "active" if params[:category_id] && params[:category_id] == category.id.to_s
  end

  def current_lev?(level)
    "active" if params[:level_id] && params[:level_id] == level.id.to_s
  end  

  def current_pric?(price)
    "active" if params[:min] && params[:max] && params[:min] == price[:min].to_s && params[:max] == price[:max].to_s
  end  
  
  def edit_lesson_link(course, lesson)
    if current_user == course.publisher
      link_to "Edit Lesson", "/courses/#{course.id}/lessons/#{lesson.id}/edit", :class => 'btn btn-info'
    end
  end
  
  def new_lesson_link(course)
    if current_user == course.publisher
      link_to "Add Lesson", new_course_lesson_path(course), :class => 'btn btn-info'
    end
  end
end
