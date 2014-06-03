class Question < ActiveRecord::Base
  belongs_to :poll

  validates_presence_of :title, :kind
end
