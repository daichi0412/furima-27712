require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a nickname, email, encrypted_password, last_name, first_name, pseudonym_last, pseudonym_first, birthday" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without @ include an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with a password that include both letters and numbers" do
      user = build(:user, password: "aaaaaa")
      user.valid?
      expect(user.errors[:password])
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    
    it "is invalid with a last_name that input full-width characters" do
      user = build(:user, last_name: "ナカハラ")
      user.valid?
      expect(user.errors[:last_name])
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid with a first_name that input full-width characters" do
      user = build(:user, first_name: "ダイチ")
      user.valid?
      expect(user.errors[:first_name])
    end

    it "is invalid without a pseudonym_last" do
      user = build(:user, pseudonym_last: nil)
      user.valid?
      expect(user.errors[:pseudonym_last]).to include("can't be blank")
    end

    it "is invalid with a pseudonym_last that input full-width katakana characters" do
      user = build(:user, pseudonym_last: "中原")
      user.valid?
      expect(user.errors[:pseudonym_last])
    end

    it "is invalid without a pseudonym_first" do
      user = build(:user, pseudonym_first: nil)
      user.valid?
      expect(user.errors[:pseudonym_first]).to include("can't be blank")
    end

    it "is invalid with a pseudonym_first that input full-width katakana characters " do
      user = build(:user, pseudonym_first: "大地")
      user.valid?
      expect(user.errors[:pseudonym_first])
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
    
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", encrypted_password: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end