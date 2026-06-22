# 🎯 Lizzieyzy Go AI Portable Bundle

An out-of-the-box Go AI analysis tool powered by the KataGo engine, featuring an intuitive graphical interface for effortless AI-assisted Go analysis.

---

## ✨ Core Features

- **Dual Engine Configuration**: Built-in KataGo **18b** and **28b** weight models — switch between them with a single click in the software to balance speed and strength.
- **One-Click Performance Tuning** (v1.1 Feature): Double-click `Run_First_Time_Tuning.bat` in the root directory to automatically tune both models for optimal performance. No manual intervention required — truly zero门槛 for all users.
- **Fully Portable**: Comes bundled with a Java runtime (OpenJDK 17). No additional software installation required — **extract and play**.
- **Ready to Use**: All paths are pre-configured as relative paths. Move the folder anywhere without breaking anything.
- **Cross-Vendor GPU Support**: Based on the OpenCL universal backend, supporting **NVIDIA, AMD, Intel**, and other mainstream GPUs.
- **Remarkable Playing Strength**: On an 8-year-old dedicated GPU or a 3-year-old integrated GPU, with just 3 seconds per move, it can comfortably defeat professional 9-dan players.

---

## 🆕 v1.1 New Feature: One-Click Performance Tuning

To let KataGo achieve peak performance on any GPU, v1.1 introduces a **one-click tuning script** that leverages KataGo's built-in benchmark command and automatically applies the recommended settings.

This is especially beneficial for high-performance discrete GPUs. (Testing shows the RTX 5080 achieves nearly **double** the analysis speed after tuning.)

### Why Tuning Matters?

KataGo's `numSearchThreads` directly impacts analysis speed. Too few threads leave GPU performance on the table; too many create scheduling overhead that slows things down. The optimal value varies by GPU:

- RTX 5080 → **40** threads recommended
- RTX 3060 → **16** threads recommended
- Intel Xe integrated → **4–6** threads recommended

### How to Use

> ⭐ **Beginner-friendly** (recommended): Double-click **`Run_First_Time_Tuning.bat`** in the project root. The script will automatically run benchmarks for both 18B and 28B models sequentially. No action needed — wait about 2–6 minutes and it's done.

1. Double-click `Run_First_Time_Tuning.bat` in the root directory
2. The script runs benchmarks for **both** models automatically
3. Wait for completion (~2–6 minutes), no manual steps required
4. Recommended thread counts are written to `default_gtp.cfg`; original configs are backed up as `.bak`

**Or tune a single model individually (advanced users):**

