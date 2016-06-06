require "spec_helper"

RSpec.describe NullRecord do
  it "has a version number" do
    expect(NullRecord::VERSION).not_to be nil
  end
end
