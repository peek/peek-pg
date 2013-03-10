require 'pg'

# Instrument SQL time
class PG::Connection
  class << self
    attr_accessor :query_time, :query_count
  end
  self.query_count = 0
  self.query_time = 0

  def exec_with_timing(*args)
    start = Time.now
    exec_without_timing(*args)
  ensure
    PG::Connection.query_time += (Time.now - start)
    PG::Connection.query_count += 1
  end
  alias_method_chain :exec, :timing

  def async_exec_with_timing(*args)
    start = Time.now
    async_exec_without_timing(*args)
  ensure
    PG::Connection.query_time += (Time.now - start)
    PG::Connection.query_count += 1
  end
  alias_method_chain :async_exec, :timing
end

module Glimpse
  module Views
    class PG < View
      def duration
        ::PG::Connection.query_time
      end

      def formatted_duration
        "%.2fms" % (duration * 1000)
      end

      def calls
        ::PG::Connection.query_count
      end

      def results
        { :duration => formatted_duration, :calls => calls }
      end

      private

      def setup_subscribers
        # Reset each counter when a new request starts
        before_request do
          ::PG::Connection.query_time = 0
          ::PG::Connection.query_count = 0
        end
      end
    end
  end
end
