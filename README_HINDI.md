# 🤖 ARAV AI (Jarvis Android App) — Termux Build Guide

यह प्रोजेक्ट YouTube वीडियो **I Built My Own JARVIS AI Android App Using ChatGPT + Claude AI + Termux** (`http://www.youtube.com/watch?v=oI_mtznQ_zk` — Channel: *STUDIO OF CODING AI*) में बताए गए पूरे प्रोसेस के अनुसार **Arav AI (आरव)** नाम से तैयार किया गया है।

---

## 🚀 अपने फोन में Termux से `Arav-AI.apk` कैसे बनाएं (3 आसान स्टेप्स)

1. इस `arav_jarvis_android_project.zip` फाइल को अपने फोन के **Download** फोल्डर में रखें।
2. अपने फोन में **Termux** ऐप ओपन करें और नीचे दिए गए 3 कमांड्स एक-एक करके पेस्ट करें:

### Step 1: फाइल परमिशन दें
```bash
termux-setup-storage && yes | pkg update -y
```

### Step 2: जरूरी टूल्स डाउनलोड करें (बीच में रुके तो `y` लिखकर Enter दबाएं)
```bash
yes | pkg install -y openjdk-17 aapt aapt2 dx apksigner ecj unzip wget
```

### Step 3: `Arav-AI.apk` बिल्ड करें
```bash
cd ~/storage/downloads && unzip -o arav_jarvis_android_project.zip -d arav_ai_build && cd arav_ai_build && bash step3_build_apk.sh
```

बिल्ड पूरा होते ही आपके फोन के **Download** फोल्डर में **`Arav-AI.apk`** आ जाएगा। उसे टैप करके इंस्टॉल करें, ऊपर **🔑 API Key** में जाकर अपनी फ्री **Gemini API Key** डालें और माइक दबाकर आरव से बात करें!
