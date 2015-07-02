class CreateFloriculturas < ActiveRecord::Migration
  def change
    create_table :floriculturas do |t|
      t.string :email, :unique => true
      t.string :nomefloricultura
      t.string :endfloricultura
      t.string :subprefeitura
      t.integer :posicao
      t.timestamps
    end
  end
end
