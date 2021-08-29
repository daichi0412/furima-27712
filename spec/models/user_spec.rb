require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    it "is valid with a nickname, email, encrypted_password, last_name, first_name, pseudonym_last, pseudonym_first, birthday" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid without @ include an email" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid without a password" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid without a password_confirmation" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid with a password that include both letters and numbers" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid without a last_name" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end
    
    it "is invalid with a last_name that input full-width characters" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid without a first_name" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid with a first_name that input full-width characters" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid without a pseudonym_last" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid with a pseudonym_last that input full-width katakana characters" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid without a pseudonym_first" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid with a pseudonym_first that input full-width katakana characters " do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is invalid without a birthday" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end
    
    it "is invalid with a password that has less than 5 characters " do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end
  end
end