using RTBJulia
using StaticArrays

# Definición de translacion y rotacion 
t = Translation(0.0, 1.0, 2.0)
R = RotY(pi/2) * RotZ(pi/4)

# Definición de punto en el espacio 
p = SVector(1.0, 0.0, 0.0) # unitario en x 

# Construcción de la transformación homogénea SE3
H = SE3(R, t)
println("Transformación homogenea: ")
println(H)

# Aplicación de la transformación al punto p
p_transformed = H(p)
println("Punto transformado: ")
println(p_transformed)


