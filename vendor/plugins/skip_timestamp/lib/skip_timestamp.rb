module ActiveRecord
  class Base

    def skip_timestamp(&block)
      class << self
        def record_timestamps; false; end
      end

      yield if block_given?

      class << self
        remove_method :record_timestamps
      end
    end

  end
end
