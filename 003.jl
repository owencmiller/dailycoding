#= 
Day 003

This problem was asked by Google.
Given the root to a binary tree, implement serialize(root), which serializes the tree into a string, and deserialize(s), which deserializes the string back into the tree.
For example, given the following Node class
class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
The following test should pass:
node = Node('root', Node('left', Node('left.left')), Node('right'))
assert deserialize(serialize(node)).left.left.val == 'left.left'
=#


Base.@kwdef mutable struct Node
    val :: String
    left :: Union{Node, Nothing} = nothing
    right :: Union{Node, Nothing} = nothing
end


function serialize(node)
    if node == nothing
        return "*"
    end
    return node.val * " " * serialize(node.left) * " " * serialize(node.right)
end


function builder(data)
    if data[1] == "*"
        return nothing 
    end
    v = popfirst!(data) # data never gets copied, only manipulated
    node = Node(val = v, left = builder(data), right = builder(data))
    return node
end

function deserialize(data)
    preorder = split(data, " ")
    return builder(preorder)
end




node = Node(val="root", left=Node(val="left", left=Node(val="left.left")), right=Node(val="right"))
data = serialize(node)
println(data)
println(deserialize(data))
