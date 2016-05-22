class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false, unique: true 
      t.string :code, null: false, unique: true 
	  
      t.timestamps null: false
    end

	add_index :tags, [:name, :code], :unique => true

    create_table :forms_tags, id: false do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :form, index: true
    end

    create_table :norms_tags, id: false do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :norm, index: true
    end
  end
end
