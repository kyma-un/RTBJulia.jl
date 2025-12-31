using CoordinateTransformations
using Rotations
using LinearAlgebra
using StaticArrays

x = SVector(1.0, 0.0, 0.0)
tr = Translation(1.0, 2.0, 3.0)

tr(x)



