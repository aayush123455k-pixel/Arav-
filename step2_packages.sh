#!/data/data/com.termux/files/usr/bin/bash
echo "=== [ARAV AI] STEP 2: Installing Android APK Build Tools ==="
yes | pkg install -y openjdk-17 aapt aapt2 dx apksigner ecj unzip wget
echo "=== Step 2 Complete! Now run bash step3_build_apk.sh ==="
