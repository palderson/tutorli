module ApplicationHelper
  include BootstrapFormBuilder::FormHelper
  
  def sidebar_info
    @categories = Category.all
    @levels = Level.all
    @prices = Course.prices_for_display
  end
  
  def flash_class(level)
    case level
    when :notice  then "alert alert-info"
    when :success then "alert alert-success"
    when :error   then "alert alert-error"
    when :alert   then "alert alert-error"
    end
  end
  
  def link_to_add_fields(name, f, association, options = {})
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    options[:class] = options[:class] || "" + " add_fields"
    options[:data] = {id: id, fields: fields.gsub("\n", "")}
    link_to(name, '#', options)
  end
  
  def paid?(was_paid)
    if was_paid 
      raw '<i class="icon-ok"></i>'
    else
      ''
    end
  end
  
  def short_date(date)
    if date
      date.strftime("%Y-%m-%d")
    else
      ""
    end
  end
end
