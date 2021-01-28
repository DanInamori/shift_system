require 'rails_helper'

RSpec.describe Shift, type: :model do
  before do
    @shift = FactoryBot.build(:shift)
  end

  describe 'シフト新規作成' do
    context 'シフト投稿ができるとき' do
      it "work_dayが存在しているとき" do
        expect(@shift).to be_valid
      end
    end
    context 'シフト投稿ができないとき' do
      it "work_dayが存在しないとき" do
        @shift.work_day = ""
        @shift.valid?
        expect(@shift.errors.full_messages).to include("Work day can't be blank")
      end
      it "userが紐付かないとき" do
        @shift.user = nil
        @shift.valid?
        expect(@shift.errors.full_messages).to include("User must exist")
      end
      it "scheduleが紐付かないとき" do
        @shift.schedule = nil
        @shift.valid?
        expect(@shift.errors.full_messages).to include("Schedule must exist")
      end
    end
  end
end
