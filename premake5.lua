project "GLFW"
	kind "StaticLib"
	language "C"
	staticruntime "on"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/null_platform.h",
		"src/null_init.c",
		"src/null_monitor.c",
		"src/null*.*",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c",
		"src/platform.c"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/win32*.c",
		}

		links
		{
			"-lgdi32"
		}

	filter "system:linux"
		pic "on"
		staticruntime "on"
		systemversion "latest"

		defines
		{
			"_GLFW_X11",
		}

		files
		{
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/posix_time.c",
			"src/posix_thread.c",
			"src/x11_window.c",
			"src/glx_context.c",
			"src/egl_context.c",
			"src/linux_joystick.c",
			"src/osmesa_context.c",
			"src/x11*.c",
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
