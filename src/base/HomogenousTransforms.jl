module HomogenousTransforms

using Rotations
using LinearAlgebra
using StaticArrays
using CoordinateTransformations

export SE3, Translation

# ============================================================
# SE(3) type
# ============================================================

struct SE3{T}
    R::SMatrix{3,3,T,9}  # rotation matrix
    t::SVector{3,T}      # translation vector
end

# ============================================================
# Constructors for SE3
# ============================================================

# Identity rotation + zero translation (default Float64)
SE3() = SE3{Float64}(SMatrix{3,3,Float64,9}(I), SVector{3,Float64}(0.0,0.0,0.0))

# Parametric identity with given translation
SE3(t::SVector{3,T}) where T = SE3{T}(SMatrix{3,3,T,9}(I), t)

# From StaticArrays matrix + SVector translation
SE3(R::SMatrix{3,3,T,9}, t::SVector{3,T}) where T = SE3{T}(R, t)

# General constructor: any Rotation + SVector / Translation / NTuple
SE3(R::RType, t) where {RType<:Rotation{3}} = begin
    tv = t isa SVector ? t :
         t isa Translation ? t.translation :
         SVector(t...)  # para NTuple
    T = eltype(tv)
    SE3{T}(SMatrix{3,3,T,9}(vec(RotMatrix(R))), tv)
end

# ============================================================
# Action on points
# ============================================================

(H::SE3{T})(x::SVector{3,T}) where T = H.R * x + H.t

end # module
