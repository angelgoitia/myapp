class CreateShedules < ActiveRecord::Migration[5.2]
  def change
    create_table :shedules do |t|
      t.references :user, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
