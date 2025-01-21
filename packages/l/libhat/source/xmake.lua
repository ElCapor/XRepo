add_rules("mode.debug", "mode.release")
set_languages("cxx20")

option("static", {showmenu=true, default=true})
option("shared", {showmenu=true, default=false})
option("sse", {showmenu=true, default=false })
option("avx", {showmenu=true, default=false})

target("libhat")
    if has_config("static") then 
        set_kind("static")
    else
        set_kind("shared")
        add_defines("LIBHAT_BUILD_SHARED_LIB")
    end
    if has_config("sse") then
        print("Using SSE")
    else
        add_defines("LIBHAT_DISABLE_SSE")
    end

    if has_config("avx") then 
        print("using AVX")
    else
        add_defines("LIBHAT_DISABLE_AVX512")
    end
    add_includedirs("include")
    add_files("src/**.cpp")