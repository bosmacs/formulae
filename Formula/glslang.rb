class Glslang < Formula
    url "https://github.com/KhronosGroup/glslang/archive/3.0.tar.gz"
    head "https://github.com/KhronosGroup/glslang.git"
    sha256 "91653d09a90440a0bc35aa490d0c44973501257577451d4c445b2df5e78d118c"
    
    depends_on "cmake" => :build

    def install
        cmake_args = std_cmake_args
        system "cmake", *cmake_args
        system "make"
        system "make", "install"
        
        #lib.mkpath
        #cp "glslang/glslang.a", lib
        
        #include.mkpath
        #Dir.glob("*.h") do |file|
        #    cp file, include
        #end
        
        bin.mkpath
        cp "Standalone/glslangValidator", bin
        cp "Standalone/spirv-remap", bin
    end
    
    def test
    
    end
end