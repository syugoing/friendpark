class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title, null: false, default: ""

      t.timestamps null: false
    end
  end
end
