require "rails_helper"

RSpec.describe User, type: :model do
describe 'validations' do
	it { should validate_presence_of :email }
	it { should validate_presence_of :password }
end

describe 'relationships' do
	# it { should belong_to : }
	# it { should have_many : }
end

describe 'instance methods' do
end

describe 'class methods' do
end

end

