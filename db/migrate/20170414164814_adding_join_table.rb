class AddingJoinTable < ActiveRecord::Migration
  def change
    create_table :brands_stores, :id => false do |r|
      r.column(:brand_id, :integer)
      r.column(:store_id, :integer)
    end
  end
end
