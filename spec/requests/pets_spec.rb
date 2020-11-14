# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pets', type: :request do
  describe 'GET /pets' do
    let!(:pets) { create_list(:pet, 3) }
    let(:url) { "/pets.json" }

    before do
      get url
    end

    it 'expects to return http status ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'expect return three pets' do
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'GET /pets/:id' do
    let!(:pet) { create(:pet) }
    let(:url) { "/pets/#{pet.id}.json" }

    before do
      get url
    end

    it 'expects to return http status ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'expect return correct pet' do
      expect(JSON.parse(response.body)['id']).to eq(pet.id)
    end
  end

  describe 'POST /posts' do
    let(:params) {
      {
        pet: {
          name: 'Pitoco',
          date_of_birth: 3.year.ago,
          type_of_animal: 'dog',
          breed: 'Vira-lata'  
        }
        
      }
     }

    let(:url) { "/pets.json" }
    context 'when params are valid' do
      it 'expects to return http status created' do
       post url, params: params
       expect(response).to have_http_status(:created)
      end
    end

    context 'when params are invalid' do
     let(:invalid_params) {
       {
          pet: {
            name: '',
            date_of_birth: 3.year.ago,
            type_of_animal: 'dog',
            breed: 'Vira-lata'  
           }
              
        }
     }
      it "expect to return http status unprocessable_entity" do
        post url, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /pets/:id' do
    let(:pet) { create(:pet) }
    let(:params) {
        {
            pet: {
            name: 'bush'
            }
        }
    }

    let(:invalid_params) {
      {
        pet: {
          name: ''
        }
      }
    }
    let(:url) { "/pets/#{pet.id}.json" }

    context 'when params are valid' do
      it 'expects to return http status created' do
        put url, params: params
        expect(response).to have_http_status(:ok)
      end

      it 'expect change pet name' do
        expect do
          put url, params: params
          pet.reload
        end.to change{ pet.name}.from('Pitoco').to('bush')
      end
    end

    context 'when params are invalid' do
      it 'expect to return http status unprocessable entity' do
        put url, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /pets/:id' do
    let!(:pet){create(:pet)}

    let(:url) { "/pets/#{pet.id}.json" }

    it 'expect return no content' do
      delete url
      expect(response).to have_http_status(:no_content)
    end
  end
end
