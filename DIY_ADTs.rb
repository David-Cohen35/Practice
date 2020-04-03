#first homework trying to submit is crazy hard for some reason
class Stack

    def initialize
        @stack_array = []
    end

    def push(el)
        stack_array.push(el)
        el
    end

    def pop
        stack_array.pop
    end

    def peek
        stack_array.last
    end

    private
    attr_reader :stack_array
end

class Queue
    def initialize
        @queue_array = []
    end

    def enqueue(el)
        queue_array.push(el)
        el
    end

    def dequeue
        dequeue.shift
    end

    def peek
        queue_array.first
    end

    private
    attr_reader :queue_array
end

class Map

    def initialize
        @map_array = []
    end

    def set(key, value)
        pair_index = map_array.index { |pair| pair[0] == key }
        if pair_index
            map_array[pair_index][1] = value
        else
            map_array.push([key, value])
        end
        value
    end

    def get(key)
        map_array.each { |pair| return pair[1] if pair[0] == key }
        nil
    end

    def delete(key)
        value = get(key)
        map_array.reject! { |pair|[0] == key }
        value
    end

    def show
        deep_dup(map_array)
    end
    
    private

    attr_reader :map_array

    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end
end