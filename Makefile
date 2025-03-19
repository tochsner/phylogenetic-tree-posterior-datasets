build:
	julia --project=PDUtils PDUtils/scripts/build.jl
	zip -r PDUtils.zip PDUtilsCompiled

install:
	unzip PDUtils.zip -d PDUtilsCompiled
