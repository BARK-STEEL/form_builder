class CreateSubmissions < ActiveRecord::Migration[5.0]
  def self.up
    create_table :submissions do |t|
      t.integer :form_id
      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
