<p align="center">
    <img src="https://github.com/user-attachments/assets/efd0470a-f5cb-4c1d-a0c3-3f5c39113933" style="align-self: center"/>
</p>


# 📚Hitomi下载器

一个带GUI的用于 hitomi hitomi.la 的多线程下载器

[English](./README.md) / 简体中文 / [Tiếng Việt](./README.vi-VN.md)

## 📥 快速下载

[Release页面](https://github.com/lanyeeee/hitomi-downloader/releases)提供了预编译的安装包，直接下载即可使用

**如果本项目对你有帮助，欢迎点个 Star ⭐ 支持！你的支持是我持续更新维护的动力 🙏**

## ✨ 主要特性

| 特性            | 说明                                                         |
| --------------- | ------------------------------------------------------------ |
| 🖼️图形界面       | 基于 [Tauri](https://www.google.com/url?sa=E&q=https%3A%2F%2Fv2.tauri.app%2Fstart%2F) 构建，轻量、简洁、易用 |
| ⚡多线程下载     | 最大化下载速度                                               |
| 📂漫画导出       | 一键将下载内容导出为通用的 PDF 或 CBZ 格式                   |
| 🌐国际化         | 内置多语言支持系统 (i18n)                                    |
| 🗂️自定义目录结构 | 高度可定制的目录结构和命名规则，支持类型、作者、语言等字段，彻底告别手动整理的烦恼 |

## 🖥️图形界面

![image](https://github.com/user-attachments/assets/fd93fd2f-db16-43b6-86cf-aa643eb572c8)
![image](https://github.com/user-attachments/assets/81a859f2-2a06-4eca-b45f-4f6555cc62c0)

## 📖 使用方法

1. 使用`漫画搜索`搜索关键词
2. 直接点击卡片上的`一键下载` 或者 点击封面或标题进入`漫画详情`，里面也有`一键下载`
3. 下载完成后点击`打开目录`按钮查看结果

**顺带一提，你可以在`本地库存`导出为pdf/cbz(zip)**

📹 下面的视频是完整使用流程，**没有H内容，请放心观看**

https://github.com/user-attachments/assets/d2d0e577-c074-41ca-996f-445d52e2cce5



## ⚠️关于被杀毒软件误判为病毒

对于个人开发的项目来说，这个问题几乎是无解的(~~需要购买数字证书给软件签名，甚至给杀毒软件交保护费~~)  
我能想到的解决办法只有：

1. 根据下面的**如何构建(build)**，自行编译
2. 希望你相信我的承诺，我承诺你在[Release页面](https://github.com/lanyeeee/hitomi-downloader/releases)下载到的所有东西都是安全的

## 🛠️如何构建(build)

构建非常简单，一共就3条命令  
~~前提是你已经安装了Rust、Node、pnpm~~

#### 📋前提

- [Rust](https://www.rust-lang.org/tools/install)
- [Node](https://nodejs.org/en)
- [pnpm](https://pnpm.io/installation)

#### 📝步骤

#### 1. 克隆本仓库

```
git clone https://github.com/lanyeeee/hitomi-downloader.git
```

#### 2.安装依赖

```
cd hitomi-downloader
pnpm install
```

#### 3.构建(build)

```
pnpm tauri build
```

## 🐧 Linux/Ubuntu 构建与安装

本应用针对 **Ubuntu 24.04 LTS** 进行了优化，具有以下性能增强：

- **自适应并发**: 自动根据 CPU 核心数进行扩展
- **HTTP 连接池**: 优化高吞吐量下载
- **内存高效**: 智能资源管理
- **安全加固**: Rust 内存安全 + 沙盒环境
- **自动构建与清理**: 构建脚本只保留应用程序，删除构建产物（节省约 13-15GB）

### Ubuntu 快速构建

```bash
./build-ubuntu.sh
```

### 📦 Flatpak 支持

Flatpak 现已支持，可在任何 Linux 发行版上轻松安装：

```bash
# 构建 Flatpak
./build-flatpak.sh build

# 构建并安装
./build-flatpak.sh install

# 运行应用程序
flatpak run com.thinhENK.hitomi-downloader
```

详细说明包括安装和卸载，请参阅：
- **[Ubuntu 构建与安装指南](./docs/guides/UBUNTU_BUILD_GUIDE.md)**（英文 + 越南语）
- **[Flatpak 构建与安装指南](./docs/guides/FLATPAK_GUIDE.md)**（英文 + 越南语）

## 🌐 添加新语言

欢迎帮助翻译本项目！如果您想要为项目添加新语言，请参考 [PR #1](https://github.com/lanyeeee/hitomi-downloader/pull/1) 的实现方式。这个PR展示了如何添加`英语(美国)`的本地化文件

添加新语言的主要步骤：

1. 在 `src/locales` 目录下创建新的语言文件
2. 参照现有语言文件的格式和键值对进行翻译
3. 在 `src/locales/index.ts` 中注册新语言
4. 提交PR

## 🤝提交PR

**PR请提交至`develop`分支**

**如果想新加一个功能，请先开个`issue`或`discussion`讨论一下，避免无效工作**

其他情况的PR欢迎直接提交，比如：

1. 🔧 对原有功能的改进
2. 🐛 修复BUG
3. 🌐 添加新的语言支持
4. ⚡ 使用更轻量的库实现原有功能
5. 📝 修订文档
6. ⬆️ 升级、更新依赖的PR也会被接受

## ⚠️免责声明

- 本工具仅作学习、研究、交流使用，使用本工具的用户应自行承担风险
- 作者不对使用本工具导致的任何损失、法律纠纷或其他后果负责
- 作者不对用户使用本工具的行为负责，包括但不限于用户违反法律或任何第三方权益的行为

## 感谢

[Pupil](https://github.com/tom5079/Pupil)

## 💬其他

任何使用中遇到的问题、任何希望添加的功能，都欢迎提交issue或开discussion交流，我会尽力解决