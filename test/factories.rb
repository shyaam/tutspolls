FactoryGirl.define do
  factory :answer do
  end

  factory :reply do
  end

  factory :possible_answer do
    title "Possible Answer"
  end

  factory :question do
    title "Question #"
    kind "choice"

    factory :full_question do
      ignore do
        answers_count 5
        possible_answers_count 5
      end

      after(:create) do |question, evaluator|
        create_list :answer,
          evaluator.answers_count,
          question: question,
          possible_answer_id: 1

        create_list :possible_answer,
          evaluator.possible_answers_count,
          question: question
      end
    end
  end

  factory :poll do
    title "Testing poll"

    factory :full_poll do

      ignore do
        replies_count 5
        questions_count 5
      end

      after(:create) do |poll, evaluator|
        create_list :full_question, evaluator.questions_count, poll: poll
        create_list :reply, evaluator.replies_count, poll: poll
      end
    end
  end
end
