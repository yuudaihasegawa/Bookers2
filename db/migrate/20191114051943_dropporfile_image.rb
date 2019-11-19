class DropporfileImage < ActiveRecord::Migration[5.2]
  def change
  	drop_table :profile_images
  end
end
