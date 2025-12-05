#!/bin/bash
# Flatpak Build Script for Ubuntu - Script xây dựng Flatpak cho Ubuntu
# This script builds and optionally installs the Flatpak package
# Script này build và tùy chọn cài đặt gói Flatpak

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Application info
APP_ID="com.thinhENK.hitomi-downloader"
REPO_NAME="hitomi-downloader-repo"

# Function to print colored messages
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if required tools are installed
check_requirements() {
    print_info "Kiểm tra các công cụ cần thiết / Checking required tools..."
    
    local missing_tools=()
    
    if ! command -v flatpak &> /dev/null; then
        missing_tools+=("flatpak")
    fi
    
    if ! command -v flatpak-builder &> /dev/null; then
        missing_tools+=("flatpak-builder")
    fi
    
    if [ ${#missing_tools[@]} -ne 0 ]; then
        print_error "Thiếu các công cụ sau / Missing required tools: ${missing_tools[*]}"
        print_info "Vui lòng cài đặt / Please install:"
        print_info "  sudo apt-get install flatpak flatpak-builder"
        print_info ""
        print_info "Sau đó thêm Flathub repo / Then add Flathub repo:"
        print_info "  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
        exit 1
    fi
    
    print_success "Tất cả các công cụ đã được cài đặt / All required tools are installed"
}

# Function to install SDK and runtime
install_sdk() {
    print_info "Cài đặt GNOME SDK và runtime / Installing GNOME SDK and runtime..."
    
    # Add Flathub if not exists
    flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
    
    # Install runtime and SDK
    flatpak install --user -y flathub org.gnome.Platform//46 org.gnome.Sdk//46 2>/dev/null || true
    
    # Install SDK extensions
    flatpak install --user -y flathub org.freedesktop.Sdk.Extension.rust-stable//24.08 2>/dev/null || true
    flatpak install --user -y flathub org.freedesktop.Sdk.Extension.node20//24.08 2>/dev/null || true
    
    print_success "SDK và runtime đã được cài đặt / SDK and runtime installed"
}

# Function to build the Flatpak
build_flatpak() {
    print_info "Bắt đầu build Flatpak / Starting Flatpak build..."
    print_info "Quá trình này có thể mất 15-30 phút / This may take 15-30 minutes..."
    
    # Get script directory and project root
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    
    # Create build directories
    BUILD_DIR="$PROJECT_ROOT/flatpak-build"
    REPO_DIR="$PROJECT_ROOT/$REPO_NAME"
    
    # Clean previous builds
    rm -rf "$BUILD_DIR" "$REPO_DIR"
    mkdir -p "$BUILD_DIR"
    
    # Build the Flatpak
    cd "$SCRIPT_DIR"
    flatpak-builder --user --force-clean --install-deps-from=flathub \
        --repo="$REPO_DIR" \
        "$BUILD_DIR" \
        "$APP_ID.yml"
    
    if [ $? -eq 0 ]; then
        print_success "Build Flatpak thành công / Flatpak built successfully"
    else
        print_error "Build thất bại / Build failed"
        exit 1
    fi
}

# Function to create distributable bundle
create_bundle() {
    print_info "Tạo file bundle / Creating bundle file..."
    
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    REPO_DIR="$PROJECT_ROOT/$REPO_NAME"
    OUTPUT_DIR="$PROJECT_ROOT/flatpak-output"
    
    mkdir -p "$OUTPUT_DIR"
    
    # Create a single-file bundle
    flatpak build-bundle "$REPO_DIR" \
        "$OUTPUT_DIR/$APP_ID.flatpak" \
        "$APP_ID"
    
    if [ $? -eq 0 ]; then
        print_success "Bundle đã được tạo / Bundle created: $OUTPUT_DIR/$APP_ID.flatpak"
    else
        print_warning "Không thể tạo bundle / Could not create bundle"
    fi
}

# Function to install the Flatpak
install_flatpak() {
    print_info "Cài đặt Flatpak / Installing Flatpak..."
    
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    REPO_DIR="$PROJECT_ROOT/$REPO_NAME"
    
    # Add local repo
    flatpak --user remote-add --no-gpg-verify --if-not-exists \
        hitomi-local "file://$REPO_DIR"
    
    # Install from local repo
    flatpak --user install -y hitomi-local "$APP_ID"
    
    if [ $? -eq 0 ]; then
        print_success "Cài đặt thành công / Installation successful"
        print_info "Chạy ứng dụng / Run the app: flatpak run $APP_ID"
    else
        print_error "Cài đặt thất bại / Installation failed"
        exit 1
    fi
}

# Function to uninstall the Flatpak
uninstall_flatpak() {
    print_info "Gỡ cài đặt Flatpak / Uninstalling Flatpak..."
    
    flatpak --user uninstall -y "$APP_ID" 2>/dev/null || true
    flatpak --user remote-delete hitomi-local 2>/dev/null || true
    
    print_success "Đã gỡ cài đặt / Uninstalled"
}

# Function to clean up build artifacts
cleanup() {
    print_info "Dọn dẹp các file build / Cleaning up build files..."
    
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    
    rm -rf "$PROJECT_ROOT/flatpak-build"
    rm -rf "$PROJECT_ROOT/$REPO_NAME"
    rm -rf "$PROJECT_ROOT/.flatpak-builder"
    
    print_success "Đã dọn dẹp / Cleaned up"
}

# Function to display help
show_help() {
    echo ""
    echo "Flatpak Build Script for Hitomi Downloader"
    echo ""
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  build       Build the Flatpak package (default)"
    echo "  install     Build and install the Flatpak"
    echo "  uninstall   Uninstall the Flatpak"
    echo "  bundle      Build and create a distributable .flatpak file"
    echo "  clean       Clean up build artifacts"
    echo "  help        Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 build      # Build the Flatpak"
    echo "  $0 install    # Build and install"
    echo "  $0 bundle     # Build and create .flatpak file"
    echo ""
}

# Function to display summary
display_summary() {
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    
    echo ""
    echo "========================================"
    echo "🎉 BUILD HOÀN THÀNH / BUILD COMPLETE 🎉"
    echo "========================================"
    echo ""
    print_info "Hướng dẫn tiếp theo / Next steps:"
    echo ""
    echo "  Để cài đặt / To install:"
    echo "    $0 install"
    echo ""
    echo "  Để tạo file bundle / To create bundle:"
    echo "    $0 bundle"
    echo ""
    echo "  Để chạy (sau khi cài đặt) / To run (after installation):"
    echo "    flatpak run $APP_ID"
    echo ""
    echo "  Để gỡ cài đặt / To uninstall:"
    echo "    $0 uninstall"
    echo ""
}

# Main execution
main() {
    echo "========================================"
    echo "   Flatpak Build Script"
    echo "   Hitomi Downloader"
    echo "========================================"
    echo ""
    
    COMMAND="${1:-build}"
    
    case "$COMMAND" in
        build)
            check_requirements
            install_sdk
            build_flatpak
            display_summary
            ;;
        install)
            check_requirements
            install_sdk
            build_flatpak
            install_flatpak
            ;;
        uninstall)
            uninstall_flatpak
            ;;
        bundle)
            check_requirements
            install_sdk
            build_flatpak
            create_bundle
            display_summary
            ;;
        clean)
            cleanup
            ;;
        help|--help|-h)
            show_help
            ;;
        *)
            print_error "Unknown command: $COMMAND"
            show_help
            exit 1
            ;;
    esac
    
    print_success "Hoàn thành! / Done!"
}

# Run main function
main "$@"
