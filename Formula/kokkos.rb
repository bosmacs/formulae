class Kokkos < Formula

    head "https://github.com/kokkos/kokkos.git"

    def install
        mkdir "build" do
            system "../generate_makefile.bash", "--prefix=#{prefix}"
        system "make", "lib"
        system "make", "install"
        end
    end
    
    def test
    
    end
end