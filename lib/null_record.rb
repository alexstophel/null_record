require "active_support"
require "null_record/finder_methods"
require "null_record/has_null_record"
require "null_record/version"

module NullRecord
  extend ActiveSupport::Concern

  module ClassMethods
    # rubocop:disable Style/PredicateName
    def has_null_record
      NullRecord::HasNullRecord.define_on(self)
    end
    # rubocop:enable Style/PredicateName
  end
end
