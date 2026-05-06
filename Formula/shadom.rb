class Shadom < Formula
  desc "Agent-first browser automation CLI"
  homepage "https://github.com/dred0n/shadom"
  url "https://github.com/dred0n/shadom.git",
      tag:      "v0.1.1",
      revision: "c55eaba4d411880fe3f421366c5dd4b8771759a9"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--path", ".", "--root", prefix
  end

  def caveats
    <<~EOS
      Quick start for agents:
        shadom doctor

        cat > /tmp/shadom-quickstart.rhai <<'RHAI'
        let j = journey("brew_quickstart");
        j.open_page("alice_desktop", "p");
        j.navigate("p", "https://example.com");
        j.wait_visible("p", "loaded", "body", 5000);
        j.assert_title("p", "title_ok", "Example Domain");
        run_journey(j);
        RHAI

        shadom lint /tmp/shadom-quickstart.rhai
        shadom run /tmp/shadom-quickstart.rhai \
          --report /tmp/shadom-report.json \
          --trace /tmp/shadom-trace \
          --json-diagnostics

      For repair/debugging, inspect the JSON report plus /tmp/shadom-trace/index.html,
      DOM snapshots, screenshots, console logs, and HAR artifacts.
    EOS
  end

  test do
    assert_match "agent-first browser automation CLI", shell_output("#{bin}/shadom --help")
    assert_match "# shadom Agent Skill", shell_output("#{bin}/shadom --skill")
    refute_path_exists bin/"stealth"
  end
end
