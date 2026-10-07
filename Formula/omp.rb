class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64",
          using: :nounzip
      sha256 "76b731051efef486cdf411780eb5f38a9df939a61f158943d3c7cb1208aa46e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-linux-arm64",
          using: :nounzip
      sha256 "9799dc77dd6f8e3492c315cc8ad1cb4a7a79923ac782c32ab09e4b1b9deab336"
    end
    on_intel do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-linux-x64",
          using: :nounzip
      sha256 "7871faab78b014888e61678caecf99fc6c55283b28f92858bf7105a9b0c240c7"
    end
  end

  def install
    bin.install Dir["omp-*"].first => "omp"
    (bin/"omp").chmod 0555
    with_env(HOME: buildpath) do
      generate_completions_from_executable(bin/"omp", "completions", shells: [:bash, :zsh, :fish])
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omp --version")
  end
end