1. Navigate to the `engine_18b\` or `engine_28b\` folder
2. Double-click `run_benchmark_18b.bat` (or `run_benchmark_28b.bat`)
3. Wait for the benchmark to complete (~1–3 minutes)
4. The script automatically extracts the recommended value and updates `default_gtp.cfg`

> 💡 **Tip**: After upgrading your GPU or moving to a different computer (e.g., running from a USB drive), re-run the tuning script for optimal performance.
> ⚠️ **Note**: Do not launch Lizzieyzy while the tuning script is running, or the script may fail.

---

## 🎯 Who Is This For?

- Go enthusiasts who want AI analysis of their games
- Go teachers who need classroom demos and instruction
- Users who want AI-powered Go without technical configuration
- Anyone who needs a portable Go AI to carry on a USB drive

---

## 🚀 Getting Started

### First-Time Use

1. Extract the archive to any location (**avoid paths with Chinese characters or spaces**, e.g., `D:\Lizzieyzy`)
2. Double-click `Lizzieyzy-2.5.3-win64.exe` to launch — no installation needed. Optionally, double-click **`Create_Desktop_Shortcut.bat`** in the root directory to add a desktop shortcut for convenient future access. (Note: some antivirus software may flag this script as a false positive because it uses PowerShell to create a shortcut; it is completely safe.)
3. Use the dropdown menu at the top to switch between **18b** and **28b** engines
4. Start playing or drag-and-drop `.sgf` files for analysis
5. ⭐ **(Highly recommended)** Run `Run_First_Time_Tuning.bat` in the root directory for one-click performance optimization

For detailed usage instructions, see: [Lizzieyzy README](https://github.com/yzyray/lizzieyzy/blob/main/README.md)

---

## ⚠️ First Launch Notes

> **On first launch, the software will automatically perform OpenCL tuning (~3–5 minutes). This is normal — please be patient and do not force-close the program. (Press "E" within the program to open the command window and view progress.)**

- **AMD GPU users**: If you encounter the error `Got nonfinite for policy sum`, add the following line to each configuration file:
  - `engine_18b\default_gtp.cfg`
  - `engine_28b\default_gtp.cfg`

  Add this line at the end:
  ```text
  openclUseFP16 = false
  ```

  Save and restart the software.

- **NVIDIA / Intel GPUs**: Typically no additional configuration is needed.

---

## 💻 Hardware Compatibility & Performance

### 📊 Performance Overview

On the integrated GPU of a 2022 Windows thin-and-light tablet (Intel Iris Xe on i7-1160G7), KataGo 18b achieves **50+ visits/s**. In practice, with just **150 visits per move** it can defeat the Star Elf "Star Tiger" AI in the mid-game, and it has achieved an **almost undefeated record** on the Fox Go server, reaching **Fox 9d** (70 games played, only 2 losses due to network disconnection).

For users with higher-end discrete GPUs, both per-move strength and analysis flexibility (rapid review, multi-branch variation trees, precise score estimation) are significantly enhanced — substantially exceeding the capabilities of commercial closed-source alternatives.

---

### Tested Hardware

| Brand | Tested Models |
| :--- | :--- |
| **NVIDIA** | RTX 50 series, GTX 10 series, GTX 1660 Super (Turing) |
| **AMD** | RX 6000 series |
| **Intel** | Xe integrated graphics (Tiger Lake / Alder Lake, etc.) |

No compatibility issues have been reported for RTX 20, 30, or 40 series GPUs. If you encounter issues, refer to the [KataGo Performance Tuning Guide](https://github.com/lightvector/KataGo#tuning-for-performance) (e.g., for AMD Radeon RX 5700), or [file an issue on GitHub](https://github.com/Coderchen-001/AI_GO/issues).

Detailed performance data (visits/s, recommended thread counts, etc.) can be found in **[docs/PERFORMANCE.md](docs/PERFORMANCE.md)**.

> If your GPU is not listed, it is very likely to work as long as it supports OpenCL 1.2 or higher — which covers virtually all mainstream GPUs manufactured since 2012. Run the one-click tuning script to automatically find the optimal configuration.

---

## ❓ Troubleshooting

If double-clicking `Run_First_Time_Tuning.bat` or `run_benchmark_*.bat` produces no response or an error:

1. **Right-click the `.bat` file and select "Run as administrator"** — this resolves most permission-related issues.
2. **Ensure the extraction path contains no Chinese characters or spaces** (e.g., `D:\Lizzieyzy` or `C:\GoTools`).
3. **If you see `CL_PLATFORM_NOT_FOUND_KHR`**: This means no OpenCL platform was found. Update your GPU drivers to ensure OpenCL 1.2 or higher is supported.
4. **If the problem persists**, visit [GitHub Discussions](https://github.com/Coderchen-001/AI_GO/discussions) with the **full error screenshot** from the script.

---

## 📦 File Structure

```text
Lizzieyzy-KataGo-Portable_v1.1/
├── Create_Desktop_Shortcut.bat    # Desktop shortcut creator (double-click to run)
├── Run_First_Time_Tuning.bat      # One-click tuning launcher (v1.1, recommended)
├── engine_18b/                    # KataGo 18b engine
│   ├── katago.exe                 # KataGo OpenCL executable
│   ├── default_gtp.cfg            # Engine configuration
│   ├── update_threads_18b.ps1     # Tuning script (v1.1)
│   └── run_benchmark_18b.bat      # Benchmark launcher for 18b (v1.1)
├── engine_28b/                    # KataGo 28b engine
│   ├── katago.exe
│   ├── default_gtp.cfg
│   ├── update_threads_28b.ps1     # Tuning script (v1.1)
│   └── run_benchmark_28b.bat      # Benchmark launcher for 28b (v1.1)
├── jre/                           # Bundled OpenJDK 17 runtime
├── config.txt                     # Lizzie engine configuration (relative paths)
├── Quick_Start_Guide.txt          # Quick start user guide
├── README.md                      # This file
├── CHANGELOG.md                   # Version changelog
├── LICENSE.txt                    # License information
├── docs/
│   ├── PERFORMANCE.md             # Performance benchmark reference (v1.1)
│   ├── GPU_Support_List.txt       # Tested GPU compatibility list
│   ├── Keyboard_Shortcuts.txt     # Complete keyboard shortcuts reference
│   ├── Quick_Start_Guide.txt      # Detailed user guide
│   ├── Update_Lizzieyzy.txt       # Lizzieyzy update log
│   ├── instructions_en.pdf        # English instructions
│   └── main-interface.png         # Main interface screenshot
└── Lizzieyzy-2.5.3-win64.exe     # Go AI main program
```

## 🙏 Acknowledgments

This bundle would not exist without the following outstanding open-source projects. Our heartfelt thanks to all authors and maintainers:

| Project | Author / Organization | License | Contribution |
| :--- | :--- | :--- | :--- |
| **Lizzieyzy** | yzyray | GPL v3 | Elegant GUI with rich feature integration |
| **KataGo** | lightvector | MIT License | World-class open-source Go AI engine |
| **OpenJDK** | Oracle / OpenJDK Community | GPL v2 + CE | Cross-platform Java runtime |
| **JOGL** | JogAmp Community | New BSD 2-Clause | Java OpenGL bindings for graphics rendering |
| **GlueGen** | JogAmp Community | New BSD 2-Clause | Java-to-native code binding tool |

## 💝 Special Thanks

- The **KataGo training team** for continuously delivering high-quality neural network weights.
- All **Lizzieyzy and KataGo users and contributors** for your feedback and participation.
- The **open-source community** for selfless dedication that makes technology accessible to everyone.

## 📌 License Notice

This bundle is a redistribution of the above open-source components without modification. Each component is governed by its original license. See the respective LICENSE files in each component's directory.

- **Lizzieyzy**: GNU General Public License v3.0 → `/LICENSE.txt`
- **KataGo**: MIT License → `/engine_18b/LICENSE` and `/engine_28b/LICENSE`
- **OpenJDK**: GPL v2 with Classpath Exception → `/jre/java17/LICENSE`

This bundle is provided for learning and communication purposes only. Commercial use is not permitted.

## 📞 Getting Help

- **Lizzieyzy Official Repository**: [https://github.com/yzyray/lizzieyzy](https://github.com/yzyray/lizzieyzy)
- **KataGo Official Repository**: [https://github.com/lightvector/KataGo](https://github.com/lightvector/KataGo)
- **Discussion Forum**: [AI GO Discussions](https://github.com/Coderchen-001/AI_GO/discussions)

**Version Info**: KataGo v1.16.4 | Lizzieyzy v2.5.3 | OpenJDK 17

Happy Go playing! 🎋
