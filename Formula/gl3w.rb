class Gl3w < Formula
    head "https://github.com/shakesoda/gl3w.git"
    
    depends_on "scons" => :build
    
    def install
        system "scons"
        
        bin.install Dir["bin/*"]
        lib.install Dir["lib/*"]
        include.install Dir["include/*"]
    end
end