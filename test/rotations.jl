using Rotations
using LinearAlgebra

rx = RotX(2)
ry = RotY(1)
rz = RotZ(2)


R= rx * ry * rz


det(R)

aa = AngleAxis(R)

theta = aa.theta


r = R
aa = AngleAxis(r)
rv = RotationVec(r)
ϕ = rotation_angle(r)
v = rotation_axis(r)

norm(v)
norm(rv)
aa