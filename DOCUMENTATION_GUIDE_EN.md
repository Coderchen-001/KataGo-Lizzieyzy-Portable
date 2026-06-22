# Documentation Guide for International Users

Welcome to the Lizzieyzy-KataGo Portable Bundle! This guide helps international users navigate the documentation.

---

## 🌍 Available Documentation

### English Documentation (Recommended for International Users)

| File | Description |
|------|-------------|
| **[README.md](README.md)** | Main project overview, features, and quick start guide |
| **[Quick_Start_Guide.txt](Quick_Start_Guide.txt)** | Detailed user manual covering startup, engine switching, tuning, and troubleshooting |
| **[Create_Desktop_Shortcut.bat](Create_Desktop_Shortcut.bat)** | Double-click to create a desktop shortcut for Lizzieyzy |
| **[Run_First_Time_Tuning.bat](Run_First_Time_Tuning.bat)** | One-click performance tuning script (double-click to run) |
| **[docs/GPU_Support_List.txt](docs/GPU_Support_List.txt)** | List of tested GPUs and compatibility information |
| **[docs/Keyboard_Shortcuts.txt](docs/Keyboard_Shortcuts.txt)** | Complete keyboard shortcuts reference |
| **[docs/PERFORMANCE.md](docs/PERFORMANCE.md)** | Performance benchmarks and recommendations |
| **[CHANGELOG.md](CHANGELOG.md)** | Version history and recent changes |
| **[docs/Update_Lizzieyzy.txt](docs/Update_Lizzieyzy.txt)** | Lizzieyzy update log |
| **[docs/instructions_en.pdf](docs/instructions_en.pdf)** | Detailed PDF instructions |

---

## 🚀 Quick Start

### Step 1: Extract and Launch
1. Extract the archive to a path **without Chinese characters or spaces** (e.g., `D:\Lizzieyzy`)
2. Double-click `Lizzieyzy-2.5.3-win64.exe` to launch

### Step 2: Run Performance Tuning (Highly Recommended)
Double-click **`Run_First_Time_Tuning.bat`** to automatically optimize both 18B and 28B models for your GPU.
- Takes approximately 2–6 minutes
- No manual intervention needed
- Creates backup files as `.bak`

### Step 3: Create Desktop Shortcut (Optional)
Double-click **`Create_Desktop_Shortcut.bat`** to add a shortcut on your desktop for easy future access. This step is purely optional — you can always launch the program directly by double-clicking `Lizzieyzy-2.5.3-win64.exe`.

> ⚠️ **Antivirus note**: Some antivirus software may flag this script as a false positive because it uses PowerShell to create a Windows shortcut. This is a known harmless behavior. If blocked, temporarily disable real-time protection or add an exclusion for this file.

### Step 4: Start Playing
- Switch between engines using the dropdown menu at the top
- Drag and drop `.sgf` files to analyze game records
- Press `E` to view command window progress during first launch

---

## ⚠️ Important Notes

### For AMD GPU Users
If you encounter error "Got nonfinite for policy sum":
1. Open `engine_18b\default_gtp.cfg` with Notepad
2. Add this line at the end: `openclUseFP16 = false`
3. Save and restart
4. Repeat for `engine_28b\default_gtp.cfg` if using the 28B model

### Troubleshooting
- **No response when clicking .bat files**: Right-click → "Run as administrator"
- **CL_PLATFORM_NOT_FOUND_KHR error**: Update your GPU drivers
- **"File not found" error**: Do not move or delete files in the `engine_18b\`, `engine_28b\`, or `jre\` folders

---

## 📖 Reading Recommendations

### For Beginners
1. Start with **[README.md](README.md)** — Overview and basic usage
2. Read **[Quick_Start_Guide.txt](Quick_Start_Guide.txt)** — Complete user manual
3. Run **`Run_First_Time_Tuning.bat`** — Optimize performance

### For Advanced Users
1. Check **[docs/GPU_Support_List.txt](docs/GPU_Support_List.txt)** — Verify GPU compatibility
2. Review **[docs/Keyboard_Shortcuts.txt](docs/Keyboard_Shortcuts.txt)** — Learn efficient controls
3. See **[docs/PERFORMANCE.md](docs/PERFORMANCE.md)** — Understand performance metrics
4. Manually tune individual models using scripts in `engine_18b\` and `engine_28b\`

### For Developers/Contributors
1. Review **[CHANGELOG.md](CHANGELOG.md)** — Recent changes
2. Read **[docs/Update_Lizzieyzy.txt](docs/Update_Lizzieyzy.txt)** — Lizzieyzy update history
3. Explore **[docs/instructions_en.pdf](docs/instructions_en.pdf)** for comprehensive reference

---

## 🔗 Useful Links

- **Report Issues**: https://github.com/Coderchen-001/AI_GO/issues
- **Discussions**: https://github.com/Coderchen-001/AI_GO/discussions
- **Lizzieyzy Official**: https://github.com/yzyray/lizzieyzy
- **KataGo Official**: https://github.com/lightvector/KataGo
- **KataGo Training Weights**: https://katagotraining.org/

---

## 💡 Tips

- The software includes its own Java runtime (OpenJDK 17), no installation needed
- All paths use relative references, making it truly portable
- First launch includes automatic OpenCL tuning (3–5 minutes), please wait patiently
- For best performance, always run the tuning script after changing GPUs or updating drivers

---

**Happy Go playing! 🎋**

*Last Updated: June 2026*
