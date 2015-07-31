class Item < ActiveRecord::Base

  default_scope { order('updated_at DESC')}

  belongs_to :user

  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end


end


