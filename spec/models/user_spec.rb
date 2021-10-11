require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
     it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
       expect(@user).to be_valid
     end
     it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
     end
    end



   context '新規登録できないとき' do
     it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456abc'
        @user.password_confirmation = '1234567abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it 'passwordが5文字以下では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
     it 'passwordは、半角英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it 'emailは@が存在しないと登録できない' do
      @user.email = '1111g.mail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
     end
   end
  end
end
