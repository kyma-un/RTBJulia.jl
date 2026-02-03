module SE2

using StaticArrays

export se2

# ============================================================
# SE(2) homogeneous transformation
# ============================================================

function se2(x::T, y::T, θ::T; deg::Bool=false) where T
    θ = deg ? θ * (pi / one(T) / 180) : θ

    c = cos(θ)
    s = sin(θ)

    return @SMatrix [
        c   -s   x
        s    c   y
        zero(T) zero(T) one(T)
    ]
end

# se2([x, y])
se2(xy::SVector{2,T}; deg::Bool=false) where T =
    se2(xy[1], xy[2], zero(T); deg=deg)

# se2([x, y], θ)
se2(xy::SVector{2,T}, θ::T; deg::Bool=false) where T =
    se2(xy[1], xy[2], θ; deg=deg)

# se2([x, y, θ])
se2(xyt::SVector{3,T}; deg::Bool=false) where T =
    se2(xyt[1], xyt[2], xyt[3]; deg=deg)

end # module
