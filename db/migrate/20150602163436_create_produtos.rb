class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nomeproduto
      t.text :descproduto
      t.float :precoproduto
      t.string :imgproduto
      t.timestamps
    end
    Produto.create(:nomeproduto => "Coroa de Bromélias", :descproduto => "Contem 9 Bromélias", :precoproduto => 130.00, :imgproduto =>"modelo_coroa_01.png")
    Produto.create(:nomeproduto => "Coroa de Rosas", :descproduto => "Contem 9 Rosas", :precoproduto => 100.00, :imgproduto =>"modelo_coroa_02.gif")
    Produto.create(:nomeproduto => "Coroa de Margaridas", :descproduto => "Contem 9 Margaridas", :precoproduto => 180.00, :imgproduto =>"modelo_coroa_03.jpg")
    Produto.create(:nomeproduto => "Coroa de Violetas", :descproduto => "Contem 9 Violetas", :precoproduto => 90.00, :imgproduto =>"modelo_coroa_04.jpg")
  end
end
