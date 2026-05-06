class Shadom < Formula
  desc "Agent-first browser automation CLI"
  homepage "https://github.com/dred0n/shadom"
  url "https://github.com/dred0n/shadom.git",
      tag:      "v0.1.0",
      revision: "070bac39a40b668c7f207aa1d3e900256167c3c9"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--path", ".", "--root", prefix
  end

  test do
    assert_match "agent-first browser automation CLI", shell_output("#{bin}/shadom --help")
    assert_path_exists bin/"stealth"
  end
end
