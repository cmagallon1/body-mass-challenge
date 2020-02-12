class CreateBodyMasses < ActiveRecord::Migration[6.0]
  def change
    create_table :body_masses do |t|
      t.string :category
      t.float :min
      t.float :max

      t.timestamps
    end
  end
end
