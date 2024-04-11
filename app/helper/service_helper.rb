module ServiceHelper
    URL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson".freeze

    def consulta_endpoint
      response = Faraday.get(URL)
      response.body
    end

    def task_ejecute_help
      Rake::Task['frogmi:feature_USGS'].invoke
    end

end