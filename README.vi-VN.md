<p align="center">
    <img src="https://github.com/user-attachments/assets/efd0470a-f5cb-4c1d-a0c3-3f5c39113933" style="align-self: center"/>
</p>


# 📚 Hitomi Downloader

Công cụ tải xuống đa luồng với giao diện đồ họa cho hitomi hitomi.la

[English](./README.md) / [简体中文](./README.zh-CN.md) / Tiếng Việt

## 📥 Tải về

Các gói đã biên dịch sẵn có sẵn trên [trang Releases](https://github.com/lanyeeee/hitomi-downloader/releases). Chỉ cần tải xuống và sử dụng.

**Thích dự án này? Hãy ủng hộ bằng GitHub Star⭐! Sự ủng hộ của bạn thúc đẩy tôi tiếp tục cập nhật và duy trì🙏**

## ✨ Tính năng

| Tính năng                      | Mô tả                                                        |
| ------------------------------ | ------------------------------------------------------------ |
| 🖼️ Giao diện đồ họa            | Được xây dựng bằng [Tauri](https://v2.tauri.app/start/), nhẹ, gọn gàng và dễ sử dụng. |
| ⚡ Tải xuống đa luồng          | Tối đa hóa tốc độ tải xuống.                                |
| 📂 Xuất                        | Xuất sang định dạng PDF hoặc CBZ phổ biến chỉ với một cú nhấp chuột. |
| 🌐 Quốc tế hóa                 | Hệ thống hỗ trợ đa ngôn ngữ tích hợp (i18n).                |
| 🗂️ Cấu trúc thư mục tùy chỉnh | Cấu trúc thư mục và quy tắc đặt tên có thể tùy chỉnh cao, hỗ trợ các trường như loại, tác giả, ngôn ngữ, v.v. Tạm biệt sự phiền toái của việc sắp xếp thủ công. |

## 🖥️ Giao diện

![image](https://github.com/user-attachments/assets/fd93fd2f-db16-43b6-86cf-aa643eb572c8)
![image](https://github.com/user-attachments/assets/81a859f2-2a06-4eca-b45f-4f6555cc62c0)


## 📖 Cách sử dụng

1.  Trong tab `Tìm kiếm`, tìm kiếm theo từ khóa.
2.  Nhấp nút `Tải về` trực tiếp trên thẻ truyện, hoặc nhấp vào bìa/tiêu đề để chuyển đến tab `Truyện`, nơi bạn cũng sẽ tìm thấy nút `Tải về`.
3.  Sau khi tải xuống, nhấp nút `Mở thư mục` để xem kết quả.

**Nhân tiện, bạn có thể xuất sang PDF/CBZ(ZIP) trong tab `Đã tải`.**

📹 Video dưới đây minh họa toàn bộ quy trình sử dụng. **Nội dung an toàn, bạn có thể xem thoải mái.**

https://github.com/user-attachments/assets/d2d0e577-c074-41ca-996f-445d52e2cce5



## ⚠️ Về cảnh báo giả của phần mềm diệt virus

Đối với các dự án phát triển cá nhân, vấn đề này gần như không thể tránh khỏi (~~vì nó yêu cầu mua chứng chỉ số để ký phần mềm, hoặc thậm chí trả tiền bảo vệ cho các công ty diệt virus~~).
Các giải pháp duy nhất tôi có thể nghĩ ra là:

1.  Tự biên dịch theo hướng dẫn **Cách xây dựng** bên dưới.
2.  Tin tưởng lời hứa của tôi rằng mọi thứ bạn tải xuống từ [trang Release](https://github.com/lanyeeee/hitomi-downloader/releases) đều an toàn.

## 🛠️ Cách xây dựng

Xây dựng rất đơn giản, chỉ cần 3 lệnh.
~~Điều kiện tiên quyết là bạn đã cài đặt Rust, Node và pnpm.~~

#### 📋 Yêu cầu

-   [Rust](https://www.rust-lang.org/tools/install)
-   [Node](https://nodejs.org/en)
-   [pnpm](https://pnpm.io/installation)

#### 📝 Các bước

#### 1. Clone repository này

```
git clone https://github.com/lanyeeee/hitomi-downloader.git
```

#### 2. Cài đặt các dependencies

```
cd hitomi-downloader
pnpm install
```

#### 3. Xây dựng

```
pnpm tauri build
```

## 🐧 Build và Cài đặt trên Linux/Ubuntu

Ứng dụng này được tối ưu hóa cho **Ubuntu 24.04 LTS** với các cải tiến hiệu suất cụ thể:

- **Đồng thời Thích ứng**: Tự động mở rộng theo số lõi CPU
- **HTTP Connection Pooling**: Tối ưu cho tải xuống thông lượng cao
- **Hiệu quả Bộ nhớ**: Quản lý tài nguyên thông minh
- **Bảo mật Được tăng cường**: An toàn bộ nhớ Rust + môi trường sandbox
- **Build & Dọn dẹp Tự động**: Script build chỉ giữ lại app, xóa các file build (~13-15GB được tiết kiệm)

### Build nhanh trên Ubuntu

```bash
./build-ubuntu.sh
```

### 📦 Hỗ trợ Flatpak

Flatpak hiện có sẵn để cài đặt dễ dàng trên bất kỳ bản phân phối Linux nào:

```bash
# Build Flatpak
./build-flatpak.sh build

# Build và cài đặt
./build-flatpak.sh install

# Chạy ứng dụng
flatpak run com.thinhENK.hitomi-downloader
```

Để xem hướng dẫn chi tiết bao gồm cài đặt và gỡ bỏ:
- **[Hướng dẫn Build & Cài đặt Ubuntu](./docs/guides/UBUNTU_BUILD_GUIDE.md)** (Tiếng Việt + English)
- **[Hướng dẫn Build & Cài đặt Flatpak](./docs/guides/FLATPAK_GUIDE.md)** (Tiếng Việt + English)
- [Hướng dẫn Tối ưu Linux](./docs/optimization/LINUX_OPTIMIZATION.vi-VN.md) (Tiếng Việt)
- [Linux Optimization Guide](./docs/optimization/LINUX_OPTIMIZATION.md) (English)

## 📚 Tài liệu

Để xem hướng dẫn đầy đủ, mẹo tối ưu hóa và tài liệu kỹ thuật, hãy xem thư mục **[docs/](./docs/)**:
- **[Hướng dẫn Cài đặt & Thiết lập](./docs/guides/)** - Docker, Ubuntu build, dọn dẹp
- **[Tối ưu hóa Hiệu suất](./docs/optimization/)** - Tối ưu Linux, xuất PDF
- **[Tổng kết Kỹ thuật](./docs/summary/)** - Chi tiết triển khai và phân tích

## 🌐 Thêm ngôn ngữ mới

Chào mừng sự giúp đỡ trong việc dịch dự án này! Nếu bạn muốn thêm ngôn ngữ mới, vui lòng tham khảo việc triển khai trong [PR #1](https://github.com/lanyeeee/hitomi-downloader/pull/1). PR này cho thấy cách thêm các tệp bản địa hóa cho `en-us`.

Các bước chính để thêm ngôn ngữ mới:

1.  Tạo tệp ngôn ngữ mới trong thư mục `src/locales`.
2.  Dịch các cặp key-value, tuân theo định dạng của các tệp ngôn ngữ hiện có.
3.  Đăng ký ngôn ngữ mới trong `src/locales/index.ts`.
4.  Gửi một PR.

## 🤝 Gửi PR

**Vui lòng gửi Pull Request đến nhánh `develop`.**

**Nếu bạn muốn thêm tính năng mới, vui lòng mở `issue` hoặc `discussion` trước để thảo luận về nó. Điều này giúp tránh lãng phí công sức.**

Đối với các trường hợp khác, hãy gửi PR trực tiếp, ví dụ:

1.  🔧 Cải thiện các tính năng hiện có.
2.  🐛 Sửa lỗi.
3.  🌐 Thêm hỗ trợ ngôn ngữ mới.
4.  ⚡ Sử dụng thư viện nhẹ hơn để triển khai các tính năng hiện có.
5.  📝 Sửa đổi tài liệu.
6.  ⬆️  Pull Request để nâng cấp/cập nhật dependencies cũng sẽ được chấp nhận.

## 🔒 Bảo mật

Vui lòng xem [SECURITY.md](./SECURITY.md) để biết thông tin về các chính sách bảo mật và cách báo cáo lỗ hổng bảo mật.

## ⚠️ Tuyên bố từ chối trách nhiệm

-   Công cụ này chỉ dành cho mục đích học tập, nghiên cứu và giao tiếp. Người dùng phải tự chịu mọi rủi ro liên quan đến việc sử dụng nó.
-   Tác giả không chịu trách nhiệm về bất kỳ tổn thất, tranh chấp pháp lý hoặc hậu quả nào khác phát sinh từ việc sử dụng công cụ này.
-   Tác giả không chịu trách nhiệm về hành động của người dùng khi sử dụng công cụ này, bao gồm nhưng không giới hạn ở các hành động vi phạm pháp luật hoặc quyền của bất kỳ bên thứ ba nào.

## Cảm ơn

[Pupil](https://github.com/tom5079/Pupil)

## 💬 Khác

Bất kỳ vấn đề nào gặp phải trong quá trình sử dụng hoặc bất kỳ tính năng nào bạn muốn thêm, hãy mở một `issue` hoặc `discussion`. Tôi sẽ cố gắng hết sức để giải quyết chúng.
