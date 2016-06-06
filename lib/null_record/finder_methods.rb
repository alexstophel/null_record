module NullRecord
  module FinderMethods
    extend ActiveSupport::Concern

    module ClassMethods
      def fifth
        super || null_object
      end

      def find(id)
        super(id)
      rescue ActiveRecord::RecordNotFound
        null_object
      end

      def find_by(attributes)
        super(attributes) || null_object
      end

      def first
        super || null_object
      end

      def forty_two
        super || null_object
      end

      def fourth
        super || null_object
      end

      def last
        super || null_object
      end

      def second
        super || null_object
      end

      def take(limit = nil)
        if limit && limit > 1
          result = super(limit)
          result.size > 1 ? result : Array.new(limit) { null_object }
        else
          super(limit) || null_object
        end
      end

      def third
        super || null_object
      end
    end
  end
end
