module ServiceHelper
    URL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson".freeze

    def consulta_endpoint
      response = Faraday.get(URL)
      response.body
    end

    def consulta_endpoint_tow
        response = Faraday.get(URL)
        response.body
    end

    def consulta_paginacion(data)
        
        data.each do |dat|
            puts dat
        end
    end

  end