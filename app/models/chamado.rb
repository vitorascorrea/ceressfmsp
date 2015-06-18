class Chamado < ActiveRecord::Base  
  has_one :floricultura
  
  #Algoritmo de seleção de floricultura
  def selecionaFloricultura
    #Extrai array de objetos pelo select
    @floriculturas = Floricultura.where(:subprefeitura => self.subprefeitura, :posicao => 1)
    #Selecionamos a primeira posição (first) e depois selecionamos o ID
    id_floricultura = @floriculturas.first.id
    moveFloriculturas
    return id_floricultura
  end
  
  #Algoritmo de movimentação de floricultura
  def moveFloriculturas
    @floriculturas = Floricultura.all    
    @floriculturas.each do |i|
      if(i.posicao == -1)
        next
      elsif(i.posicao == 1)
        i.update_attribute(:posicao, @floriculturas.length-1)
      elsif
        i.update_attribute(:posicao, i.posicao-1)
      end
    end    
  end
  
end