class Usd < Formula

  head "https://github.com/PixarAnimationStudios/USD.git"

  depends_on "cmake" => :build
  depends_on "glew"
  depends_on "tbb"
  depends_on "ptex"
  depends_on "openimageio"
  depends_on "boost"
  depends_on "qt"
  depends_on "open-subdiv"
  depends_on "double-conversion"
  depends_on "pyside"
  
  def install
    # cmake                                       \
    # -G "Xcode"                                  \
    # -DTBB_tbb_LIBRARY=/path/to/libtbb.dylib     \
    # -DOPENEXR_LOCATION=/path/to/openexr         \
    # -DOPENSUBDIV_LOCATION=/path/to/opensubdiv   \
    # -DPTEX_INCLUDE_DIR=/path/to/ptex            \
    # -DOIIO_BASE_DIR=/path/to/openimageio        \
    # -DBOOST_ROOT=/path/to/boost/include         \
    # -DQT_QMAKE_EXECUTABLE=/path/to/qmake        \
    # ..
    cmake_args = std_cmake_args
    cmake_args << "-DOPENSUBDIV_ROOT_DIR=#{HOMEBREW_PREFIX}/Cellar/open-subdiv/3.0.5"
    
    system "cmake", *cmake_args
    system "make"
    system "make", "install"
  end
  
  def test
    
  end
end
