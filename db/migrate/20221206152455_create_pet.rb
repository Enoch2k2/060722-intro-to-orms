class CreatePet < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name

      t.timestamps
    end
  end
end
