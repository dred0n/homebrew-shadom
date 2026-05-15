class Shadom < Formula
  desc "Agent-first browser automation CLI"
  homepage "https://github.com/dred0n/shadom-releases"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dred0n/shadom-releases/releases/download/v0.1.3/shadom-macos-aarch64-v0.1.3.tar.gz"
      sha256 "14c08352dcaadbe8a33c563240b8107ec4037e0199424ffafc27dc620e13e1f6"
    end
  end

  def install
    bin.install "shadom-macos-aarch64" => "shadom"
  end

  test do
    assert_match "Agent-first browser automation CLI", shell_output("#{bin}/shadom --help")
    assert_match "# shadom Agent Skill", shell_output("#{bin}/shadom --skill")
    refute_path_exists bin/"stealth"
  end
end
