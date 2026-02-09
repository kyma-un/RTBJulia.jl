module RoboticsToolbox

using LinearAlgebra
using StaticArrays
using Rotations
using CoordinateTransformations

include("base/HomogenousTransforms.jl")
include("plotting/BasePlots.jl")
include("base/se2.jl")
include("base/se3.jl")

using .HomogenousTransforms
using .BasePlots
using .SE2
using .SE3
# Exportar lo propio
export Se2, Se3, HomogenousTransform, trplot3

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
