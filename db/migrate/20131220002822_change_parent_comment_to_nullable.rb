class ChangeParentCommentToNullable < ActiveRecord::Migration
  def change
    remove_column :comments, :parent_comment_id
    add_column :comments, :parent_comment_id, :integer
  end
end
