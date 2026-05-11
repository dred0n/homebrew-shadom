class Shadom < Formula
  desc "Agent-first browser automation CLI"
  homepage "https://github.com/dred0n/shadom-releases"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dred0n/shadom-releases/releases/download/v0.1.2/shadom-macos-aarch64.tar.gz"
      sha256 "7868b2dce238d52766e8cb767f6503e7590a6bf23318c24cb9f4ddba76e24a7c"
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
