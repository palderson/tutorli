module AdminsHelper
  def pay_button(publisher)
    options = {:remote => true, :class => "btn", :method => :post}
    link_to "Mark as Paid", pay_publisher_admin_path(publisher), options
  end
end
