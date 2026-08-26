#!/bin/bash

# Kiểm tra xem người dùng có nhập version không
if [ -z "$1" ]; then
  echo "❌ Lỗi: Vui lòng nhập số phiên bản (Ví dụ: ./release.sh v1.1.0 hoặc ./release.sh 1.1.0)"
  exit 1
fi

INPUT_VERSION=$1
# Chuẩn hóa: CLEAN_VERSION không có prefix 'v', TAG_VERSION có prefix 'v'
CLEAN_VERSION="${INPUT_VERSION#[vV]}"
TAG_VERSION="v${CLEAN_VERSION}"

echo "🚀 Bắt đầu quy trình release cho phiên bản: $TAG_VERSION ($CLEAN_VERSION)..."

# 1. Tự động đồng bộ version vào ICEKYCLite.podspec (nếu tồn tại)
if [ -f "ICEKYCLite.podspec" ]; then
  sed -i '' -E "s/(s\.version[[:space:]]*=[[:space:]]*')[^']*(')/\1$CLEAN_VERSION\2/" ICEKYCLite.podspec
  echo "📝 Đã đồng bộ version $CLEAN_VERSION vào ICEKYCLite.podspec"
fi

# 2. Tự động đồng bộ version vào pubspec.yaml (nếu tồn tại)
if [ -f "pubspec.yaml" ]; then
  sed -i '' -E "s/^(version:[[:space:]]*)[0-9]+\.[0-9]+\.[0-9]+(\+[0-9]+)?/\1$CLEAN_VERSION/" pubspec.yaml
  echo "📝 Đã đồng bộ version $CLEAN_VERSION vào pubspec.yaml"
fi

# 3. Thêm tất cả thay đổi
git add .

# 4. Commit với thông báo release
git commit -m "chore: release $TAG_VERSION"

# 5. Push code lên nhánh hiện tại
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "📤 Đang đẩy code lên nhánh $BRANCH..."
git push origin $BRANCH

# 6. Kiểm tra xem tag đã tồn tại chưa, nếu có thì xóa để tạo mới (đề phòng lỗi)
if git rev-parse "$TAG_VERSION" >/dev/null 2>&1; then
  echo "⚠️ Tag $TAG_VERSION đã tồn tại. Đang tiến hành xóa và cập nhật lại..."
  git tag -d "$TAG_VERSION"
  git push origin --delete "$TAG_VERSION"
fi

# 7. Tạo Tag mới
echo "🏷️ Đang tạo tag $TAG_VERSION..."
git tag -a "$TAG_VERSION" -m "Release version $TAG_VERSION"

# 8. Push Tag lên GitHub
echo "📤 Đang đẩy tag lên GitHub..."
git push origin "$TAG_VERSION"

echo "✅ Đã release thành công phiên bản $TAG_VERSION!"
echo "🔗 Bây giờ bạn có thể vào GitHub để tạo 'Draft a new release' từ tag này."