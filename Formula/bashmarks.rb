# Taken from https://github.com/alexandregz/homebrew-MXhomebrew/blob/master/Formula/bashmarks.rb
class Bashmarks < Formula
  homepage "http://www.huyng.com/projects/bashmarks/"
  url "https://github.com/huyng/bashmarks.git"
  sha256 "8b6fc458280fd3a5c1d809910bc64737cb6ae009f1891304ffd3b8ece46bf8b1"
  version "1.0"

  depends_on "zsh" => :optional
  depends_on "bash" => :optional

  def install
    libexec.install "bashmarks.sh"
    chmod 0600, "#{libexec}/bashmarks.sh"
  end

  def caveats
    <<-EOS.undent
      Please add 'source #{libexec}/bashmarks.sh' to your .bashrc file
    EOS
  end

  test do
    output = %x(
      source #{libexec}/bashmarks.sh
      cd #{libexec}
      s libexec_bashmarks
      l
    ).strip
    assert_match /libexec\_bashmarks\s+.*\s+#{libexec}/, output
  end
end