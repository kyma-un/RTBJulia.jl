module BasePlotsMakieExt

using GLMakie


function BasePlots.trplot3(T::SE3; scale=1.0, linewidth=3)
    fig = Figure()
    ax = Axis3(fig[1, 1],
        xlabel="X",
        ylabel="Y",
        zlabel="Z",
        aspect=:data
    )

    o = T.t
    x̂ = o + scale * T.R[:, 1]
    ŷ = o + scale * T.R[:, 2]
    ẑ = o + scale * T.R[:, 3]

    lines!(ax, [o[1], x̂[1]], [o[2], x̂[2]], [o[3], x̂[3]],
        color=:red, linewidth=linewidth)
    lines!(ax, [o[1], ŷ[1]], [o[2], ŷ[2]], [o[3], ŷ[3]],
        color=:green, linewidth=linewidth)
    lines!(ax, [o[1], ẑ[1]], [o[2], ẑ[2]], [o[3], ẑ[3]],
        color=:blue, linewidth=linewidth)

    scatter!(ax, [o[1]], [o[2]], [o[3]], color=:black, markersize=10)

    fig
end

end # module
