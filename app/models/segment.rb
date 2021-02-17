class Segment < ApplicationRecord
  belongs_to :track

  def next(from, segments)
    dir = self.position - from
    case self.segment_type
    when 0..1
      if dir == 1 || dir == -1
        return segments.find{|s| s.position === self.position + dir}
      else
        return false
      end
    when 2
      if dir == 9 || dir == -9
        return segments.find{|s| s.position === self.position + dir}
      else
        return false
      end
    when 10
      if dir == 1 || dir == 9
        dir = dir == 1 ? -9 : -1
        return segments.find{|s| s.position === self.position + dir}
      else
        return false
      end
    when 11
      if dir == -1 || dir == 9
        dir = dir == -1 ? -9 : 1
        return segments.find{|s| s.position === self.position + dir}
      else
        return false
      end
    when 12
      if dir == 1 || dir == -9
        dir = dir == 1 ? 9 : -1
        return segments.find{|s| s.position === self.position + dir}
      else
        return false
      end
    when 13
      if dir == -1 || dir == -9
        dir = dir == -1 ? 9 : 1
        return segments.find{|s| s.position === self.position + dir}
      else
        return false
      end
    end
  end
end