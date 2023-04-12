class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.date :month
      t.booleano :status
      t.refereces :customers 
      t.timestamps
    end
  end
end
