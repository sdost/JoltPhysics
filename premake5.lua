project "joltphysics"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  staticruntime "off"

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

  files { "Jolt/Jolt.natvis" }


filter "configurations:Debug"
  symbols "on"
  optimize "off"

  defines
  {
      "_DEBUG",
      "JPH_DEBUG_RENDERER",
      "JPH_FLOATING_POINT_EXCEPTIONS_ENABLED",
      "JPH_ENABLE_ASSERTS"
  }

filter "configurations:Release"
  optimize "speed"
  vectorextensions "AVX2"
  isaextensions { "BMI", "POPCNT", "LZCNT", "F16C" }

  defines
  {
      "JPH_DEBUG_RENDERER",
      "JPH_FLOATING_POINT_EXCEPTIONS_ENABLED",
  }