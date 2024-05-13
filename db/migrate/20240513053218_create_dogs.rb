class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :age
      t.boolean :availability
      t.string :breed
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
