class CreateStems < ActiveRecord::Migration
  def change
    create_table :stem do |t|
        t.integer :rule
        t.string :prefix
    end
  end
end
