package("libhat")
set_homepage("https://github.com/BasedInc/libhat")
set_description("Libhat")
set_license("MIT")
--add_includedirs(os.scriptdir().."/port/include/")
set_sourcedir(os.scriptdir().."/source")
add_configs("static", {description="Build libhat as a static library", default=true, type="boolean"})
add_configs("shared", {description="Build libhat as a static library", default=false, type="boolean"})
add_configs("sse", {description="Disables SSE scanning", default=false, type="boolean"})
add_configs("avx", {description="Disables AVX512 scanning", default=false, type="boolean"})

on_install(function (package) 
    local configs = {
        static = package:config("static"),
        shared = package:config("shared"),
        sse = package:config("sse"),
        avx = package:config("avx")
    }
    import("package.tools.xmake").install(package, configs)
    os.cp(os.scriptdir().."/source/include/", package:installdir())

end)
package_end()