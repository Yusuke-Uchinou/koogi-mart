require 'rails_helper'

RSpec.describe Creator, type: :model do
  before do
    user = FactoryBot.create(:user)
    @creator = FactoryBot.build(:creator, user_id: user.id)
  end

  describe 'クリエイター新規登録' do
    context '新規登録できる場合' do
      it 'creator_nameとcreator_textがあれば登録できる' do
        expect(@creator).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'creator_nameがなければ登録できない' do
        @creator.creator_name = ''
        @creator.valid?
        expect(@creator.errors.full_messages).to include("Creator name can't be blank")
      end
      it 'creator_textがなければ登録できない' do
        @creator.creator_text = ''
        @creator.valid?
        expect(@creator.errors.full_messages).to include("Creator text can't be blank")
      end
    end
  end
end
