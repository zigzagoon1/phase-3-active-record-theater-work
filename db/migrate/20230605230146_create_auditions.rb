class CreateAuditions < ActiveRecord::Migration[5.2]
  def change
    create_table :auditions do |t|
      t.string :actor
      t.string :location
      t.integer :phone
      t.boolean :hired
      t.integer :belong_to #role id
    end
  end
end
