require "spec_helper"

RSpec.describe NullRecord::FinderMethods do
  before(:all) do
    silence_warnings do
      class User < ActiveRecord::Base
        has_null_record
      end
    end
  end

  describe ".fifth" do
    context "when the record exists" do
      before(:each) do
        5.times do
          User.create
        end
      end

      it "returns the record" do
        expect(User.fifth.id).to eq(5)
      end
    end

    context "when the record doesn't exist" do
      it "returns a null object" do
        expect(User.fifth).to be_a(User::NullUser)
      end
    end
  end

  describe ".find" do
    context "when the record exists" do
      let!(:record) do
        User.create(id: 1)
      end

      it "returns the record" do
        expect(User.find(1)).to eq(record)
      end
    end

    context "when the record doesn't exist" do
      it "returns a null object" do
        expect(User.find(1)).to be_a(User::NullUser)
      end
    end
  end

  describe ".find_by" do
    context "when the record exists" do
      let!(:record) do
        User.create(id: 1)
      end

      it "returns the record" do
        expect(User.find_by(id: 1)).to eq(record)
      end
    end

    context "when the record doesn't exist" do
      it "returns a null object" do
        expect(User.find_by(id: 1)).to be_a(User::NullUser)
      end
    end
  end

  describe ".first" do
    context "when the record exists" do
      let!(:record) do
        User.create
      end

      it "returns the record" do
        expect(User.first).to eq(record)
      end
    end

    context "when the record doesn't exist" do
      it "returns a null object" do
        expect(User.first).to be_a(User::NullUser)
      end
    end
  end

  describe ".forty_two" do
    context "when the record exists" do
      before(:each) do
        42.times do
          User.create
        end
      end

      it "returns the record" do
        expect(User.forty_two.id).to eq(42)
      end
    end

    context "when the record doesn't exist" do
      it "returns a null object" do
        expect(User.forty_two).to be_a(User::NullUser)
      end
    end
  end

  describe ".fourth" do
    context "when the record exists" do
      before(:each) do
        4.times do
          User.create
        end
      end

      it "returns the record" do
        expect(User.fourth.id).to eq(4)
      end
    end

    context "when the record doesn't exist" do
      it "returns a null object" do
        expect(User.fourth).to be_a(User::NullUser)
      end
    end
  end

  describe ".last" do
    context "when the record exists" do
      before(:each) do
        2.times do
          User.create
        end
      end

      it "returns the record" do
        expect(User.last.id).to eq(2)
      end
    end

    context "when the record doesn't exist" do
      it "returns a null object" do
        expect(User.last).to be_a(User::NullUser)
      end
    end
  end

  describe ".second" do
    context "when the record exists" do
      before(:each) do
        2.times do
          User.create
        end
      end

      it "returns the record" do
        expect(User.second.id).to eq(2)
      end
    end

    context "when the record doesn't exist" do
      it "returns a null object" do
        expect(User.second).to be_a(User::NullUser)
      end
    end
  end

  describe ".take" do
    context "when the record exists" do
      before(:each) do
        2.times do
          User.create
        end
      end

      it "returns the record" do
        expect(User.take.id).to eq(1)
      end

      it "works with a limit" do
        expect(User.take(2).map(&:id)).to eq([1, 2])
      end
    end

    context "when the record doesn't exist" do
      it "returns a null object" do
        expect(User.take).to be_a(User::NullUser)
      end

      it "works with a limit and returns two NullObjects" do
        expect(User.take(2).map(&:id)).to eq([nil, nil])
      end
    end
  end

  describe ".third" do
    context "when the record exists" do
      before(:each) do
        3.times do
          User.create
        end
      end

      it "returns the record" do
        expect(User.third.id).to eq(3)
      end
    end

    context "when the record doesn't exist" do
      it "returns a null object" do
        expect(User.third).to be_a(User::NullUser)
      end
    end
  end
end
