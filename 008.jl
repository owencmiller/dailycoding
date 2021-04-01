#=
A unival tree (which stands for "universal value") is a tree where all nodes under it have the same value.

Given the root to a binary tree, count the number of unival subtrees.

For example, the following tree has 5 unival subtrees:

     0
    / \
   1   0
      / \
     1   0
    / \
   1   1
=#


mutable struct Node
    val :: Int
    left :: Union{Nothing, Node}
    right :: Union{Nothing, Node}
    Node(v) = new(v, nothing, nothing)
    Node(v, l, r) = new(v, l, r)
end


function solve(root::Node)
    if root.left == nothing && root.right == nothing
        return 1
    end
    if root.left == nothing || root.right == nothing
        if root.left == nothing
            return solve(root.right)
        else
            return solve(root.left)
        end
    end
    l = solve(root.left)
    r = solve(root.right)

    if root.left.val == root.right.val == root.val
        return l + r + 1
    else
        return l + r
    end
end



#println(solve(Node(val=0, left=Node(val=1), right=Node(val=0, left=Node(val=1, left=Node(val=1), right=Node(val=1)), right=Node(val=0)))))


println(solve(Node(0, Node(1), Node(0, Node(1, Node(1), Node(1)), Node(0)))))

