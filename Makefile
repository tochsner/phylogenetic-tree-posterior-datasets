build:
	julia --project=PDUtils PDUtils/scripts/build.jl
	zip -r PDUtils.zip PDUtilsCompiled

install:
	unzip PDUtils.zip -d PDUtilsCompiled

citations:
	awk 1 datasets/**/*.bib >> all_citations.bib 

.PHONY: build install citations