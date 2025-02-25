package("detours")
    set_homepage("https://github.com/ElCapor/XRepo")
    set_description("Hooking library for 1337 hax0rs")

    on_install("windows", function(package)
        os.cp(os.scriptdir().."/source/include/detours.h", package:installdir("include"))
        os.cp(os.scriptdir().."/source/include/HookManager.hpp", package:installdir("include"))
        if package:is_plat("x64") then
            package:add("defines", "DETOURS_X64")
            os.cp(os.scriptdir().."/source/lib/x64/detours.lib", package:installdir("lib"))
        else
            package:add("defines", "DETOURS_X86")
            os.cp(os.scriptdir().."/source/lib/x86/detours.lib", package:installdir("lib"))
        end
    end)

package_end()