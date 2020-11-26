require 'csv'
namespace :pet do
  desc "export pets to csv"
  task :export_csv, [:drug, :date_of_birth] => :environment do |t, args|
    medical_records = MedicalRecord.joins(:pet).
      where("treatment like ?", "%#{args.drug}%").
      where(pets: { date_of_birth: Date.parse(args.date_of_birth).all_day})
  
    columns = %w{id Nome raça tipo sintomas tratamento}

    CSV.open("pet_csv_#{Time.now}.csv", "w", headers: true) do |csv|
      csv << ["Medicamento: #{args.drug}"]
      csv << ["Data de nascimento: #{args.date_of_birth}"]
      csv << columns
      medical_records.each do |medical_record|
        csv << medical_record.csv_colums_values
      end
    end
  end
end
