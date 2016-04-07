class Imgui < Formula
    url "https://github.com/ocornut/imgui/archive/v1.47.tar.gz"
    head "https://github.com/ocornut/imgui.git"
    sha256 "d04c71d631673295eba7d6455bf53cf6159490273f37e76407446c1aebcde237"
    
    def install
        system "clang++ -c imgui.cpp -o imgui.o"
        system "clang++ -c imgui_draw.cpp -o imgui_draw.o"
        system "clang++ -c imgui_demo.cpp -o imgui_demo.o"
        system "ar -r imgui.a imgui.o imgui_draw.o imgui_demo.o"
        
        lib.mkpath
        cp "imgui.a", lib
        
        include.mkpath
        Dir.glob("*.h") do |file|
            cp file, include
        end
    end
    
    def test
    
    end
end