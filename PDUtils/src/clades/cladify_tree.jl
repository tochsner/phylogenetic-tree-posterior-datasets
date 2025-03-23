struct CladifiedTree
    tip_names::Vector{String}
    root::AbstractClade
    splits::Dict{Clade,Split}
end

function cladify_tree(tree::Tree, clade_visitor, split_visitor)
    tip_indices = get_leaf_index_mapping(tree)
    num_taxa = tree.numtaxa
    cladify_node(getroot(tree), clade_visitor, split_visitor, tip_indices, num_taxa)
end

function cladify_node(
    node,
    clade_visitor,
    split_visitor,
    tip_indices::Dict{String,Int},
    num_taxa::Int,
)
    if isleaf(node)
        taxa_index = tip_indices[node.name]
        leaf = Leaf(taxa_index, num_taxa, node.name)
        clade_visitor(leaf)
        return leaf
    end

    children = getchildren(node)
    clade1 = cladify_node(children[1], clade_visitor, split_visitor, tip_indices, num_taxa)
    clade2 = cladify_node(children[2], clade_visitor, split_visitor, tip_indices, num_taxa)

    combined_clade = union(clade1, clade2)
    clade_visitor(combined_clade)

    split = Split(clade1, clade2, combined_clade)
    split_visitor(split)

    return combined_clade
end