class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
     t.text :itens
     t.float :total
     t.string :nomec 
     t.string :cpf 
     t.string :telefone1 
     t.string :telefone2 
     t.string :nomef 
     t.string :endvel
     t.string :subprefeitura
     t.datetime :datahorariovel
     t.string :nomee
     t.string :formapag
     t.string :status, :default => "Aberto"
     t.timestamps
      
    end
  end
end
