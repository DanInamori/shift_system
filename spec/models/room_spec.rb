require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  
  describe 'ルーム新規作成' do
    context 'ルーム作成できるとき' do
      it "nameが存在すればルームを作成できる" do
        expect(@room).to be_valid
      end
    end
    context 'ルーム作成できないとき' do
      it "nameが存在しなければルームを作成できない" do
        @room.name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
