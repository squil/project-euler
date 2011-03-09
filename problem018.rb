#! /usr/bin/ruby

class Node
  attr_accessor :value, :left, :right

  def initialize(options)
    @value = options[:value]
    @left = options[:left]
    @right = options[:right]
  end

  def leaf?
    self.left.nil? && self.right.nil?
  end

  def <=>(node)
    self.value <=> node.value
  end
end

triangle = %(75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23).split("\n").map{|line| line.split(' ').map(&:to_i)}


def create_tree(triangle, row, column)
  if row == triangle.length - 1
    return Node.new(:value => triangle[row][column])
  else
    return Node.new(:value => triangle[row][column],
                    :left => create_tree(triangle, row + 1, column),
                    :right => create_tree(triangle, row + 1, column + 1)
                   )
  end
end

def max(tree, sum)
  if tree.leaf?
    return sum + tree.value
  else
    return [max(tree.left, sum), max(tree.right, sum)].max + tree.value
  end
end

tree = create_tree(triangle, 0, 0)
puts max(tree, 0)
