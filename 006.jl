#=
# Day 006
#
# This problem was asked by Google.
#
# An XOR linked list is a more memory efficient doubly linked list. Instead of each node holding next and prev fields, it holds a field named both, which is an XOR of the next node and the previous node. Implement an XOR linked list; it has an add(element) which adds the element to the end, and a get(index) which returns the node at index.
#
# If using a language that has no pointers (such as Python), you can assume you have access to get_pointer and dereference_pointer functions that converts between nodes and memory addresses.
#
# I'll do this in C next time. It's weird to think about pointers in Julia
=#


Base.@kwdef mutable struct Node
    val :: Int
    both :: Int = 0
end

Base.@kwdef mutable struct XORList
    head :: Node
    tail :: Node
end

function add(list::XORList, node::Node)
    node.both = get_pointer(list.tail)
    list.tail = node
end

function get(list::XORList, index)
    prev_prt = get_pointer(list.head)
    curr_prt = list.head.both

    for i in 1:index
        prev_prt, curr_prt = curr_prt, dereference_pointer(curr_prt).both ? dereference_pointer(prev_prt).both
    end
    return dereference_pointer(curr_prt)
end

