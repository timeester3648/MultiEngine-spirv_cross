include "../../premake/common_premake_defines.lua"

project "spirv_cross"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	includedirs {
		"%{IncludeDir.spirv_cross}",
		"%{IncludeDir.spirv_headers}/spirv/unified1"
	}

	files {
		"./*.h",
		"./*.c",
		"./*.hpp",
		"./*.cpp"
	}

	filter "action:vs*"
		disablewarnings { "4996", "4065" }