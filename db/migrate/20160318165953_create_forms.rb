class CreateForms < ActiveRecord::Migration
  def change
    create_table :form do |t|
        t.integer :rule
        t.string :suffix
        t.string :tag
        #t.timestamps null: false
    end
  end
end
