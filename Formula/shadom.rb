class Shadom < Formula
  desc "Agent-first browser automation CLI"
  homepage "https://github.com/dred0n/shadom-releases"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dred0n/shadom-releases/releases/download/v0.1.4/shadom-macos-aarch64-v0.1.4.tar.gz"
      sha256 "9d48c24bd71f65cfb3224fe1674521781067e9604943a07a963760bcdd8b2da6"
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
