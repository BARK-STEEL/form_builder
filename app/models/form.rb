class Form < ActiveRecord::Base

  has_many :submissions, :dependent => :destroy
  has_many :form_fields,-> { order "position" }, :dependent => :destroy

  accepts_nested_attributes_for :form_fields, :allow_destroy => true

  scope :published, -> { where(published: true) }

end
