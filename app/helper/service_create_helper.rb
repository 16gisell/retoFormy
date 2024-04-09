module ServiceCreateHelper

    def consulta_guardar(data)
        cuenta_Aceptado = 0
        cuenta_Negado = 0

        data.each do |a|
            #paso 1 valido id (compruebo si existe en la base de datos)
            @existe = Api::Feature.find_by(id_feature: a["id"])

            #pado 2 si no existe en la base de datos  validamos si cumple los siguientes
            if @existe.nil?
                #paso 2.1 magnitud > -1.0 && magnitud < 10.0 
                if a["geometry"]["coordinates"][2] < -1.0 ||  a["geometry"]["coordinates"][2] > 10.0
                    nil
                elsif a["geometry"]["coordinates"][0] < -180.0 || a["geometry"]["coordinates"][0] > 180.0                    
                    #paso 2.2 longitud > -180.0 && longitud < 180.0
                    nil
                elsif a["geometry"]["coordinates"][1] < -90.0 || a["geometry"]["coordinates"][0] > 90.0    
                    #paso 2.3 latitud > -90.0 && latitud < 90.0
                    nil
                else #tocara corregir esta data segun la informacion que generaremos
                    objet_data={}
                    objet_data[:titulo]= a["properties"]["title"]
                    objet_data[:url]= a["properties"]["url"]
                    objet_data[:place] = a["properties"]["place"]
                    objet_data[:id_feature] = a["id"]
                    objet_data[:magType] = a["properties"]["magType"]
                    objet_data[:coord_latitud] = a["geometry"]["coordinates"][1]
                    objet_data[:coord_longitud] = a["geometry"]["coordinates"][0]
                    objet_data[:coord_magnitud] = a["geometry"]["coordinates"][2]

                    # Paso 3  guarda informacion a base de dato y suma 1 al conteo de informacion para enviar respuesta de datos guardados
                    salvar = Api::Feature.new(objet_data)
                    if salvar.save
                       cuenta_Aceptado = cuenta_Aceptado + 1
                    else
                        cuenta_Negado = cuenta_Negado + 1
                    end
                end                
            else
                # si no cumple ninguna de las anteriores no guarda
                cuenta_Negado = cuenta_Negado + 1
                return response = {menssage:"Todos los datos ya existen", data_guardada: cuenta_Aceptado, data_no_guardada: cuenta_Negado}
            end                  
        end
        return response = {menssage:"Se ha completado el guardado de informacion", data_guardada: cuenta_Aceptado, data_no_guardada: cuenta_Negado}       
    end

  end