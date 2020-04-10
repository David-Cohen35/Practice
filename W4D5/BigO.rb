require "byebug"
def sluggish_octopus(array)
   
  array.each_with_index do |fish1, i1|
    max_length = true
    
    array.each_with_index do |fish2, i2|
      next if i1 == i2
      max_length = false if fish2.length > fish1.length
    end
    
    return fish1 if max_length
  end

end


class Array

    def merge_octopus(&prc)
        prc ||= Proc.new { |x, y| x <=> y }

        return self if self.count <= 1

        mid = self.length / 2
        sorted_left = self.take(mid).merge_octopus
        sorted_right = self.drop(mid).merge_octopus

        Array.merge(sorted_left, sorted_right, &prc)
    end

    def self.merge(left, right, &prc)
        merged = []

        until left.empty? || right.empty?
            case prc.call(left.first, right.first)
            when -1
                merged << left.shift
            when 0 
                merged << left.shift
            when 1
                merged << right.shift
            end
        end

        merged.concat(left)
        merged.concat(right)
        merged
    end
end

def clever_octopus(array)
    biggest = array.first
    
    array.each do |fish|
        if fish.length > biggest.length
            biggest = fish
        end
    end
    biggest
end


TILES_ARRAY = [
    "up", 
    "right-up",
    "right",
    "right-down",
    "down",
    "left-down",
    "left",
    "left-up" 
]


def slow_dance(direction, array)
    array.each do |el|
        return array.index(el) if direction == el
    end
end
# p slow_dance('up', TILES_ARRAY)
# p slow_dance('right-down', TILES_ARRAY)

TILES_HASH = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def constant_dance!(direction, hash)
    return hash[direction]
end

p constant_dance!('up', TILES_HASH)
p constant_dance!("right-down", TILES_HASH)
