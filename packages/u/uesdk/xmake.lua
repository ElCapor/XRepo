package("uesdk")
set_homepage("https://github.com/raax7/Universal-UE-SDK")
set_license("MIT")
add_deps("libhat")

set_sourcedir(os.scriptdir().."/source")
on_install(function(package)
    import("package.tools.xmake").install(package)
    os.cp(os.scriptdir().."/source/include/", package:installdir())
    -- let us access the offsets pls
    os.cp(os.scriptdir().."/source/src/private/Offsets.hpp", package:installdir("include"))
end)
package_end()
