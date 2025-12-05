# Flatpak Build & Installation Guide
# Hướng dẫn Build và Cài đặt Flatpak

[English](#english) | [Tiếng Việt](#tiếng-việt)

---

## English

### 📋 Overview

Flatpak is a modern packaging format for Linux that provides:
- ✅ Sandboxed applications for better security
- ✅ Works on any Linux distribution
- ✅ Easy installation and updates
- ✅ No dependency conflicts

This guide shows how to build and install Hitomi Downloader as a Flatpak application on Ubuntu and other Linux distributions.

### 🔧 Prerequisites

#### Install Flatpak and Flatpak Builder

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install -y flatpak flatpak-builder
```

**Fedora:**
```bash
sudo dnf install flatpak flatpak-builder
```

**Arch Linux:**
```bash
sudo pacman -S flatpak flatpak-builder
```

#### Add Flathub Repository

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

**Note:** You may need to restart your system after installing Flatpak for the first time.

### 🚀 Quick Start

#### Option 1: Using the Build Script (Recommended)

```bash
# Build the Flatpak
./build-flatpak.sh build

# Build and install
./build-flatpak.sh install

# Build and create distributable bundle
./build-flatpak.sh bundle
```

#### Option 2: Manual Build

```bash
# 1. Install GNOME SDK and runtime
flatpak install flathub org.gnome.Platform//46 org.gnome.Sdk//46
flatpak install flathub org.freedesktop.Sdk.Extension.rust-stable//24.08
flatpak install flathub org.freedesktop.Sdk.Extension.node20//24.08

# 2. Build the Flatpak
cd flatpak
flatpak-builder --user --force-clean --install-deps-from=flathub \
    --repo=../hitomi-downloader-repo \
    ../flatpak-build \
    com.thinhENK.hitomi-downloader.yml

# 3. Install from local repo
flatpak --user remote-add --no-gpg-verify --if-not-exists \
    hitomi-local file://$(pwd)/../hitomi-downloader-repo
flatpak --user install hitomi-local com.thinhENK.hitomi-downloader
```

### 📦 Installation Methods

#### Method 1: From Bundle File (.flatpak)

If you have a `.flatpak` bundle file:

```bash
flatpak --user install ./com.thinhENK.hitomi-downloader.flatpak
```

#### Method 2: From Local Repository

After building:

```bash
flatpak --user remote-add --no-gpg-verify --if-not-exists \
    hitomi-local file://path/to/hitomi-downloader-repo
flatpak --user install hitomi-local com.thinhENK.hitomi-downloader
```

### ▶️ Running the Application

After installation:

```bash
# From terminal
flatpak run com.thinhENK.hitomi-downloader

# Or search for "Hitomi Downloader" in your application menu
```

### 🗑️ Uninstallation

```bash
# Using the script
./build-flatpak.sh uninstall

# Or manually
flatpak --user uninstall com.thinhENK.hitomi-downloader
```

### 🔄 Updates

If installed from a Flatpak repository:

```bash
flatpak --user update com.thinhENK.hitomi-downloader
```

### 🧹 Cleaning Up

Remove build artifacts:

```bash
./build-flatpak.sh clean

# Or manually
rm -rf flatpak-build hitomi-downloader-repo .flatpak-builder
```

### 📊 Disk Space

- **SDK and runtime**: ~1.5 GB (one-time download, shared with other Flatpak apps)
- **Build artifacts**: ~2-3 GB (can be cleaned after build)
- **Installed app**: ~50-100 MB

### 🔍 Troubleshooting

#### Build Fails

1. **Ensure Flathub is added:**
   ```bash
   flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
   ```

2. **Install SDK manually:**
   ```bash
   flatpak install flathub org.gnome.Platform//46 org.gnome.Sdk//46
   ```

3. **Check logs:**
   ```bash
   flatpak-builder --verbose ...
   ```

#### Application Won't Start

1. **Check permissions:**
   ```bash
   flatpak info --show-permissions com.thinhENK.hitomi-downloader
   ```

2. **Run with debug output:**
   ```bash
   flatpak run --verbose com.thinhENK.hitomi-downloader
   ```

3. **Grant additional permissions if needed:**
   ```bash
   flatpak override --user --filesystem=home com.thinhENK.hitomi-downloader
   ```

### 🔒 Permissions

The Flatpak has these permissions:
- **Network**: Required for downloading
- **Downloads folder**: Save downloaded files
- **Documents folder**: Optional file access
- **Display**: X11 and Wayland support
- **GPU**: Hardware acceleration

To modify permissions, use Flatseal or:
```bash
flatpak override --user [permission] com.thinhENK.hitomi-downloader
```

---

## Tiếng Việt

### 📋 Tổng quan

Flatpak là định dạng đóng gói hiện đại cho Linux, cung cấp:
- ✅ Ứng dụng sandbox để bảo mật tốt hơn
- ✅ Hoạt động trên mọi bản phân phối Linux
- ✅ Cài đặt và cập nhật dễ dàng
- ✅ Không xung đột dependency

Hướng dẫn này cho thấy cách build và cài đặt Hitomi Downloader dưới dạng ứng dụng Flatpak trên Ubuntu và các bản phân phối Linux khác.

### 🔧 Yêu cầu

#### Cài đặt Flatpak và Flatpak Builder

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install -y flatpak flatpak-builder
```

**Fedora:**
```bash
sudo dnf install flatpak flatpak-builder
```

**Arch Linux:**
```bash
sudo pacman -S flatpak flatpak-builder
```

#### Thêm Repository Flathub

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

**Lưu ý:** Bạn có thể cần khởi động lại hệ thống sau khi cài Flatpak lần đầu.

### 🚀 Bắt đầu nhanh

#### Phương án 1: Dùng Script Build (Khuyến nghị)

```bash
# Build Flatpak
./build-flatpak.sh build

# Build và cài đặt
./build-flatpak.sh install

# Build và tạo file bundle có thể phân phối
./build-flatpak.sh bundle
```

#### Phương án 2: Build Thủ công

```bash
# 1. Cài đặt GNOME SDK và runtime
flatpak install flathub org.gnome.Platform//46 org.gnome.Sdk//46
flatpak install flathub org.freedesktop.Sdk.Extension.rust-stable//24.08
flatpak install flathub org.freedesktop.Sdk.Extension.node20//24.08

# 2. Build Flatpak
cd flatpak
flatpak-builder --user --force-clean --install-deps-from=flathub \
    --repo=../hitomi-downloader-repo \
    ../flatpak-build \
    com.thinhENK.hitomi-downloader.yml

# 3. Cài đặt từ repo local
flatpak --user remote-add --no-gpg-verify --if-not-exists \
    hitomi-local file://$(pwd)/../hitomi-downloader-repo
flatpak --user install hitomi-local com.thinhENK.hitomi-downloader
```

### 📦 Các phương pháp cài đặt

#### Phương pháp 1: Từ file Bundle (.flatpak)

Nếu bạn có file bundle `.flatpak`:

```bash
flatpak --user install ./com.thinhENK.hitomi-downloader.flatpak
```

#### Phương pháp 2: Từ Repository Local

Sau khi build:

```bash
flatpak --user remote-add --no-gpg-verify --if-not-exists \
    hitomi-local file://đường/dẫn/đến/hitomi-downloader-repo
flatpak --user install hitomi-local com.thinhENK.hitomi-downloader
```

### ▶️ Chạy Ứng dụng

Sau khi cài đặt:

```bash
# Từ terminal
flatpak run com.thinhENK.hitomi-downloader

# Hoặc tìm "Hitomi Downloader" trong menu ứng dụng
```

### 🗑️ Gỡ cài đặt

```bash
# Dùng script
./build-flatpak.sh uninstall

# Hoặc thủ công
flatpak --user uninstall com.thinhENK.hitomi-downloader
```

### 🔄 Cập nhật

Nếu cài từ repository Flatpak:

```bash
flatpak --user update com.thinhENK.hitomi-downloader
```

### 🧹 Dọn dẹp

Xóa các file build:

```bash
./build-flatpak.sh clean

# Hoặc thủ công
rm -rf flatpak-build hitomi-downloader-repo .flatpak-builder
```

### 📊 Dung lượng đĩa

- **SDK và runtime**: ~1.5 GB (tải một lần, dùng chung với các app Flatpak khác)
- **Build artifacts**: ~2-3 GB (có thể xóa sau khi build)
- **Ứng dụng đã cài**: ~50-100 MB

### 🔍 Xử lý Sự cố

#### Build Thất bại

1. **Đảm bảo đã thêm Flathub:**
   ```bash
   flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
   ```

2. **Cài SDK thủ công:**
   ```bash
   flatpak install flathub org.gnome.Platform//46 org.gnome.Sdk//46
   ```

3. **Kiểm tra logs:**
   ```bash
   flatpak-builder --verbose ...
   ```

#### Ứng dụng Không Khởi động

1. **Kiểm tra quyền:**
   ```bash
   flatpak info --show-permissions com.thinhENK.hitomi-downloader
   ```

2. **Chạy với debug output:**
   ```bash
   flatpak run --verbose com.thinhENK.hitomi-downloader
   ```

3. **Cấp thêm quyền nếu cần:**
   ```bash
   flatpak override --user --filesystem=home com.thinhENK.hitomi-downloader
   ```

### 🔒 Quyền

Flatpak có các quyền sau:
- **Network**: Cần cho việc tải xuống
- **Thư mục Downloads**: Lưu các file đã tải
- **Thư mục Documents**: Truy cập file tùy chọn
- **Display**: Hỗ trợ X11 và Wayland
- **GPU**: Tăng tốc phần cứng

Để thay đổi quyền, dùng Flatseal hoặc:
```bash
flatpak override --user [permission] com.thinhENK.hitomi-downloader
```

---

## 📝 Additional Notes / Ghi chú thêm

### Build Time
- First build: 15-30 minutes (includes downloading SDKs)
- Subsequent builds: 5-10 minutes

### Compatibility
- Works on any Linux distribution with Flatpak support
- Tested on Ubuntu 22.04 LTS, Ubuntu 24.04 LTS, Fedora 39+

### Security
- Applications run in a sandbox
- Limited access to system resources
- Network access is required for downloading

### Contributing
See [README.md](../README.md) for contribution guidelines.

### License
See [LICENSE](../LICENSE) for details.
