class Reply < ActiveRecord::Base
  belongs_to :poll
  has_many :answers
end
