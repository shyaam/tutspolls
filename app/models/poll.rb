class Poll < ActiveRecord::Base
  # Relationships
  has_many :questions
  has_many :replies

  # Validations
  validates_presence_of :title
end
