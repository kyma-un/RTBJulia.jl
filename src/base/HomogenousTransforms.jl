module HomogenousTransforms

using Rotations
using LinearAlgebra
using StaticArrays
using CoordinateTransformations

export embed_se2, as_rotation_translation

# ============================================================
# Utilities for homogeneous transforms
# ============================================================

"""
    embed_se2(T::SMatrix{3,3})

Embebe una transformación homogénea SE(2) (3×3) en componentes de SE(3).

Retorna:
- R :: SMatrix{3,3}
- t :: SVector{3}
"""
function embed_se2(T::SMatrix{3,3,Tt,9}) where Tt
    R2 = T[1:2, 1:2]
    t2 = T[1:2, 3]

    R = @SMatrix [
        R2[1,1] R2[1,2] zero(Tt)
        R2[2,1] R2[2,2] zero(Tt)
        zero(Tt) zero(Tt) one(Tt)
    ]

    t = @SVector [t2[1], t2[2], zero(Tt)]

    return R, t
end

"""
    as_rotation_translation(R::Rotation{3}, t)

Convierte una rotación de `Rotations.jl` y una traslación en
`(Rmat, tvec)` con `StaticArrays`.
"""
function as_rotation_translation(R::Rotation{3}, t)
    tv = t isa SVector ? t :
         t isa Translation ? t.translation :
         SVector(t...)   # NTuple

    T = eltype(tv)
    Rm = SMatrix{3,3,T,9}(RotMatrix(R))

    return Rm, tv
end

end # module
