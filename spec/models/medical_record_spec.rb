require 'rails_helper'

RSpec.describe MedicalRecord, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:symptoms) }
    it { is_expected.to validate_presence_of(:treatment) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:pet) }
  end
end
