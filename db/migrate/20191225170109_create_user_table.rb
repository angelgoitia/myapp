class CreateUserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users  do |t|
      t.string :name, null: false
      t.string :cedula, null: false
      t.string :role, null: false
    end
  end
end
