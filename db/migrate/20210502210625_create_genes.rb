class CreateGenes < ActiveRecord::Migration[6.1]
  def change
    create_table :genes do |t|
      t.string :name

      t.timestamps
    end
  end
end
