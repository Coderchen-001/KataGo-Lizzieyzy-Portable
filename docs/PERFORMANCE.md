# KataGo 18B Weight Performance Benchmark Report (Final)

> **Test Environment**
> - KataGo Version: OpenCL edition (18B weight `kata1-b18c384nbt-s9996604416-d4316597426`)
> - Test Parameters: Fixed 800 visits/game, auto-optimizing thread count
> - Test Date: 2026-06-21

---

## 1. Performance Overview (Peak visits/s Ranking)

| Rank | Hardware | Peak Visits/s | Relative Performance (vs RTX 5080) | Recommended Threads | FP16 / Tensor Core Support |
|:----:|----------|------------------------:|------------------------:|:----------:|:-----------------------:|
| 1    | **NVIDIA RTX 5080** | **2069.20** | 100% (Baseline) | 48 | ✅ Tensor Cores, FP16 Storage |
| 2    | **AMD RX 6900 XT**  | **420.65**  | 20.3%      | 12 | ✅ FP16 Compute, No Tensor Core |
| 3    | **NVIDIA GTX 1070 Ti** | **270.30** | 13.1%      | 10 | ❌ No FP16 Support |
| 4    | **NVIDIA GTX 1660 Super** | **195.43** | **9.4%**   | 12 | ✅ FP16 Storage, No Tensor Core |
| 5    | **Intel Iris Xe** (i7-1160G7) | **54.00** | 2.6%       | 5  | ✅ FP16 Compute, No Tensor Core |

> **Note**: Peak visits/s values are the highest `visits/s` measured during auto-tuning for each GPU (average of 10 games). Recommended thread counts are derived by KataGo based on a combined evaluation of visits speed and MCTS efficiency.

---

## 2. Detailed Hardware Performance Data

### 1. NVIDIA GeForce RTX 5080
- **OpenCL Platform**: NVIDIA CUDA (OpenCL 3.0 CUDA 13.1.123)
- **FP16 Configuration**: `FP16Storage=true, FP16Compute=false, FP16TensorCores=true`
- **Auto-Tuning**: Existing tuning cache present (`tune11_gpuNVIDIAGeForceRTX5080...`)
- **Test Duration**: ~11.6s (low threads) to ~4.2s (high threads)
- **Peak Data**: `numSearchThreads=80` → visits/s=2069.20, nnEvals/s=2011.34, avgBatchSize=48.11
- **Recommended Config**: `numSearchThreads=48` (estimated Elo gain +329, similar to 40/64 threads but with better MCTS efficiency)

---

### 2. AMD Radeon RX 6900 XT (gfx1030)
- **OpenCL Platform**: AMD Accelerated Parallel Processing (OpenCL 2.1 AMD-APP 3652.0)
- **FP16 Configuration**: `FP16Storage=true, FP16Compute=true, FP16TensorCores=false`
- **Auto-Tuning**: Existing tuning cache present (`tune11_gpugfx1030...`)
- **Test Duration**: ~27s (low threads) to ~19s (high threads)
- **Peak Data**: `numSearchThreads=16` → visits/s=420.65, nnEvals/s=357.63, avgBatchSize=7.83
- **Recommended Config**: `numSearchThreads=12` (same estimated Elo as 16 threads, but lower thread count reduces MCTS overhead)

---

### 3. NVIDIA GeForce GTX 1070 Ti
- **OpenCL Platform**: NVIDIA CUDA (OpenCL 3.0 CUDA 12.6.65)
- **FP16 Configuration**: `FP16Storage=false, FP16Compute=false, FP16TensorCores=false` (not supported)
- **Auto-Tuning**: Full autotune on first run (~55s), tuning cache generated
- **Test Duration**: ~39s (low threads) to ~30s (high threads)
- **Peak Data**: `numSearchThreads=20` → visits/s=270.30, nnEvals/s=235.68, avgBatchSize=9.81
- **Recommended Config**: `numSearchThreads=10` (estimated Elo gain +48, better than higher thread options)

---

### 4. NVIDIA GeForce GTX 1660 Super
- **OpenCL Platform**: NVIDIA CUDA (OpenCL 1.2 CUDA 11.1.114)
- **FP16 Configuration**: `FP16Storage=true, FP16Compute=false, FP16TensorCores=false` (FP16 storage only)
- **Auto-Tuning**: Full autotune on first run (~3 min), FP16 storage auto-enabled (`Enabling FP16 storage due to better performance`)
- **Test Duration**: ~52s (low threads) to ~42s (high threads)
- **Peak Data**: `numSearchThreads=20` → visits/s=195.43, nnEvals/s=171.14, avgBatchSize=12.25
- **Recommended Config**: `numSearchThreads=12` (estimated Elo gain +42, similar to 10 threads but with better MCTS efficiency)

