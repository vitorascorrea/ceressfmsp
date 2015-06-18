class CreateFloriculturas < ActiveRecord::Migration
  def change
    create_table :floriculturas do |t|
      t.string :email
      t.string :password_digest
      t.string :nomefloricultura
      t.string :endfloricultura
      t.string :subprefeitura
      t.integer :posicao
      t.timestamps
    end
  end
end
