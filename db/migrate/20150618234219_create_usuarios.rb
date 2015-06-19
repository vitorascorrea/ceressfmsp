class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :password_digest
      t.string :tipo
      t.timestamps
    end
  end
end
