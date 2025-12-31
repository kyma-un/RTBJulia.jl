include("../src/base/HomogenousTransforms.jl")
using StaticArrays
using Rotations
using .HomogenousTransforms

println("=== Testing SE3 constructors ===")

# Example 1: Rotation + Translation
p = SVector(1.0, 0.0, 0.0)
tr = Translation(1.0, 2.0, 3.0)
R = RotX(0)

H1 = SE3(R, tr)
println("H1: ", H1)

# Example 2: SMatrix + SVector
Rs = SMatrix{3,3,Float64,9}(vec(RotMatrix(R)))
H2 = SE3(Rs, SVector(1.0, 2.0, 3.0))
println("H2: ", H2)

# Example 3: Rotation + SVector
H3 = SE3(R, SVector(1.0, 2.0, 3.0))
println("H3: ", H3)

# Example 4: Rotation + NTuple
H4 = SE3(R, (4.0, 5.0, 6.0))
println("H4: ", H4)

# Test action on a point
x = SVector(1.0, 1.0, 1.0)
println("H1(x) = ", H1(x))
println("H2(x) = ", H2(x))
println("H3(x) = ", H3(x))
println("H4(x) = ", H4(x))
