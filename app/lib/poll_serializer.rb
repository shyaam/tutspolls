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
        reply.created_at.beginning_of_day }

      data = polls_per_month.map { |k,v| v.size }

      {
        data: data,
        x_axis: {
          legend: "Polls per month",
          series: polls_per_month.keys.map { |date| date.strftime("%d %b %Y") }
        },
        y_axis: {
          legend: "No. polls",
          scale: [0, data.max + 1]
        }
      }
    end
  end
end
