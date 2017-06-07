class AddAttachmentFlickImgToFlicks < ActiveRecord::Migration[5.1]
  def self.up
    change_table :flicks do |t|
      t.attachment :flick_img
    end
  end

  def self.down
    remove_attachment :flicks, :flick_img
  end
end
