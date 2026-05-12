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


-- SDE-8: Jolt stays optimized in Debug. We retain JPH_ENABLE_ASSERTS so
-- contract violations still trip during testing; the integration with
-- Seidr is rarely the thing being stepped through, and the per-frame
-- physics-tick cost dominates the Debug build without optimization.
filter "configurations:Debug"
  symbols "on"
  optimize "speed"
  runtimechecks "Off"
  vectorextensions "AVX2"
  isaextensions { "BMI", "POPCNT", "LZCNT", "F16C" }

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