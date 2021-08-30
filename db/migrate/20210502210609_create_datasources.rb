class CreateDatasources < ActiveRecord::Migration[6.1]
  def change
    create_table :datasources do |t|
      t.string :name

      t.timestamps
    end
  end
end
