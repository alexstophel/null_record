require "spec_helper"

RSpec.describe NullRecord::HasNullRecord do
  before(:all) do
    ActiveRecord::Base.send(:include, NullRecord)

    class User < ActiveRecord::Base; end
  end

  describe ".define_on" do
    it "includes NullRecord::FinderMethods on the model" do
      User.has_null_record
      expect(User.ancestors.include?(NullRecord::FinderMethods)).to eq(true)
    end
  end
end
