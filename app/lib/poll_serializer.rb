##
# Serializes a poll's data in order to be used dy data visualization tools like
# D3.
#
# The serializer should be able to:
#
# * Retrieve the actual data in the form of a hash;
# * Retrieve both axis information: legend, numeric ranges (if necessary),
#   occasional different columns for +x+;
#

class PollSerializer
  class << self
    ##
    # @param poll {Poll}
    # @example Data returned
    #  {
    #    x_axis: {
    #      legend: "Months",
    #      series: [
    #                "Jan 2014", "Feb 2014", "Mar 2014",
    #                "Apr 2014", "May 2014", "Jun 2014"
    #              ]
    #    },
    #
    #    y_axis: {
    #      legend: "No. polls",
    #      scale: [ 0, 10 ]
    #    },
    #
    #    data: [ 1, 3, 2, 4, 8, 6 ]
    #  }
    def count_per_month poll
      polls_per_month = poll.replies.group_by { |reply|
        reply.created_at.beginning_of_month }

      data = polls_per_month.map { |k,v| v.size }

      {
        data: data,
        title: "Polls answered by month",
        x_axis: {
          legend: "Polls per month",
          series: polls_per_month.keys.map { |date| date.strftime("%b %Y") }
        },
        y_axis: {
          legend: "No. polls",
          scale: [0, data.max + 1]
        }
      }
    end

    ##
    # @param question {Question}
    def answers_per_question question
      answers_per_question = question.answers.group_by(&:possible_answer)
      data = answers_per_question.map { |possible_answer, answers| answers.length }

      {
        data: data,
        title: %(#{question.title}),
        y_axis: {
          legend: "No. of answers",
          scale: [ 0, data.max + 1 ]
        },
        x_axis: {
          legend: "Answers per question",
          series: answers_per_question.map do |possible_answer, answers|
            possible_answer.title
          end
        },
      }
    end
  end
end
