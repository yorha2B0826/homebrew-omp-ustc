class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64",
          using: :nounzip
      sha256 "449eca0f429265d91420860b0cf218d0de62efd31b4e6f4bace6f836bb526049"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-linux-arm64",
          using: :nounzip
      sha256 "17c0ce4666641b819e83a4df28c2687cf17076c6c558ce451d7552621c4d43f3"
    end
    on_intel do
      url "https://github.com/yorha2B0826/oh-my-pi/releases/download/v#{version}/omp-linux-x64",
          using: :nounzip
      sha256 "0cfb9fdb243d77501684aaf4ab8422729a76d1d051b93267b52087f7b5ef6ab5"
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