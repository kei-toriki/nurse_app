require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep(0.1)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,position_idが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'imageが空でも保存できること' do
        @user.image = nil
        expect(@user).to be_valid
      end
      it 'descriptionが空でも保存できること' do
        @user.description = nil
        expect(@user).to be_valid
      end
    end


    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname translation missing: ja.activerecord.errors.models.user.attributes.nickname.blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email translation missing: ja.activerecord.errors.models.user.attributes.email.blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password translation missing: ja.activerecord.errors.models.user.attributes.password.blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.confirmation")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email translation missing: ja.activerecord.errors.models.user.attributes.email.taken")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password translation missing: ja.activerecord.errors.models.user.attributes.password.too_short")
      end
      it 'position_idが1では登録できない' do
        @user.position_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Position translation missing: ja.activerecord.errors.models.user.attributes.position_id.other_than")
      end
    end
  end
end
          

