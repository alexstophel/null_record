require "spec_helper"

RSpec.describe NullRecord::HasNullRecord do
  before(:all) do
    silence_warnings do
      class User < ActiveRecord::Base
        has_null_record do
          def name
            "Default"
          end
        end
      end
    end
  end

  describe ".define_on" do
    it "includes NullRecord::FinderMethods on the model" do
      expect(User.ancestors.include?(NullRecord::FinderMethods)).to eq(true)
    end

    it "includes NullRecord::NullObject on the model" do
      expect(User.ancestors.include?(NullRecord::NullObject)).to eq(true)
    end

    it "defines a NullObject" do
      expect(User::NullUser).to be_present
    end

    context "NullObject" do
      let(:null_object) { User::NullUser.new }

      it "responds to methods defined on the base class" do
        expect(null_object.id).to eq(nil)
      end

      it "makes predicates return false" do
        expect(null_object.is_this_false?).to eq(false)
      end

      it "defines the name method with the definition in the config block" do
        expect(null_object.name).to eq("Default")
      end
    end
  end
end
