class CreateExpermients < ActiveRecord::Migration[6.1]
  def change
    create_table :experiments do |t|
      t.float :copy_number
      t.float :expression
      t.references :datasource
      t.references :line
      t.references :gene

      t.timestamps
    end
  end
end
