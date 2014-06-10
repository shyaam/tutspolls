class Poll < ActiveRecord::Base
  # Relationships
  has_many :questions
  has_many :replies

  # Validations
  validates_presence_of :title

  def serialize_for_graph
    PollSerializer.count_per_month(self).to_json
  end
end
