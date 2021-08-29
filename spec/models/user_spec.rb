require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do
    context 'can save' do
      it "is valid with a nickname, email, encrypted_password, last_name, first_name, pseudonym_last, pseudonym_first, birthday" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "is invalid with a password that has more than 6 characters " do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages)
      end
    end

    context 'can not save'
      it "is invalid without a nickname" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it "is invalid without an email" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it "is invalid without @ include an email" do
        @user.email = 'kkk.com'
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it "is invalid without a password" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it "is invalid without a password_confirmation" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it "is invalid with a password that include both letters and numbers" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages)
      end

    it "is invalid without a last_name" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    
    it "is invalid with a last_name that input full-width characters" do
      @user.last_name = 'ナカハラ'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it "is invalid without a first_name" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it "is invalid with a first_name that input full-width characters" do
      @user.last_name = 'ダイチ'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it "is invalid without a pseudonym_last" do
      @user.pseudonym_last = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it "is invalid with a pseudonym_last that input full-width katakana characters" do
      @user.pseudonym_last = '中原'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it "is invalid without a pseudonym_first" do
      @user.pseudonym_first = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it "is invalid with a pseudonym_first that input full-width katakana characters " do
      @user.pseudonym_first = '大地'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it "is invalid without a birthday" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    
    it "is invalid with a password that has less than 5 characters " do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages)
    end
  end
end