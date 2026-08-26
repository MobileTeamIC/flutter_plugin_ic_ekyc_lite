# Hướng dẫn Release Plugin

Tài liệu này hướng dẫn cách sử dụng script `release.sh` để tự động hóa quy trình release phiên bản mới cho plugin.

## Quy trình Release

Script `release.sh` sẽ tự động thực hiện các bước sau:
1. **Tự động đồng bộ Version**: Tự động chuẩn hóa và cập nhật số version vào `ICEKYCLite.podspec` và `pubspec.yaml`.
2. `git add .`: Thêm toàn bộ thay đổi.
3. `git commit`: Tạo commit với thông báo `chore: release [VERSION]`.
4. `git push`: Đẩy code lên nhánh hiện tại.
5. **Quản lý Tag**: Xóa tag cũ (nếu trùng) và tạo tag mới `v[VERSION]`.
6. `git push origin [VERSION]`: Đẩy tag lên GitHub.

## Cách sử dụng

### 1. Cấp quyền thực thi (chỉ cần thực hiện một lần)

Trước khi chạy lần đầu tiên, bạn cần cấp quyền thực thi cho file script:

```bash
chmod +x release.sh
```

### 2. Chạy script release

Sử dụng lệnh sau để bắt đầu quy trình release (hỗ trợ cả định dạng `v1.0.14` hoặc `1.0.14`):

```bash
./release.sh [VERSION]
```

**Ví dụ:**

```bash
./release.sh v1.0.14
# hoặc
./release.sh 1.0.14
```

## Lưu ý quan trọng

- Đảm bảo bạn đang ở đúng nhánh muốn release (ví dụ: `main` hoặc `master`).
- Script sẽ **tự động đồng bộ version** vào file `ICEKYCLite.podspec` (dành cho iOS Native CocoaPods) và `pubspec.yaml`.
- Sau khi script chạy xong, bạn nên lên GitHub để tạo **Release Note** từ tag vừa mới push lên.