require "spec_helper"

RSpec.describe NullRecord::FinderMethods do
  before(:all) do
    ActiveRecord::Base.send(:include, NullRecord)

    class User < ActiveRecord::Base
      has_null_record
    end
  end

  describe "#find" do
    context "when the record exists" do
      let!(:record) do
        User.create(id: 1)
      end

      it "returns the record" do
        expect(User.find(1)).to eq(record)
      end
    end
  end
end
