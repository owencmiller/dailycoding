#=
This problem was asked by Facebook.

Given the mapping a = 1, b = 2, ... z = 26, and an encoded message, count the number of ways it can be decoded.

For example, the message '111' would give 3, since it could be decoded as 'aaa', 'ka', and 'ak'.

You can assume that the messages are decodable. For example, '001' is not allowed.
=#

function solve(message)
    if length(message) <= 1
        return 1
    end
    if parse(Int,message[1:2]) < 26
        return solve(message[2:end]) + solve(message[3:end])
    else
        return solve(message[2:end])
    end
end

println(solve("1111"))
