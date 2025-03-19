module PDUtils

include("dataset.jl")
include("add_dataset.jl")
include("add_dataset_cli.jl")

function julia_main()::Cint
    gather_details()
    return 0
end

export julia_main

end # module PDUtils
