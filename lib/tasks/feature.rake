namespace :frogmi do
    desc "Consulta y almacenamiento informacion de datos sismologicos USGS"
    task :feature_USGS => [:environment] do
        include ServiceHelper
        include ServiceCreateHelper

        data = consulta_endpoint
        info=JSON.parse(data)

        @data = consulta_guardar(info["features"])
        puts ap json:@data, status: :created  

    end
end