---

### 5. Intel Iris Xe Graphics (i7-1160G7)
- **OpenCL Platform**: Intel OpenCL HD Graphics (OpenCL 3.0 NEO)
- **FP16 Configuration**: `FP16Storage=true, FP16Compute=true, FP16TensorCores=false`
- **Auto-Tuning**: Existing tuning cache present (`tune11_gpuIntelRIrisRXeGraphics...`)
- **Test Duration**: Very long — ~160s (low threads) to ~150s (high threads), limited by GPU compute power
- **Peak Data**: `numSearchThreads=12` → visits/s=54.00, nnEvals/s=46.08, avgBatchSize=5.97
- **Recommended Config**: `numSearchThreads=5` (estimated Elo gain +149; higher threads degrade MCTS efficiency)

---

## 3. Performance Gaps, Real-World Playing Strength, and Application Recommendations

### Performance Gaps
- **RTX 5080** is approximately **4.9× faster** than **RX 6900 XT**, **7.7×** faster than **GTX 1070 Ti**, **10.6×** faster than **GTX 1660 Super**, and **38×** faster than **Intel Iris Xe**.
- **GTX 1660 Super** benefits from FP16 storage acceleration but lacks Tensor Cores, resulting in ~72% of the GTX 1070 Ti's performance — both cards are in a similar tier.
- The AMD RX 6900 XT supports FP16 compute but lacks Tensor Cores, creating a significant gap versus the RTX 5080.
- Intel integrated graphics are constrained by power limits and memory bandwidth, yet still achieve remarkable real-world playing strength with proper configuration (see below).

---

### Real-World Playing Strength & User Experience

**Test Case (Intel Iris Xe, 50+ visits/s):**
On a 2022 Windows thin-and-light tablet (i7-1160G7) running KataGo 18B weights, **just 150 visits per move** was enough to defeat the Star Elf "Star Tiger" AI in the mid-game. The same setup achieved an **almost undefeated record** on the Fox Go server, reaching **Fox 9d** (70 games played, with only 2 losses due to network disconnection timeout).

This demonstrates:
- **Even modest compute (50 visits/s) with reasonable visits (150/move)** reaches **top human (even super-human)** playing strength, capable of dominating on mainstream Go servers.
- Higher-end discrete GPUs **multiply the visits achievable per unit time**, enabling deeper and broader search and therefore stronger play. Greater compute also provides **more analytical flexibility** (rapid review, multi-branch variation trees, high-precision score estimation, etc.).
- Compared to commercial closed-source Go AIs, KataGo's **open-source customizability** — free adjustment of weights, visits, time controls, and other parameters — gives it a **significantly higher strength ceiling and practical utility**.

---

### Recommended Configurations & Usage Scenarios

| Hardware | Use Case | Recommended Threads | Recommended Visits/Move | Achievable Playing Strength (Reference) |
|------|----------|:----------:|:---------------:|------------------------|
| **RTX 5080** | Top-tier performance: high-intensity AI matches, large-scale review, model training | 48 | 1000~5000+ | Far beyond professional top level, suitable for AI research |
| **RX 6900 XT** | High-performance AMD platform: mid-to-high level analysis | 12 | 500~2000 | Above top human level |
| **GTX 1070 Ti** | Older NVIDIA card: entry-level AI use | 10 | 300~1000 | Professional 9d+, easily reaches Fox 9d |
| **GTX 1660 Super** | Mid-to-low-end NVIDIA card: lightweight analysis, low power consumption | 12 | 200~800 | Same as above |
| **Intel Iris Xe** | Portable, low-power scenarios: mobile use | 5  | **100~300** | **Fox 9d (proven)**, enough to defeat most AIs |

> **Note**: The recommended visits/move above are empirical values. Adjust based on available thinking time. For integrated GPUs, 150 visits is sufficient; more visits further improves strength but increases thinking time.
>
> If you have a decent GPU and want to analyze complex positions, try the stronger KataGo 28b version (slightly slower).

---

### Important Notes

- All tests are based on the OpenCL backend. Using the CUDA version (NVIDIA only) may further improve performance, especially on Tensor Core-equipped RTX series.
- In actual play with **fixed time controls** (e.g., 5s/move), thread count trade-offs differ from those in this report, which is based on fixed 800-visit benchmarks.
- It is recommended to adjust the `numSearchThreads` parameter in `default_gtp.cfg` according to your hardware for the best performance/efficiency balance.
- For weaker hardware (integrated GPUs, etc.), **do not chase high visits**. A reasonable setting (e.g., 100–300) already yields extremely strong play while minimizing wait times.

---

*This report is generated from KataGo automatic benchmark data combined with real-world user testing. All values are from actual runtime logs.*
