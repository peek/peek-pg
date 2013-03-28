require 'pg'
require 'atomic'

# Instrument SQL time
class PG::Connection
  class << self
    attr_accessor :query_time, :query_count
  end
  self.query_count = Atomic.new(0)
  self.query_time = Atomic.new(0)

  def exec_with_timing(*args)
    start = Time.now
    exec_without_timing(*args)
  ensure
    duration = (Time.now - start)
    PG::Connection.query_time.update { |value| value + duration }
    PG::Connection.query_count.update { |value| value + 1 }
  end
  alias_method_chain :exec, :timing

  def async_exec_with_timing(*args)
    start = Time.now
    async_exec_without_timing(*args)
  ensure
    duration = (Time.now - start)
    PG::Connection.query_time.update { |value| value + duration }
    PG::Connection.query_count.update { |value| value + 1 }
  end
  alias_method_chain :async_exec, :timing
end

module Peek
  module Views
    class PG < View
      def duration
        ::PG::Connection.query_time.value
      end

      def formatted_duration
        ms = duration * 1000
        if ms >= 1000
          "%.2fms" % ms
        else
          "%.0fms" % ms
        end
      end

      def calls
        ::PG::Connection.query_count.value
      end

      def results
        { :duration => formatted_duration, :calls => calls }
      end

      private

      def setup_subscribers
        # Reset each counter when a new request starts
        before_request do
          ::PG::Connection.query_time.value = 0
          ::PG::Connection.query_count.value = 0
        end
      end
    end
  end
end
