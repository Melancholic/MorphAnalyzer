class AddIndexToStem < ActiveRecord::Migration
  def change
    add_index :stem, :prefix
    add_index :form, :suffix 
    #add_index :stem, :rule
    #add_index :form, :rule
  end
end
