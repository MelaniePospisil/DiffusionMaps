using Test
include("../src/DiffusionMaps.jl")
using .DiffusionMaps
using Distances

@testset "DiffusionMap Test" begin
    # Generiere Testdaten
    data = ([0.0 0.0 0.0; 1.0 1.0 1.0; 2.0 2.0 2.0; 3.0 3.0 3.0; 4.0 4.0 4.0])

    # Erstelle DiffusionMap-Modell
    model = fit(DiffMap, data, ɛ=1.0, maxoutdim=2, t=1)

    # Teste die Eigenschaften des Modells
    @test size(model) == (5, 2)
    @test indim(model) == 3
    @test outdim(model) == 2
    @test length(eigvals(model)) == 2
    @test size(eigvecs(model), 2) == 2
    @test size(eigvecs(model), 1) == size(data, 1)
    @test DiffusionMaps.metric(model) isa PreMetric
    @test DiffusionMaps.kernel(model) isa Matrix

    # Teste die Reduktion der Dimensionen
    reduced_data = projection(model)
    @test size(reduced_data) == (size(data, 1), 2)

    # Teste die Vorhersage für neue Punkte
    new_points = ([0.5 0.5 0.5; 2.5 2.5 2.5])
    predicted_data = predict(model, new_points)
    @test size(predicted_data) == (size(new_points, 1), 2)
end
