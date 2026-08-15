# omp-ustc Homebrew Tap

Homebrew tap for [yorha2B0826/oh-my-pi](https://github.com/yorha2B0826/oh-my-pi),
a personal fork of [can1357/oh-my-pi](https://github.com/can1357/oh-my-pi).

## Install

```bash
brew tap yorha2b0826/omp-ustc
brew install omp
```

## Updating the formula

This tap repackages the per-platform bare binaries published in the fork's GitHub
releases. The upstream project ships a generator
(`scripts/ci-update-brew-formula.ts`); run it with the fork pointed at
`yorha2B0826/oh-my-pi` to regenerate `Formula/omp.rb` from a release tag:

```bash
OMP_REPO=yorha2B0826/oh-my-pi \
  bun scripts/ci-update-brew-formula.ts v<version> --out Formula/omp.rb
```

> Note: the checked-in formula uses `REPLACE_WITH_SHA256` placeholders until the
> first release is published from the fork. Publish a release, then regenerate
> with the script above (or fill in the four sha256 digests manually).