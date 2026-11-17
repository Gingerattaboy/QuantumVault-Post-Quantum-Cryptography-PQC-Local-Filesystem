#!/usr/bin/env bash
# QuantumVault - Week 1, Task 1 (Member 1)
# Installs build tools + liboqs (pinned tag) and verifies ML-KEM-768 / ML-DSA-65.
# Usage: ./setup_liboqs.sh            (uses default tag)
#        LIBOQS_TAG=0.14.0 ./setup_liboqs.sh
set -euo pipefail

LIBOQS_TAG="${LIBOQS_TAG:-0.12.0}"   # ML-KEM/ML-DSA names need >= 0.12.0
WORKDIR="${WORKDIR:-$HOME/quantumvault-deps}"

echo "== 1. Installing build tools =="
sudo apt update
sudo apt install -y build-essential cmake ninja-build libssl-dev git pkg-config

echo "== 2. Fetching liboqs $LIBOQS_TAG =="
mkdir -p "$WORKDIR" && cd "$WORKDIR"
if [ ! -d liboqs ]; then
  git clone --depth 1 --branch "$LIBOQS_TAG" https://github.com/open-quantum-safe/liboqs.git
fi
cd liboqs

echo "== 3. Building and installing =="
cmake -GNinja -B build -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release
ninja -C build
sudo ninja -C build install
sudo ldconfig

echo "== 4. Verifying algorithm availability =="
cat > /tmp/oqs_check.c <<'EOF'
#include <stdio.h>
#include <oqs/oqs.h>
int main(void) {
    OQS_init();
    printf("liboqs version: %s\n", OQS_version());
    const char *kem = "ML-KEM-768", *sig = "ML-DSA-65";
    int k = OQS_KEM_alg_is_enabled(kem), s = OQS_SIG_alg_is_enabled(sig);
    printf("%-12s : %s\n", kem, k ? "ENABLED" : "MISSING");
    printf("%-12s : %s\n", sig, s ? "ENABLED" : "MISSING");
    return (k && s) ? 0 : 1;
}
EOF
gcc /tmp/oqs_check.c -o /tmp/oqs_check -loqs
/tmp/oqs_check | tee "$WORKDIR/liboqs_check.txt"

echo "== Done. Output saved to $WORKDIR/liboqs_check.txt (paste into your notes) =="
