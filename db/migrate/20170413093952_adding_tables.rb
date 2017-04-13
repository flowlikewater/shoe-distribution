class AddingTables < ActiveRecord::Migration
  def change
    create_table(:brands) do |r|
      r.column(:name, :string)
      r.column(:logo_url, :string)
    end
    create_table(:stores) do |r|
      r.column(:name, :string)
      r.column(:address, :string)
      r.column(:phone, :integer)
    end
  end
end
