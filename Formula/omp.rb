class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.4.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64",
          using: :nounzip
      sha256 "e90bf995b25a9a57438c8a90039c46c14d6c7741e3b89df5b2d94af5a0c6053b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-linux-arm64",
          using: :nounzip
      sha256 "8e6d2b7216ff79198ac54780a0456ba432a1e71fddcfdcafd9c6741b53bafd46"
    end
    on_intel do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-linux-x64",
          using: :nounzip
      sha256 "9e13649595cba9e2ac3ca6298a6fbdf704c5eab0e504bd9c61c00925ec5247cd"
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