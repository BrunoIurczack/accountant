class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :plan
      t.float :value
      t.string :contact
      t.text :tasks
      t.timestamps
    end
  end
end
