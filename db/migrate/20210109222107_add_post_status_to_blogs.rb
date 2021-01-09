class AddPostStatusToBlogs < ActiveRecord::Migration[6.1]
  def change
    # default 0 default status enums work with integers
    add_column :blogs, :status, :integer, default: 0
  end
end
