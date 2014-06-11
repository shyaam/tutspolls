require "test_helper"

class PollSerializerAnswersPerQuestionTest < MiniTest::Test
  include FactoryGirl::Syntax::Methods

  attr_reader :poll

  def setup
    @poll = create :full_poll, replies_count: 5, questions_count: 5
    question = @poll.questions.first
    @stats = PollSerializer.answers_per_question(question)
  end

  def test_contains_data
    assert_includes @stats, :data
  end

end
