module NullRecord
  module HasNullRecord
    def self.define_on(model)
      model.send(:include, NullRecord::FinderMethods)
    end
  end
end
