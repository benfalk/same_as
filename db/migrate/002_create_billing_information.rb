class CreateBillingInformation < ActiveRecord::Migration
  def change
    create_table :billing_informations do |t|
      t.string 'description'
      t.timestamps
    end
  end
end