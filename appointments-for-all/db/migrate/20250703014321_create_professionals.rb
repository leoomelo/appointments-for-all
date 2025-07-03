class CreateProfessionals < ActiveRecord::Migration[8.0]
  def change
    create_table :professionals do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :expertise, null: false

      t.timestamps
    end
  end
end
