using Test
using StaticArrays
using LinearAlgebra

include("./../src/base/se2.jl")
using .SE2

@testset "SE2 – Transformaciones homogéneas" begin

    @testset "Caso básico (x, y, θ en radianes)" begin
        T = Se2(1.0, 2.0, pi/2)

        @test size(T) == (3, 3)
        @test isapprox(T[1,1],  0.0; atol=1e-8)
        @test isapprox(T[1,2], -1.0; atol=1e-8)
        @test isapprox(T[2,1],  1.0; atol=1e-8)
        @test isapprox(T[2,2],  0.0; atol=1e-8)
        @test T[1,3] == 1.0
        @test T[2,3] == 2.0
        @test T[3,:] == [0.0, 0.0, 1.0]
    end

    @testset "Ángulo en grados" begin
        T = Se2(0.0, 0.0, 90.0; deg=true)

        @test isapprox(T[1,1],  0.0; atol=1e-8)
        @test isapprox(T[1,2], -1.0; atol=1e-8)
        @test isapprox(T[2,1],  1.0; atol=1e-8)
        @test isapprox(T[2,2],  0.0; atol=1e-8)
    end

    @testset "Entrada como SVector{2}" begin
        xy = @SVector [3.0, 4.0]
        T = Se2(xy)

        @test T[1:2, 1:2] ≈ I(2)
        @test T[1,3] == 3.0
        @test T[2,3] == 4.0
    end

    @testset "Entrada como SVector{2} con θ" begin
        xy = @SVector [1.0, 2.0]
        θ  = pi

        T = Se2(xy, θ)

        @test isapprox(T[1,1], -1.0; atol=1e-8)
        @test isapprox(T[2,2], -1.0; atol=1e-8)
        @test T[1,3] == 1.0
        @test T[2,3] == 2.0
    end

    @testset "Entrada como SVector{3}" begin
        xyt = @SVector [1.0, 2.0, pi/2]
        T = Se2(xyt)

        @test isapprox(T[1,1],  0.0; atol=1e-8)
        @test isapprox(T[2,1],  1.0; atol=1e-8)
        @test T[1,3] == 1.0
        @test T[2,3] == 2.0
    end

    @testset "Identidad" begin
        T = Se2(0.0, 0.0, 0.0)
        @test T ≈ I(3)
    end

end
