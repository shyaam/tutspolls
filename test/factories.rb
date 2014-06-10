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
  end

  factory :poll do
    title "Testing poll"

    factory :full_poll do

      ignore do
        replies_count 5
        questions_count 5
      end

      after(:create) do |poll, evaluator|
        create_list :question, evaluator.questions_count, poll: poll
        create_list :reply, evaluator.replies_count, poll: poll
      end
    end
  end
end
