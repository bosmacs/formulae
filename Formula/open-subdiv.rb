class OpenSubdiv < Formula
    url "https://github.com/PixarAnimationStudios/OpenSubdiv/archive/v3_0_5.tar.gz"
    head "https://github.com/PixarAnimationStudios/OpenSubdiv.git"
    sha256 "60bb7d709adfd949ff865864b68ff3b7e97a682a1841ccc70cd60a6c5a28ff30"
    
    depends_on "cmake" => :build
    depends_on "glfw3"
    depends_on "tbb" => :optional
    
    def install
        # cmake -D NO_MAYA=1 -D NO_PTEX=1 -D NO_DOC=1 \
        #  -D NO_OMP=1 -D NO_TBB=1 -D NO_CUDA=1 -D NO_OPENCL=1 -D NO_CLEW=1 \
        #  -D GLFW_LOCATION="*YOUR GLFW INSTALL LOCATION*" \
        cmake_args = std_cmake_args
        #cmake_args << "-DNO_TUTORIALS=1"  
        #cmake_args << "-DNO_REGRESSION=1"       
        cmake_args << "-DNO_MAYA=1"      
        
        if build.with? "tbb"
            cmake_args << "-DNO_TBB=0"
        else
            cmake_args << "-DNO_TBB=1"
        end
        system "cmake", *cmake_args
        system "make"
        system "make", "install"
    end
    
    def test
    
    end
end