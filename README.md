# homebrew-omp-ustc Homebrew Tap

Homebrew tap (`yorha2b0826/omp-ustc`) for
[yorha2B0826/oh-my-pi](https://github.com/yorha2B0826/oh-my-pi), a personal fork
of [can1357/oh-my-pi](https://github.com/can1357/oh-my-pi).

## Install

```bash
brew tap yorha2b0826/omp-ustc
brew install omp
```

## Updating the formula

This tap repackages the per-platform bare binaries published in the fork's GitHub
releases. `Formula/omp.rb` currently ships three platforms (darwin-arm64,
linux-arm64, linux-x64); macOS Intel is omitted because the fork does not publish
an `omp-darwin-x64` asset (GitHub retired the `macos-13` Intel runner).

To regenerate the formula from a release tag, use the fork's generator
(`scripts/ci-update-brew-formula.ts`):

```bash
OMP_REPO=yorha2B0826/oh-my-pi \
  bun scripts/ci-update-brew-formula.ts v<version> --out Formula/omp.rb
```

> Note: that generator expects all four upstream targets and would fail on the
> missing `omp-darwin-x64`; for the fork, fill the sha256 digests manually from
> the release metadata (`gh release view v<version> --repo yorha2B0826/oh-my-pi
> --json assets`).