module BasePlots

export trplot3

"""
    trplot3(T; kwargs...)

Plot an SE(3) frame.
Requires a plotting backend (e.g. Makie).
"""
function trplot3(::Any; kwargs...)
    error("No plotting backend loaded. Load GLMakie or CairoMakie.")
end

end # module
