module CommonActions

  extend ActiveSupport::Concern

  def set_categories
    @parents = Category.all.order("id ASC").limit(13)
  end

end