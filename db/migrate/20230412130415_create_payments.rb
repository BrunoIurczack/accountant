class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.date :month
      t.boolean :paid
      t.references :customer
      t.timestamps
    end
  end
end
