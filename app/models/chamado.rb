class Chamado < ActiveRecord::Base  
  has_one :floricultura
  
  #Algoritmo de seleção de floricultura
  def selecionaFloricultura
    #Extrai array de objetos pelo select
    @floriculturas = Floricultura.where(:subprefeitura => self.subprefeitura, :posicao => 1)
    
     #movemos as floriculturas
    @floriculturasms = Floricultura.where(:subprefeitura => self.subprefeitura)
    @floriculturasms.each do |i|            
        if(i.posicao == 1)
          i.update_attribute(:posicao, @floriculturasms.length)
        else
          i.update_attribute(:posicao, i.posicao-1)
        end      
    end
    #terminamos de mover as floriculturas
    
    #Selecionamos a primeira posição (first) e depois selecionamos o ID
    id_floricultura = @floriculturas.first.id    
    
    return id_floricultura
  end  
end