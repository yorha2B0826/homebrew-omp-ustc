class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64",
          using: :nounzip
      sha256 "7d3d6495162512618f0cdf18de14e94c3742ad36f2f88698f0f88fc9d2dbf29c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-linux-arm64",
          using: :nounzip
      sha256 "ce3c54eed28eba8bb96d311099a3167c9642a35e5cad54566ebcedc4235a19db"
    end
    on_intel do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-linux-x64",
          using: :nounzip
      sha256 "1ae89f701ea85fb527c3c570d2e87eb565f6849d75ae5b1a40a9409cdfdbb492"
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