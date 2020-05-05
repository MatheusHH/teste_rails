class CreateCompanyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :company_users do |t|
      t.string :name
      t.integer :role
      t.boolean :request_change_password
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
