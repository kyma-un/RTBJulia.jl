
include("../src/base/HomogenousTransforms.jl")

using LinearAlgebra
using StaticArrays
using Rotations
using .HomogenousTransforms
# using GLMakie

p0 = SVector(1.0, 2.0, 3.0)
R = RotX(pi/4) 
t = SVector(4.0, 5.0, 6.0)

T = HomogenousTransform(R, t)


p1 = T(p0)

p0
p1


fig = trplot3(T, scale=0.5)
display(fig)