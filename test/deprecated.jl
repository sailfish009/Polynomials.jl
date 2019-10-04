
@testset "Construction" begin
    @test_deprecated Poly(1)
    @test_deprecated Poly(2, "x")
    @test_deprecated Poly(collect(1:10))
    @test_deprecated Poly(collect(1:10), "x")
    # @test_deprecated Poly{Float64}(collect(1:10))
    # @test_deprecated Poly{Float64}(collect(1:10), "x")
end

@testset "From roots" begin
    @test_deprecated poly([1, 2])
    @test_deprecated poly([1, 2], "s")

    M = [1 2; 3 4]
    @test_deprecated poly(M)
    @test_deprecated poly(M, "s")
end

@testset "Evaluation" begin
    p1 = Polynomial([1, 2, 3, 0, 5])

    @test_deprecated polyval(p1, 1)
    @test_deprecated polyval(p1, randn(10))
end

@testset "Integrals and Derivatives" begin
    p1 = Polynomial([1, 2, 3, 0, 5])
    @test_deprecated polyint(p1)
    @test_deprecated polyint(p1, 3)
    @test_deprecated polyint(p1, 0, 5)

    @test_deprecated polyder(p1)
    @test_deprecated polyder(p1, 2)
end

@testset "Fits and Pade" begin
    xs = range(0, π, length = 10)
    ys = sin.(xs)

    @test_deprecated polyfit(xs, ys)
    @test_deprecated polyfit(xs, ys, 2)
    @test_deprecated polyfit(xs, ys, :t)

    a = Polynomial(1:17)
    PQexp = Pade(a, 8, 8)
    @test_deprecated padeval(PQexp, 1.0)
end