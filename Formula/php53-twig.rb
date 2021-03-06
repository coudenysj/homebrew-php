require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php53Twig < AbstractPhp53Extension
  init
  homepage 'http://twig.sensiolabs.org/'
  url 'https://github.com/fabpot/Twig/tarball/v1.9.2'
  sha1 '5e734f152d09df1f49de70cc27b031887c4408dd'
  head 'https://github.com/fabpot/Twig.git', :using => :git

  def install
    ENV.universal_binary if build.universal?

    Dir.chdir 'ext/twig' do
      safe_phpize
      system "./configure", "--prefix=#{prefix}",
                            phpconfig
      system "make"
      prefix.install %w(modules/twig.so)
    end
    write_config_file unless build.include? "without-config-file"
  end
end
