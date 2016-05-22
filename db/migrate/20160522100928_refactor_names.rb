class RefactorNames < ActiveRecord::Migration
   def change
     rename_table :form, :forms
     rename_table :stem, :stems
     rename_table :norm, :norms
   end
end
