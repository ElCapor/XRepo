add_rules("mode.debug", "mode.release")
set_languages("cxx20")
add_requires("libhat")

target("UESDK")
    set_kind("static")
    add_includedirs("include", "src")
    add_files("src/**.cpp")
    add_packages("libhat")