module SE2

using StaticArrays

export Se2

# ============================================================
# SE(2) homogeneous transformation
# ============================================================

function Se2(x, y, θ; deg::Bool=false)
    # type normalization
    x, y, θ = promote(float(x), float(y), float(θ))

    θ = deg ? θ * (pi / 180) : θ

    c = cos(θ)
    s = sin(θ)

    return @SMatrix [
        c   -s   x
        s    c   y
        0.0  0.0  1.0
    ]
end

# se2([x, y])
Se2(xy::SVector{2}; deg::Bool=false) =
    Se2(xy[1], xy[2], zero(eltype(xy)); deg=deg)

# se2([x, y], θ)
Se2(xy::SVector{2}, θ; deg::Bool=false) =
    Se2(xy[1], xy[2], θ; deg=deg)

# se2([x, y, θ])
Se2(xyt::SVector{3}; deg::Bool=false) =
    Se2(xyt[1], xyt[2], xyt[3]; deg=deg)

end # module
