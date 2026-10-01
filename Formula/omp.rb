class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.4.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64",
          using: :nounzip
      sha256 "de92e7b98238c10627010f5ad6dd762382f78e49fe22a08d2c879745992aa7f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-linux-arm64",
          using: :nounzip
      sha256 "c6c5058e95b6daca6134732ab299420bb5a40d0eba482ceb0cac845e69c040cd"
    end
    on_intel do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-linux-x64",
          using: :nounzip
      sha256 "5de8eda2e2455c64845d796262aee2af6e12164ad4685c36a8fdbdfe3a19c0b7"
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