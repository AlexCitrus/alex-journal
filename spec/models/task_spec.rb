require 'rails_helper'

RSpec.describe Task, type: :model do
    # validations
    # methods
    describe "#validations" do
        it "should return false if name is blank" do
            task = Task.new(name:"")

            expect(task.save).to eq false

        end

        it "should return false if name is more than 20 characters" do
            task = Task.new(name:"000000000000000000000")

            expect(task.save).to eq false
    end

    it "should return false if deadline is blank" do
        task = Task.new(deadline:"")

        expect(task.save).to eq false
end
    
    
end
end