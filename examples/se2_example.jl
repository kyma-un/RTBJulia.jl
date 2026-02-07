using RoboticsToolbox
using StaticArrays
using RoboticsToolbox.se2: Se2

println("=== SE(2) examples ===")

T1 = Se2(1.0, 2.0, pi/4)
println("T1 =\n", T1)

T2 = Se2(@SVector [1.0, 2.0])
println("T2 =\n", T2)

T3 = Se2(@SVector [1.0, 2.0], 90.0; deg=true)
println("T3 =\n", T3)
