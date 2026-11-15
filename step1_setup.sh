#!/data/data/com.termux/files/usr/bin/bash
echo "=== [ARAV AI] STEP 1: Setting up Termux Storage ==="
termux-setup-storage
yes | pkg update -y
echo "=== Step 1 Complete! Now run bash step2_packages.sh ==="
