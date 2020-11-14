require "rails_helper"

RSpec.describe MedicalRecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pets/1/medical_records").to route_to("medical_records#index", pet_id: "1")
    end

    it "routes to #new" do
      expect(get: "/pets/1/medical_records/new").to route_to("medical_records#new", pet_id: "1")
    end

    it "routes to #show" do
      expect(get: "/pets/1/medical_records/1").to route_to("medical_records#show", pet_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/pets/1/medical_records/1/edit").to route_to("medical_records#edit", pet_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/pets/1/medical_records").to route_to("medical_records#create", pet_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/pets/1/medical_records/1").to route_to("medical_records#update", id: "1", pet_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pets/1/medical_records/1").to route_to("medical_records#update", id: "1", pet_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pets/1/medical_records/1").to route_to("medical_records#destroy", id: "1", pet_id: "1")
    end
  end
end
