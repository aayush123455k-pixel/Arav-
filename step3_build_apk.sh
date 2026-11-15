#!/data/data/com.termux/files/usr/bin/bash
set -e
echo "=== [ARAV AI] STEP 3: Building Arav-AI.apk ==="
mkdir -p build/gen build/obj build/apk

ANDROID_JAR="$PREFIX/share/aapt/android.jar"
if [ ! -f "$ANDROID_JAR" ]; then
  echo "Locating android.jar..."
  ANDROID_JAR=$(find "$PREFIX" -name "android.jar" | head -n 1)
fi

echo "[1/4] Packaging resources with aapt..."
aapt package -f -m \
  -J build/gen \
  -M app/src/main/AndroidManifest.xml \
  -S app/src/main/res \
  -A app/src/main/assets \
  -I "$ANDROID_JAR" \
  -F build/Arav-AI-unaligned.apk

echo "[2/4] Compiling Java sources..."
javac -source 1.8 -target 1.8 \
  -bootclasspath "$ANDROID_JAR" \
  -classpath "$ANDROID_JAR" \
  -d build/obj \
  build/gen/com/arav/jarvis/R.java \
  app/src/main/java/com/arav/jarvis/AravAccessibilityService.java \
  app/src/main/java/com/arav/jarvis/MainActivity.java

echo "[3/4] Converting bytecode to classes.dex..."
dx --dex --output=classes.dex build/obj
aapt add build/Arav-AI-unaligned.apk classes.dex

echo "[4/4] Signing APK & copying to Download folder..."
if [ ! -f build/debug.keystore ]; then
  keytool -genkey -v -keystore build/debug.keystore \
    -storepass android -alias androiddebugkey -keypass android \
    -keyalg RSA -keysize 2048 -validity 10000 \
    -dname "CN=Arav AI,O=Android,C=IN"
fi

apksigner sign --ks build/debug.keystore --ks-pass pass:android \
  --out /sdcard/Download/Arav-AI.apk build/Arav-AI-unaligned.apk

echo "✅ SUCCESS! Arav-AI.apk has been saved to your phone's Download folder (/sdcard/Download/Arav-AI.apk)!"
