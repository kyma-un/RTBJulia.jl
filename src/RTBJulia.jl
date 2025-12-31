module RTBJulia

using LinearAlgebra
using StaticArrays
using Rotations
using CoordinateTransformations

include("base/HomogenousTransforms.jl")
include("plotting/BasePlots.jl")

using .HomogenousTransforms
using .BasePlots

# Exportar lo propio
export SE3, HomogenousTransform, trplot3

# -------------------------------
# Reexportar todo Rotations.jl
# -------------------------------
for name in names(Rotations; all = false)
    # all=false para solo nombres exportados por Rotations
    @eval export $(name)
end

# Reexportar Translation
export Translation

end
