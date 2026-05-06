class Shadom < Formula
  desc "Agent-first browser automation CLI"
  homepage "https://github.com/dred0n/shadom-releases"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dred0n/shadom-releases/releases/download/v0.1.1/shadom-macos-aarch64.tar.gz"
      sha256 "32231a1a1f6103eb2f0f0bb4915f78e2d9fb91a06d468363218004c697e8d62a"

      def install
        bin.install "shadom-macos-aarch64" => "shadom"
      end
    end
  end

  test do
    assert_match "agent-first browser automation CLI", shell_output("#{bin}/shadom --help")
    assert_match "# shadom Agent Skill", shell_output("#{bin}/shadom --skill")
    refute_path_exists bin/"stealth"
  end
end
