struct CCD1 <: CCD
    num_taxa::Int
    num_trees::Int

    tip_names::Vector{String}
    root_clade::AbstractClade
    clades::Set{AbstractClade}
    splits::Set{Split}
    splits_per_clade::Dict{AbstractClade,Set{Split}}

    num_clade_occurrences::Dict{AbstractClade,Int}
    num_split_occurrences::Dict{Split,Int}
end

function CCD1(trees::Vector{Tree})
    num_taxa = length(tiplabels(trees[1]))
    tip_names = get_tip_names(trees[1])
    num_trees = length(trees)
    root_clade = Clade(1:num_taxa, num_taxa)

    clades = Set{AbstractClade}()
    num_clade_occurrences = DefaultDict{AbstractClade,Int64}(0)

    function clade_visitor(clade::AbstractClade)
        push!(clades, clade)
        num_clade_occurrences[clade] += 1
    end

    splits = Set{Split}()
    num_split_occurrences = DefaultDict{Split,Int64}(0)
    splits_per_clade = DefaultDict{Clade,Set{Split}}(Set)

    function split_visitor(split::Split)
        push!(splits, split)
        push!(splits_per_clade[split.parent], split)
        num_split_occurrences[split] += 1
    end

    for tree in trees
        cladify_tree(tree, clade_visitor, split_visitor)
    end

    return CCD1(num_taxa, num_trees, tip_names, root_clade, clades, splits, splits_per_clade, num_clade_occurrences, num_split_occurrences)
end

function log_density(ccd::CCD1, split::Split)
    split_occurrences = get(ccd.num_split_occurrences, split, 0.0)

    if split_occurrences == 0.0
        -Inf
    else
        log(split_occurrences / ccd.num_clade_occurrences[split.parent])
    end
end