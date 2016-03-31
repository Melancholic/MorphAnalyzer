class CreateNorms < ActiveRecord::Migration
  def change
    create_table :norm do |t|
        t.integer :rule
        t.string :suffix
        t.string :tag
    end
  end
end
