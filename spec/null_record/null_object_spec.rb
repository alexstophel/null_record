require "spec_helper"

RSpec.describe NullRecord::NullObject do
  before(:each) do
    silence_warnings do
      class User < ActiveRecord::Base
        has_null_record
      end
    end
  end

  it "defines a null_object method on the class" do
    expect(User.null_object).to be_a(User::NullUser)
  end
end
