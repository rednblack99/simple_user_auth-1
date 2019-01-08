require_relative '../lib/user'

describe User do

  context 'user.authenticate' do
    let!(:user) { User.create(email: 'test@test.com', password: 'secret123')}

    it "returns nil if user doesn't exist" do
      expect(User.authenticate("I'm not a user", "secret123")).to eq nil
    end

    it "returns nil if user exists but incorrect password" do
      expect(User.authenticate("test@test.com", "I'm not the password")).to eq nil
    end

    it "returns user if username and password are both correct" do
      expect(User.authenticate('test@test.com', "secret123")).to eq user
    end

  end

  context 'user.exists?' do
    let!(:user) { User.create(email: 'test@test.com', password: 'secret123')}

    it "returns true if user signup already exists" do
      expect(User.exists?('test@test.com')).to eq true
    end

  end

end
