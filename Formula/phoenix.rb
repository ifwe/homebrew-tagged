require 'formula'

class Phoenix < Formula
  homepage 'http://phoenix.incubator.apache.org/'
  url 'http://apache.osuosl.org/incubator/phoenix/phoenix-4.0.0-incubating/bin/phoenix-4.0.0-incubating.tar.gz'
  sha1 'b4fda5c30a8d132e33f16e1a1d8d913709f845ed'

  def install
    libexec.install %w[bin common examples hadoop-1 hadoop-2]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    To install phoenix on an hbase cluster:

      * Add the phoenix-core-[version]-incubating.jar to the classpath of every HBase region server.
        An easy way to do this is to copy it into the HBase lib directory.
      * Restart all region servers.

    For more details:
      http://phoenix.incubator.apache.org/download.html
    EOS
  end
end
