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
		"./**.h",
		"./**.c",
		"./**.hpp",
		"./**.cpp"
	}

	excludes {
		"./samples/**.c",
		"./samples/**.cpp",
	}

 	filter "system:windows"
		disablewarnings { "4996", "4065" }

 	filter "configurations:Debug"
		defines { "MLE_DEBUG_BUILD", "DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines { "MLE_RELEASE_BUILD", "NDEBUG" }
		flags { "LinkTimeOptimization" }
		runtime "Release"
		optimize "speed"
		intrinsics "on"

	filter "configurations:Distribution"
		defines {  "MLE_DISTRIBUTION_BUILD", "NDEBUG" }
		flags { "LinkTimeOptimization" }
		runtime "Release"
		optimize "speed"
		intrinsics "on"