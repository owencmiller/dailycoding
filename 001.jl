#=
This problem was recently asked by Google.

Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

Bonus: Can you do this in one pass?
=#

function solve(list, sum)
    look_for = Set()

    for num in list
        if num in look_for
            return true
        end
        push!(look_for, sum-num)
    end
    return false
end

@assert solve([10,15,3,7], 17) == true
@assert solve([10,15,3,7], 16) == false
