require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  
  
  private
  
  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
  
end