class Track < ApplicationRecord
    has_many :segments, dependent: :destroy

    def segments_attributes=(attributes)
        segments.each{|s| s.destroy}
        attributes.each { |pos, type|
            if type != 99
                self.segments.build({position: pos, segment_type: type})
            end
        }
    end

    def valid_track?
        path = {}
        current = segments.find_by(position: 41)
        from = 40
        path[current.position] = current.segment_type
        while current.position != 40
            current, from = current.next(from), current.position
            if !current || path[current.position]
                return false
            else
                path[current.position] = current.segment_type
            end
        end

        # check path length - no unused track segments
        if path.size == segments.size
            return true
        else
            return false
        end
    end
end
