project "joltphysics"
kind "StaticLib"
language "C++"

targetdir("bin/" .. outputdir .. "/%{prj.name}")
objdir("bin-int/" .. outputdir .. "/%{prj.name}")

files
{
  "Jolt/**.h",
  "Jolt/**.cpp",
  "Jolt/**.inl"
}

includedirs
{
  "."
}

filter "system:windows"
systemversion "latest"
cppdialect "C++17"
staticruntime "off"

filter "system:linux"
pic "On"
systemversion "latest"
cppdialect "C++17"
staticruntime "off"

filter "configurations:Debug"
runtime "Debug"
symbols "on"

filter "configurations:Release"
runtime "Release"
optimize "on"
