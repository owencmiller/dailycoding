#=
This problem was asked by Uber.
Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.
For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].
Follow-up: what if you can't use division?
=#

function solve(list)
    product = prod(list)
    ans = []
    for i in list 
        push!(ans, product/i)
    end
    return ans
end


function nodiv_helper(list, curr)
    if length(list) == 1
        return [curr]
    end
    newlist = copy(list)
    last = pop!(newlist)
    return append!(nodiv_helper(newlist, curr*last), prod(newlist)*curr)
end


function solve_nodiv(list)
    return nodiv_helper(list, 1)
end


println(solve([1,2,3,4,5]))
println(solve_nodiv([1,2,3,4,5]))


