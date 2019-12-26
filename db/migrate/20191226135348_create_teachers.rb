class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.string :career, null: false
      t.string :subject, null: false
      t.timestamps
    end
  end
end
