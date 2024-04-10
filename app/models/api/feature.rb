class Api::Feature < ApplicationRecord
    validates :coord_latitud, presence: true
    validates :coord_longitud, presence: true
    validates :magnitud, presence: true

    def validando
        if self.magnitud < -1.0 || self.magnitud > 10.0
            return nil
        elsif self.coord_latitud < -90.0 || self.coord_latitud > 90.0
            return nil
        elsif self.coord_longitud < -180.0 || self.coord_longitud > 180.0
            return nil
        end
    end
end
