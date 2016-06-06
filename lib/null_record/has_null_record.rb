module NullRecord
  module HasNullRecord
    class << self
      def define_on(model)
        build_null_object(model, default_naught_config(model))
        model.send(:include, NullRecord::FinderMethods)
        model.send(:include, NullRecord::NullObject)
      end

      private

      def build_null_object(model, config)
        model.instance_eval do
          null_object = Naught.build(&config)
          const_set "Null#{self}", null_object
        end
      end

      def default_naught_config(model)
        proc do |config|
          config.mimic model.to_s.constantize
          config.predicates_return false
        end
      end
    end
  end
end
