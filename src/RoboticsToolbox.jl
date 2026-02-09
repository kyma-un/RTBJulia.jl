"""
    module RoboticsToolbox

Main entry point for the RoboticsToolbox package.

This module provides a unified public API for common robotics utilities,
including homogeneous transformations and visualization tools. Internal
functionality is delegated to specialized submodules.
"""
module RoboticsToolbox

# ------------------------------------------------------------------
# Internal submodules
# ------------------------------------------------------------------
include("base/HomogenousTransforms.jl")
include("plotting/BasePlots.jl")

# Import submodules
using .HomogenousTransforms: Se2, Se3, Transl
using .BasePlots: trplot3


end # module RoboticsToolbox
