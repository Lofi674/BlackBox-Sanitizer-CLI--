# 🔒 BlackBox Sanitizer

**Professional-grade file sanitization tool for secure data deletion.**

[![Go Version](https://img.shields.io/badge/Go-1.21+-00ADD8?logo=go)](https://go.dev/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Tests](https://img.shields.io/badge/tests-passing-brightgreen)]()

---

## 📋 Overview

BlackBox Sanitizer is a CLI tool that securely deletes files by overwriting them multiple times using industry-standard algorithms, making data recovery impossible.

### ✨ Features

- 🛡️ **4 Sanitization Methods**:
  - **DoD 5220.22-M** (7 passes) — US Department of Defense standard
  - **Gutmann** (35 passes) — Maximum security
  - **Random** (3 passes) — Fast & secure
  - **Zero** (1 pass) — Quick wipe

- ⚡ **High Performance**:
  - Concurrent processing (goroutines)
  - Buffered I/O for speed
  - Progress bar

- 🔍 **Verification**: Optional post-sanitization check
- 📁 **Recursive**: Process entire directories
- 🖥️ **Cross-Platform**: Linux, macOS, Windows

---

## 🚀 Installation

### From Source

```bash
git clone https://github.com/yourusername/blackbox-sanitizer.git
cd blackbox-sanitizer
make build
sudo mv bin/blackbox /usr/local/bin/