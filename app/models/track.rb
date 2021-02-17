class Track < ApplicationRecord
    has_many :segments, dependent: :destroy

    validates :name, presence: true
    validates :name, :creator, no_symbols: true
    validate :valid_track

    def segments_attributes=(attributes)
        attributes.each { |pos, type|
            if type == 99
                if segment = self.segments.find_by(position: pos)
                    segment.destroy
                end
            else
                if segment = self.segments.find_by(position: pos)
                    segment.update({segment_type: type})
                else
                    self.segments.build({position: pos, segment_type: type})
                end
            end
        }
    end

    def valid_track
        if !valid_track?
            errors.add(:segments, "must obey the track constructor rules")
        end
    end

    def valid_track?
        path = {}
        current = segments.find{|s| s.position === 41}
        puts current.position
        return false if !current
        from = 40
        path[current.position] = current.segment_type
        while current.position != 40
            puts current.position
            current, from = current.next(from, segments), current.position
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
