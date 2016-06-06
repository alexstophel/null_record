module NullRecord
  module NullObject
    extend ActiveSupport::Concern

    module ClassMethods
      def null_object
        Object.const_get("#{self}::Null#{self}").new
      end
    end
  end
end
