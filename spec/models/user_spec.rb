require 'rails_helper'

RSpec.describe User, type: :model do
  # it 'should validate presence of email'
  # subject(:user) do
  #   user.create!(email: "reid@gmail", password: "123")
  # end
  #validation tests
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  #method test
  subject(:user) {
    User.create!(email: 'reid@gmail', password: 'password')
  }
  describe '#validate_password' do
    it 'returns true for valid passwords' do
      expect(user.validate_password('password')).to be_truthy
    end

    it 'returns false for invalid passwords' do
      expect(user.validate_password('frog')).to be_falsey
    end

  end

  describe '#reset_token!' do

    # before(:each) { user.reset_token! }
    it 'sets user session token to random token' do
      orig_token = user.session_token
      user.reset_token!
      expect(user.session_token).not_to eq(orig_token)
    end

    it 'saves user in db' do

      # expect(User.where_values_hash)
    end

    it 'returns the session token' do
      expect(user.reset_token!).to eq(user.session_token)
    end
  end

  describe '::find_by_credentials' do
    it 'returns user given valid credentials' do
      # debugger
      User.create!(email: 'reid@gmail', password: 'password')
      expect(User.find_by_credentials('reid@gmail', 'password')).to be_truthy
    end

    it 'returns nil given invalid credentials' do
      User.create!(email: 'reid@gmail', password: 'password')
      expect(User.find_by_credentials('reid@gmail', 'wrongpassword')).to be_nil
    end
  end
end
