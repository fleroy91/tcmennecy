module ApplicationHelper
  def sub_menu_pages(page)
    Refinery::Menu.new(refinery_menu_pages.detect { |item| item.original_id == page.id }.children)
  end
end
