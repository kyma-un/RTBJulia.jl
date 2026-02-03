module SE3

using StaticArrays

export SE3, embed_se2

struct SE3{T}
    R::SMatrix{3,3,T,9}
    t::SVector{3,T}
end

function embed_se2(x::SMatrix{3,3,T,9}) where T
    R2 = x[1:2, 1:2]
    t2 = x[1:2, 3]

    R = @SMatrix [
        R2[1,1] R2[1,2] zero(T)
        R2[2,1] R2[2,2] zero(T)
        zero(T) zero(T) one(T)
    ]

    t = @SVector [t2[1], t2[2], zero(T)]

    return SE3(R, t)
end

end # module
