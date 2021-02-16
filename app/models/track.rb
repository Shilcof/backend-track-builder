class Track < ApplicationRecord
    has_many :segments

    def segments_attributes=(attributes)
        attributes.each { |pos, type|
            self.segemnts.build({position: pos, segment_type: type})
        }
    end
end
