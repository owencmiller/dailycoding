#=
Day 004

This problem was asked by Stripe.

Given an array of integers, find the first missing positive integer in linear time and constant space. In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.

For example, the input [3, 4, -1, 1] should give 2. The input [1, 2, 0] should give 3.

You can modify the input array in-place.


This was a hard one
=#


function solve(list)

    for i in 1:length(list)
        println("---- Current List: ", list)
        println("---- Looking At Position: ", i)
        while i+1 != list[i] && 0 < list[i] <= length(list)
            num = list[i]
            list[i], list[num-1] = list[num-1], list[i]
            println("Swapping indicies: ", i, " <--> ", num-1)
            if list[i] == list[num-1]
                break
            end
        end
    end
    for i in 2:length(list)
        if list[i] != i
            return i
        end
    end

    return length(list)+1
end

println(solve([3,4,-1,1]))
