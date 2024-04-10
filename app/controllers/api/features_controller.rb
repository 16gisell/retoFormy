class Api::FeaturesController < ApplicationController
    include ServiceHelper
    include ServiceCreateHelper
    before_action :set_feature, only: [:show, :update, :destroy]

    def index
        page = params[:page] || 1
        perPage = params[:per_page] || 10
        
        if params[:filter].present? && !params[:filter].blank? 
            # Si envia datos en el parametro filter
            consulta = Api::Feature.where("lower(mag_type) LIKE ?", "%#{params[:filter].downcase}%")
        else
            # No envia datos en el parametro filter
            consulta = Api::Feature.all.paginate(page: page, per_page: perPage)
        end

        result = consulta.paginate(page: page, per_page: perPage)

        # Organizamos la data segun el formato como deseamos que la reciba el usuario        
        @data_list=[]
        result.each do |a|
            objet_data ={}
            objet_data[:id] = a[:id].to_i #id base de dato
            objet_data[:type]= a[:tipo].to_s
            objet_data[:Attributes] = {}
            objet_data[:Attributes][:external_id] = a[:id_feature].to_s
            objet_data[:Attributes][:magnitude] = a[:magnitud].to_f
            objet_data[:Attributes][:place] = a[:place].to_s
            objet_data[:Attributes][:time] = a[:time].to_s
            objet_data[:Attributes][:tsunami] = a[:tsunami]
            objet_data[:Attributes][:mag_type] = a[:mag_type].to_s
            objet_data[:Attributes][:title] = a[:titulo].to_s
            objet_data[:Attributes][:coordinates] = {}
            objet_data[:Attributes][:coordinates][:longitud] = a[:coord_longitud].to_f
            objet_data[:Attributes][:coordinates][:latitud] = a[:coord_latitud].to_f
            objet_data[:links] = {}
            objet_data[:links][:external_url] = a[:url].to_s

            @data_list << objet_data
        end        
            objet_pagination = {}
            objet_pagination[:current_page] = page.to_i
            objet_pagination[:total] = consulta.length.to_i
            objet_pagination[:per_page] = perPage.to_i

        render json:{data:@data_list, paginacion: objet_pagination}        
    end

    def show
    end

    def task_ejecute
        @data = task_ejecute_help
        render json:@data
    end

    def list_features 
        # Listara toda la informacion que nos devuelve el servicio de USGS
        @consulta = consulta_endpoint
        render json:@consulta
    end

    def create
        # Si deseamos insertar data de forma individual y no desde la tarea
        @data = consulta_guardar(params["features"])
        render json:@data, status: :created       
    end

    def update
        # Insertamos comentarios
        if @comennt.update(feature_params)
            render json:@comennt
        else
            unprocessable_entity(@comennt, 'Error al actualizar el comentario del feacture')
        end
    end
    
    def destroy
    end

    private
      
      def set_feature
        @comennt = Api::Feature.find_by(id_feature: params["id"])
      end
  
      def feature_params
        params.require(:feature).permit(:comment=>[])
      end
end
