module PDUtils

function julia_main()::Cint
    println(get(ARGS, "file", ""))
    return 0
end

export julia_main

end # module PDUtils
