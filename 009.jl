#=
This problem was asked by Airbnb.

Given a list of integers, write a function that returns the largest sum of non-adjacent numbers. Numbers can be 0 or negative.

For example, [2, 4, 6, 2, 5] should return 13, since we pick 2, 6, and 5. [5, 1, 1, 5] should return 10, since we pick 5 and 5.

Follow-up: Can you do this in O(N) time and constant space?


2 + 6 = 8
2 + 2 = 4
2 + 5 = 7
4 + 2 = 6
4 + 5 = 9
6 + 5 = 11


=#

function helper(list)
    println("helpercalled")
    if length(list) == 1
        return list[1]
    end
    if length(list) == 2
        return max(list[1], list[2])
    end
    return list[1] + helper(list[3:end])
end

function solve(list)
    max = 0
    for i in 1:length(list)
        s = helper(list[i:end])
        if s >= max 
            max = s
        end
    end
    return max
end

println(solve([2,4,6,2,5]))
