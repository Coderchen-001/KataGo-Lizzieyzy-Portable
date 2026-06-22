# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2026-06-21

### Added
- One-click tuning scripts (`update_threads_18b.ps1` / `update_threads_28b.ps1`)
  - Automatically runs `katago benchmark` and extracts the recommended `numSearchThreads`
  - Automatically updates thread count in `default_gtp.cfg`
  - Supports independent tuning for 18B and 28B weight models
- **【Highly Recommended】** Root-level one-click tuning launcher **`Run_First_Time_Tuning.bat`** (zero-effort option)
  - Double-click to automatically tune both 18B and 28B models sequentially
  - No pauses or manual steps — fully automated, reducing the chance of misoperation
  - Makes performance tuning accessible to non-technical users
- New `docs/PERFORMANCE.md` benchmark performance reference table
- New `run_benchmark_18b.bat` / `run_benchmark_28b.bat` standalone tuning launchers

### Changed
- Updated `README.md` with one-click tuning instructions
- Improved cross-environment compatibility and configuration file handling
- Enhanced PowerShell script compatibility with Chinese paths

## [1.0.0] - 2026-06-20

### Added
- Initial release
- Integrated Lizzieyzy + KataGo OpenCL edition
- Includes 18B and 28B weight models
- Windows platform — extract and play
- Extensive hardware compatibility testing (Intel Xe / AMD 6000 / RTX 10-series / 50-series)
