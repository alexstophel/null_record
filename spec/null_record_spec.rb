require "spec_helper"

RSpec.describe NullRecord do
  it "has a version number" do
    expect(NullRecord::VERSION).not_to be nil
  end
end

RSpec.describe NullRecord::ClassMethods do
  describe ".has_null_record" do
    before do
      ActiveRecord::Base.send(:include, NullRecord)
    end

    # TODO: Make this a better spec...
    it "works" do
      expect do
        class User < ActiveRecord::Base
          has_null_record
        end
      end.to_not raise_error
    end
  end
end
