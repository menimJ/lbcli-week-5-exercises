#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
SUBMISSION_DIR="$REPO_ROOT/submission"
DATA_DIR=${BITCOIN_DATADIR:-"$REPO_ROOT/.bitcoin"}

actual_sha() {
  printf '%s' "$1" | sha256sum | awk '{print $1}'
}

run_submission() {
  BITCOIN_DATADIR="$DATA_DIR" bash "$SUBMISSION_DIR/$1.sh"
}


assert_hash() {
  local exercise=$1
  local actual=$2
  local expected=$3

  if [[ "$(actual_sha "$actual")" != "$expected" ]]; then
    echo "FAILED: submission/$exercise.sh"
    exit 1
  fi
  echo "PASSED: submission/$exercise.sh"
}

wallet=$(run_submission 01)
if [[ "$wallet" != *"btrustwallet"* ]]; then
  echo "FAILED: submission/01.sh"
  exit 1
fi
echo "PASSED: submission/01.sh"

assert_hash 02 "$(run_submission 02)" "371580cfc5169fedc89930dc449c55414cca3d5b528372ecbc8eadf43fa772fd"
assert_hash 03 "$(run_submission 03)" "7050116588bb8837d0631547915ffc53a6a65f1d348024fc4cbe3c6c2e57136a"
assert_hash 04 "$(run_submission 04)" "9a04df80fbb0cead60b8f836072142763064173bffd3b5d7eabe03b01e184818"
assert_hash 05 "$(run_submission 05)" "1e5b747170d8c17ee1ad8dcaaaf454afbe3d6f2e39a7518bc24866503ca7cbb6"
assert_hash 06 "$(run_submission 06)" "00a751933601c8185d489f70098e23e057edb51eef7038e8a4abc8d9d3e9f280"
assert_hash 07 "$(run_submission 07)" "c3b078c65f4cc6cad019ca080be104bc8d0f106112c7e66d43f575e205cf13d0"
assert_hash 08 "$(run_submission 08)" "5d001aabf113d96cc1222ee02ff96e2a876eea195a9a1dae6cbc08c04f86b2f4"

echo "All submission checks passed."
