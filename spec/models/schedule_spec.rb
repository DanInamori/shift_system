require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end
  
  describe 'スケジュール新規作成' do
    context 'スケジュール作成できるとき' do
      it "name, first_day, last_day, room_idが存在するとき" do
        expect(@schedule).to be_valid
      end
    end
    context 'スケジュール作成できないとき' do
      it "nameが存在しないとき" do
        @schedule.name = ""
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Name can't be blank")
      end
      it "first_dayが存在しないとき" do
        @schedule.first_day = ""
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("First day can't be blank")
      end
      it "last_dayが存在しないとき" do
        @schedule.last_day = ""
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Last day can't be blank")
      end
      it "first_day > last_day であるとき" do
        @schedule.last_day = "2021-01-01"
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("First day is invalid")
      end
      it "roomが紐付かないとき" do
        @schedule.room = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Room must exist")
      end
      
    end
  end
end
