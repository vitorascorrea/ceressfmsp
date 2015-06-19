class Chamado < ActiveRecord::Base  
  has_one :floricultura
  
  #Algoritmo de seleção de floricultura
  def selecionaFloricultura
    moveFloriculturas
    #Extrai array de objetos pelo select
    @floriculturas = Floricultura.where(:subprefeitura => self.subprefeitura, :posicao => 1)
    #Selecionamos a primeira posição (first) e depois selecionamos o ID
    id_floricultura = @floriculturas.first.id
    
    return id_floricultura
  end
  
  #Algoritmo de movimentação de floricultura
  def moveFloriculturas
    @floriculturas = Floricultura.all    
    @floriculturas.each do |i|
      if(i.posicao == 1)
        i.update_attribute(:posicao, @floriculturas.length)
      elsif
        i.update_attribute(:posicao, i.posicao-1)
      end
    end    
  end
  
end