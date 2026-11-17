set shell := ["bash", "-euo", "pipefail", "-c"]

# Lists the commands.
default:
    @just --list

# Checks command formatting and the existing workflow safety gate offline.
check:
    just --fmt --check
    actionlint
    zizmor --offline --no-progress .github

# Retains full-source verification and the complete accepted-history secret scan.
verify: check
    betterleaks git --no-banner --redact .
