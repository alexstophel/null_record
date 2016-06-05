module NullRecord
  module FinderMethods
    extend ActiveSupport::Concern

    module ClassMethods
      def find(id)
        super(id)
      end
    end
  end
end
