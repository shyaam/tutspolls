class Answer < ActiveRecord::Base
  belongs_to :reply
  belongs_to :question
end
