class Poll < ActiveRecord::Base
  # Relationships
  has_many :questions

  # Validations
  validates_presence_of :title
end
