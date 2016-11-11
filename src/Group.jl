module Group

function grouper(condition)
    function(aa::Array{Array{Any,1},1}, e)
        if isempty(aa)
            push!(aa,[e])
        else
            if condition(aa[end][end], e)
                push!(aa[end], e)
            else
                push!(aa, [e])
            end
        end
        aa
    end
end



"""
group((x,y)->x==y, [1,1,2,1,1,1,3,4,4] )
5-element Array{Array{Any,1},1}:
 Any[1,1]
 Any[2]
 Any[1,1,1]
 Any[3]
 Any[4,4]                     
"""
function group(condition::Function, startel, xs)
    f = grouper(condition)   
    foldl(f, startel, xs)
end

group(condition::Function, xs) = group(condition, Array{Array{Any,1},1}(), xs)

"""
[1,2,2,3] |> group((x,y)->x==y)

the same as: group((x,y)->x==y), [1,2,2,3])
"""
group(condition::Function) = xs->group(condition, xs)



end # module