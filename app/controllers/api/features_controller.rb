class Api::FeaturesController < ApplicationController
    include ServiceHelper
    include ServiceCreateHelper

    def index
        @consulta = consulta_endpoint
        render json:@consulta
    end

    def show
    end

    def list_features 
        @consulta = consulta_endpoint_tow
        info = JSON.parse(@consulta)
        @data_list=[]
        info["features"].each do |a|
            objet_data ={}
            objet_data = {}
            objet_data[:id] = a["id"]
            objet_data[:type]= a["type"]
            objet_data[:Attributes] = {}
            objet_data[:Attributes][:external_id] = a["properties"]["ids"]
            objet_data[:Attributes][:magnitude] = a["properties"]["mag"]
            objet_data[:Attributes][:place] = a["properties"]["place"]
            objet_data[:Attributes][:time] = a["properties"]["time"]
            objet_data[:Attributes][:tsunami] = a["properties"]["tsunami"]
            objet_data[:Attributes][:mag_type] = a["properties"]["magType"]
            objet_data[:Attributes][:title] = a["properties"]["title"]
            objet_data[:Attributes][:magnitude] = a["properties"]["mag"]
            objet_data[:Attributes][:coordinates] = {}
            objet_data[:Attributes][:coordinates][:longitud] = a["geometry"]["coordinates"][0]
            objet_data[:Attributes][:coordinates][:latitud] = a["geometry"]["coordinates"][1]
            objet_data[:links] = {}
            objet_data[:links][:external_url] = a["properties"]["url"]

            @data_list << objet_data
        end
            objet_pagination = {}
            objet_pagination[:current_page] = 0
            objet_pagination[:total] = 0
            objet_pagination[:per_page] = 0

        render json:{data:@data_list, paginacion: objet_pagination}
    end

    def create
        @data = consulta_guardar(params["features"])
        render json:@data, status: :created       
    end

    def update
    end
    
    def destroy
    end
end
