require 'rails_helper'

RSpec.describe Journal, type: :model do
    # validations
    # methods
    describe "#validations" do
        it "should return false if name is blank" do
            journal = Journal.new(name:"")

            expect(journal.save).to eq false

        end

        it "should return false if name is more than 20 characters" do
            journal = Journal.new(name:"000000000000000000000")

            expect(journal.save).to eq false
    end
    
end
end