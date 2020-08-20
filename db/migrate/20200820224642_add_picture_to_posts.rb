class AddPictureToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts,:picture, :text
  end
end
