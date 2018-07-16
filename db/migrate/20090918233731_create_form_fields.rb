class CreateFormFields < ActiveRecord::Migration[5.0]
  def self.up
    create_table :form_fields do |t|
      t.integer :form_id
      t.string :label
      t.string :tag
      t.text :values
      t.boolean :required, :default => 0
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :form_fields
  end
end
