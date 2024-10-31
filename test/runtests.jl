using Test
using GKPY11

@testset "Test δ1 function" begin
    @test δ1(0.1) ≈ 0.005348662528080389
    @test δ1(0.5) ≈ 0.7547425109417016
    @test δ1(1.5) ≈ 2.9163793203966426
    @test δ1(2.0) ≈ 2.967957560740781
end

@testset "Test cotδ1 function" begin
    @test cotδ1(0.1) ≈ 186.9608446351338
    @test cotδ1(0.5) ≈ 1.0632707316721013
    @test cotδ1(1.5) ≈ -4.36490825792332
    @test cotδ1(2.0) ≈ -5.701209421847014
end

@testset "Test δ3 function" begin
    @test δ3(0.1) ≈ 4.4539237752958584e-7
    @test δ3(0.5) ≈ 0.0020545780665097556
    @test δ3(1.5) ≈ 0.04172757888407087
    @test δ3(2.0) ≈ 0.07382739896763756
end

@testset "Test cotδ3 function" begin
    @test cotδ3(0.1) ≈ 2.2452113023274797e6
    @test cotδ3(0.5) ≈ 486.7172531445134
    @test cotδ3(1.5) ≈ 23.951054971265382
    @test cotδ3(2.0) ≈ 13.520488669013462
end

@testset "Test δ0 function" begin
    @test δ0(0.5^2) ≈ 39.86680197881492
    @test δ0(1.1^2) ≈ 249.68337945026678
    @test δ0(1.4^2) ≈ 310.8928743137025
    @test δ0(2.0^2) ≈ 359.88122836077986
end
