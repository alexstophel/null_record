module NullRecord
  module FinderMethods
    extend ActiveSupport::Concern

    module ClassMethods
      %w(fifth first forty_two fourth last second third).freeze.each do |name|
        define_method(name) do
          super() || null_object
        end
      end

      def find(id)
        super(id)
      rescue ActiveRecord::RecordNotFound
        null_object
      end

      def find_by(attributes)
        super(attributes) || null_object
      end

      def take(limit = nil)
        if limit && limit > 1
          result = super(limit)
          result.size > 1 ? result : Array.new(limit) { null_object }
        else
          super(limit) || null_object
        end
      end
    end
  end
end
