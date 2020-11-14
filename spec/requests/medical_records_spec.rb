 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/medical_records", type: :request do
  # MedicalRecord. As you add validations to MedicalRecord, be sure to
  # adjust the attributes here as well.

  let(:pet){create(:pet)}
  let!(:medical_records){create_list(:medical_record, 3, pet: pet)}
  
  let(:valid_attributes) {
    {
      pet_id: pet.id,
      symptoms: 'Vários sintomas',
      treatment: 'Descrição do tratamento'
    }
  }

  let(:invalid_attributes) {
    {
      symptoms: '',
      treatment: ''
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      get pet_medical_records_url(pet.id)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get pet_medical_record_url(pet, medical_records.first)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_pet_medical_record_url(pet)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_pet_medical_record_url(pet, medical_records.first)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new MedicalRecord" do
        expect {
          post pet_medical_records_url(pet), params: { medical_record: valid_attributes }
        }.to change(MedicalRecord, :count).by(1)
      end

      it "redirects to the created medical_record" do
        post pet_medical_records_url(pet), params: { medical_record: valid_attributes }
        expect(response).to redirect_to(pet_medical_records_url(pet))
      end
    end

    context "with invalid parameters" do
      it "does not create a new MedicalRecord" do
        expect {
          post pet_medical_records_url(pet), params: { medical_record: invalid_attributes }
        }.to change(MedicalRecord, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post pet_medical_records_url(pet), params: { medical_record: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          symptoms: 'Outros Sintomas',
          treatment: 'Outro descrição do tratamento'
        }
      }

      it "updates the requested medical_record" do
        patch pet_medical_record_url(pet, medical_records.first), params: { medical_record: new_attributes }
        expect{medical_records.first.reload}.to change{medical_records.first.symptoms}
      end

      it "redirects to the medical_record" do
        patch pet_medical_record_url(pet, medical_records.first), params: { medical_record: new_attributes }
        medical_records.first.reload
        expect(response).to redirect_to(pet_medical_record_url(pet, medical_records.first))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch pet_medical_record_url(pet, medical_records.first), params: { medical_record: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested medical_record" do
      expect {
        delete pet_medical_record_url(pet, medical_records.second)
      }.to change(MedicalRecord, :count).by(-1)
    end

    it "redirects to the medical_records list" do
      delete pet_medical_record_url(pet, medical_records.second)
      expect(response).to redirect_to(pet_medical_records_url(pet))
    end
  end
end
