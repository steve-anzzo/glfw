project "GLFW"
	kind "StaticLib"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "src/**.h"
        "src/**.c"
        "src/**.m"
        "src/**.in"
	}

	filter "system:windows"
		staticruntime "On"
		systemversion "latest"
		cppdialect "C++latest"

	filter {"system:windows", "configurations:Release"}
		buildoptions "/MT"
