import 'ekyc_config.dart';
import 'enum_ekyc.dart';

/// Cấu hình định sẵn (Presets) cho các luồng sử dụng eKYC phổ biến
class ICEkycPresets {
  // MARK: - FULL EKYC
  /// Tạo cấu hình cho luồng eKYC đầy đủ (Full eKYC).
  ///
  /// Bao gồm các bước: Chụp giấy tờ tùy thân (mặt trước & mặt sau), OCR trích xuất thông tin,
  /// và xác thực khuôn mặt (Face Verification) kết hợp kiểm tra tính sống (Liveness detection).
  ///
  /// * [accessToken]: Mã truy cập eKYC được cấp từ Dashboard.
  /// * [tokenId]: Token ID từ eKYC Dashboard.
  /// * [tokenKey]: Token Key từ eKYC Dashboard.
  /// * [changeBaseUrl]: Đường dẫn API tùy chỉnh (nếu có).
  /// * [documentType]: Loại giấy tờ tùy thân (mặc định [DocumentType.identityCard]).
  /// * [validateDocumentType]: Chế độ kiểm tra tính hợp lệ của giấy tờ (mặc định [ValidateDocumentType.basic]).
  /// * [versionSdk]: Phiên bản SDK cho giao diện chụp ảnh chân dung (mặc định [VersionSdk.proOval]).
  /// * [checkLivenessFace]: Chế độ kiểm tra khuôn mặt sống (mặc định [LivenessFaceMode.noneCheckFace]).
  /// * [isShowTutorial]: Hiển thị màn hình hướng dẫn trước khi chụp.
  /// * [isEnableCompare]: Bật/tắt so sánh ảnh chân dung với ảnh trên giấy tờ.
  /// * [isCheckMaskedFace]: Bật/tắt kiểm tra che mặt / đeo khẩu trang.
  /// * [isCheckLivenessCard]: Bật/tắt kiểm tra giấy tờ chụp trực tiếp (chống chụp lại qua màn hình).
  /// * [isValidatePostcode]: Bật/tắt kiểm tra mã bưu chính / mã tỉnh thành.
  /// * [isEnableGotIt]: Bật/tắt nút "Bỏ qua hướng dẫn".
  /// * [languageSdk]: Ngôn ngữ hiển thị trong SDK ([LanguageSdk.icekyc_vi] hoặc [LanguageSdk.icekyc_en]).
  /// * [isShowLogo]: Bật/tắt hiển thị logo thương hiệu trong màn hình eKYC.
  /// * [isTurnOffCallService]: Bật/tắt tự động gọi service của SDK sau khi chụp.
  /// * [isEnableScanQRCode]: Bật/tắt tính năng quét mã QR trên giấy tờ.
  /// * [isShowQRCodeResult]: Hiển thị kết quả quét mã QR sau khi quét.
  /// * [challengeCode]: Mã xác thực ngẫu nhiên từ hệ thống.
  /// * [modeButtonHeaderBar]: Vị trí nút điều hướng trên thanh header ([ModeButtonHeaderBar.leftButton] hoặc [ModeButtonHeaderBar.rightButton]).
  /// * [numberTimesRetryScanQRCode]: Số lần thử lại quét mã QR nếu thất bại.
  /// * [timeoutQRCodeFlow]: Thời gian timeout cho luồng quét mã QR (giây).
  /// * [isEnableWaterMark]: Bật/tắt chèn hình mờ (watermark) vào ảnh chụp.
  /// * [compressionQualityImageIos]: Hệ số nén ảnh trên iOS từ `0.0` đến `1.0` (mặc định SDK iOS: `0.6`).
  /// * [cameraQualityImageAndroid]: Chất lượng ảnh chụp trên Android từ `40` đến `100` (mặc định SDK Android: `80`).
  static ICEkycConfig fullEkyc({
    String accessToken = '',
    String tokenId = '',
    String tokenKey = '',
    String changeBaseUrl = '',
    DocumentType documentType = DocumentType.identityCard,
    ValidateDocumentType validateDocumentType = ValidateDocumentType.basic,
    VersionSdk versionSdk = VersionSdk.proOval,
    LivenessFaceMode checkLivenessFace = LivenessFaceMode.noneCheckFace,
    bool isShowTutorial = false,
    bool isEnableCompare = false,
    bool isCheckMaskedFace = false,
    bool isCheckLivenessCard = false,
    bool isValidatePostcode = false,
    bool isEnableGotIt = false,
    LanguageSdk languageSdk = LanguageSdk.icekyc_vi,
    bool isShowLogo = false,
    bool isTurnOffCallService = true,
    bool isEnableScanQRCode = false,
    bool isShowQRCodeResult = false,
    String challengeCode = '',
    ModeButtonHeaderBar modeButtonHeaderBar = ModeButtonHeaderBar.leftButton,
    int? numberTimesRetryScanQRCode,
    int? timeoutQRCodeFlow,
    bool isEnableWaterMark = false,
    double? compressionQualityImageIos,
    int? cameraQualityImageAndroid,
  }) => ICEkycConfig(
    accessToken: accessToken,
    tokenId: tokenId,
    tokenKey: tokenKey,
    changeBaseUrl: changeBaseUrl,
    documentType: documentType,
    isShowTutorial: isShowTutorial,
    isEnableCompare: isEnableCompare,
    isCheckMaskedFace: isCheckMaskedFace,
    checkLivenessFace: checkLivenessFace,
    isCheckLivenessCard: isCheckLivenessCard,
    isValidatePostcode: isValidatePostcode,
    validateDocumentType: validateDocumentType,
    isEnableGotIt: isEnableGotIt,
    languageSdk: languageSdk,
    isShowLogo: isShowLogo,
    versionSdk: versionSdk,
    isTurnOffCallService: isTurnOffCallService,
    isEnableScanQRCode: isEnableScanQRCode,
    isShowQRCodeResult: isShowQRCodeResult,
    challengeCode: challengeCode,
    modeButtonHeaderBar: modeButtonHeaderBar,
    numberTimesRetryScanQRCode: numberTimesRetryScanQRCode,
    timeoutQRCodeFlow: timeoutQRCodeFlow,
    isEnableWaterMark: isEnableWaterMark,
    compressionQualityImageIos: compressionQualityImageIos,
    cameraQualityImageAndroid: cameraQualityImageAndroid,
  );

  // MARK: - OCR ONLY
  /// Tạo cấu hình cho luồng chỉ đọc giấy tờ hai mặt (OCR Only).
  ///
  /// Bao gồm các bước: Chụp mặt trước và mặt sau của giấy tờ tùy thân,
  /// sau đó trích xuất thông tin giấy tờ mà không thực hiện xác thực khuôn mặt.
  ///
  /// * [accessToken]: Mã truy cập eKYC được cấp từ Dashboard.
  /// * [tokenId]: Token ID từ eKYC Dashboard.
  /// * [tokenKey]: Token Key từ eKYC Dashboard.
  /// * [documentType]: Loại giấy tờ tùy thân (mặc định [DocumentType.identityCard]).
  /// * [changeBaseUrl]: Đường dẫn API tùy chỉnh (nếu có).
  /// * [isShowTutorial]: Hiển thị màn hình hướng dẫn trước khi chụp.
  /// * [isCheckLivenessCard]: Bật/tắt kiểm tra giấy tờ chụp trực tiếp.
  /// * [validateDocumentType]: Chế độ kiểm tra tính hợp lệ của giấy tờ.
  /// * [isValidatePostcode]: Bật/tắt kiểm tra mã bưu chính / mã tỉnh thành.
  /// * [isEnableGotIt]: Bật/tắt nút "Bỏ qua hướng dẫn".
  /// * [languageSdk]: Ngôn ngữ hiển thị trong SDK.
  /// * [isShowLogo]: Bật/tắt hiển thị logo thương hiệu.
  /// * [isTurnOffCallService]: Bật/tắt tự động gọi service của SDK sau khi chụp.
  /// * [isEnableScanQRCode]: Bật/tắt tính năng quét mã QR trên giấy tờ.
  /// * [isShowQRCodeResult]: Hiển thị kết quả quét mã QR sau khi quét.
  /// * [challengeCode]: Mã xác thực ngẫu nhiên từ hệ thống.
  /// * [modeButtonHeaderBar]: Vị trí nút điều hướng trên thanh header.
  /// * [numberTimesRetryScanQRCode]: Số lần thử lại quét mã QR nếu thất bại.
  /// * [timeoutQRCodeFlow]: Thời gian timeout cho luồng quét mã QR (giây).
  /// * [isEnableWaterMark]: Bật/tắt chèn hình mờ (watermark) vào ảnh chụp.
  /// * [compressionQualityImageIos]: Hệ số nén ảnh trên iOS từ `0.0` đến `1.0` (mặc định SDK iOS: `0.6`).
  /// * [cameraQualityImageAndroid]: Chất lượng ảnh chụp trên Android từ `40` đến `100` (mặc định SDK Android: `80`).
  static ICEkycConfig ocrOnly({
    String accessToken = '',
    String tokenId = '',
    String tokenKey = '',
    DocumentType documentType = DocumentType.identityCard,
    String changeBaseUrl = '',
    bool isShowTutorial = false,
    bool isCheckLivenessCard = false,
    ValidateDocumentType validateDocumentType = ValidateDocumentType.basic,
    bool isValidatePostcode = false,
    bool isEnableGotIt = false,
    LanguageSdk languageSdk = LanguageSdk.icekyc_vi,
    bool isShowLogo = false,
    bool isTurnOffCallService = true,
    bool isEnableScanQRCode = false,
    bool isShowQRCodeResult = false,
    String challengeCode = '',
    ModeButtonHeaderBar modeButtonHeaderBar = ModeButtonHeaderBar.leftButton,
    int? numberTimesRetryScanQRCode,
    int? timeoutQRCodeFlow,
    bool isEnableWaterMark = false,
    double? compressionQualityImageIos,
    int? cameraQualityImageAndroid,
  }) => ICEkycConfig(
    accessToken: accessToken,
    tokenId: tokenId,
    tokenKey: tokenKey,
    documentType: documentType,
    changeBaseUrl: changeBaseUrl,
    isShowTutorial: isShowTutorial,
    isCheckLivenessCard: isCheckLivenessCard,
    validateDocumentType: validateDocumentType,
    isValidatePostcode: isValidatePostcode,
    isEnableGotIt: isEnableGotIt,
    languageSdk: languageSdk,
    isShowLogo: isShowLogo,
    isTurnOffCallService: isTurnOffCallService,
    isEnableScanQRCode: isEnableScanQRCode,
    isShowQRCodeResult: isShowQRCodeResult,
    challengeCode: challengeCode,
    modeButtonHeaderBar: modeButtonHeaderBar,
    numberTimesRetryScanQRCode: numberTimesRetryScanQRCode,
    timeoutQRCodeFlow: timeoutQRCodeFlow,
    isEnableWaterMark: isEnableWaterMark,
    compressionQualityImageIos: compressionQualityImageIos,
    cameraQualityImageAndroid: cameraQualityImageAndroid,
  );

  // MARK: - OCR FRONT
  /// Tạo cấu hình cho luồng chỉ đọc mặt trước giấy tờ (OCR Front).
  ///
  /// Chỉ chụp và trích xuất thông tin từ mặt trước của giấy tờ tùy thân.
  ///
  /// * [accessToken]: Mã truy cập eKYC được cấp từ Dashboard.
  /// * [tokenId]: Token ID từ eKYC Dashboard.
  /// * [tokenKey]: Token Key từ eKYC Dashboard.
  /// * [documentType]: Loại giấy tờ tùy thân (mặc định [DocumentType.identityCard]).
  /// * [changeBaseUrl]: Đường dẫn API tùy chỉnh (nếu có).
  /// * [isShowTutorial]: Hiển thị màn hình hướng dẫn trước khi chụp.
  /// * [isCheckLivenessCard]: Bật/tắt kiểm tra giấy tờ chụp trực tiếp.
  /// * [validateDocumentType]: Chế độ kiểm tra tính hợp lệ của giấy tờ.
  /// * [isValidatePostcode]: Bật/tắt kiểm tra mã bưu chính / mã tỉnh thành.
  /// * [isEnableGotIt]: Bật/tắt nút "Bỏ qua hướng dẫn".
  /// * [languageSdk]: Ngôn ngữ hiển thị trong SDK.
  /// * [isShowLogo]: Bật/tắt hiển thị logo thương hiệu.
  /// * [isTurnOffCallService]: Bật/tắt tự động gọi service của SDK sau khi chụp.
  /// * [isEnableScanQRCode]: Bật/tắt tính năng quét mã QR trên giấy tờ.
  /// * [isShowQRCodeResult]: Hiển thị kết quả quét mã QR sau khi quét.
  /// * [challengeCode]: Mã xác thực ngẫu nhiên từ hệ thống.
  /// * [modeButtonHeaderBar]: Vị trí nút điều hướng trên thanh header.
  /// * [isEnableWaterMark]: Bật/tắt chèn hình mờ (watermark) vào ảnh chụp.
  /// * [compressionQualityImageIos]: Hệ số nén ảnh trên iOS từ `0.0` đến `1.0` (mặc định SDK iOS: `0.6`).
  /// * [cameraQualityImageAndroid]: Chất lượng ảnh chụp trên Android từ `40` đến `100` (mặc định SDK Android: `80`).
  static ICEkycConfig ocrFront({
    String accessToken = '',
    String tokenId = '',
    String tokenKey = '',
    DocumentType documentType = DocumentType.identityCard,
    String changeBaseUrl = '',
    bool isShowTutorial = false,
    bool isCheckLivenessCard = false,
    ValidateDocumentType validateDocumentType = ValidateDocumentType.basic,
    bool isValidatePostcode = false,
    bool isEnableGotIt = false,
    LanguageSdk languageSdk = LanguageSdk.icekyc_vi,
    bool isShowLogo = false,
    bool isTurnOffCallService = true,
    bool isEnableScanQRCode = false,
    bool isShowQRCodeResult = false,
    String challengeCode = '',
    ModeButtonHeaderBar modeButtonHeaderBar = ModeButtonHeaderBar.leftButton,
    bool isEnableWaterMark = false,
    double? compressionQualityImageIos,
    int? cameraQualityImageAndroid,
  }) => ICEkycConfig(
    accessToken: accessToken,
    tokenId: tokenId,
    tokenKey: tokenKey,
    documentType: documentType,
    changeBaseUrl: changeBaseUrl,
    isShowTutorial: isShowTutorial,
    isCheckLivenessCard: isCheckLivenessCard,
    validateDocumentType: validateDocumentType,
    isValidatePostcode: isValidatePostcode,
    isEnableGotIt: isEnableGotIt,
    languageSdk: languageSdk,
    isShowLogo: isShowLogo,
    isTurnOffCallService: isTurnOffCallService,
    isEnableScanQRCode: isEnableScanQRCode,
    isShowQRCodeResult: isShowQRCodeResult,
    challengeCode: challengeCode,
    modeButtonHeaderBar: modeButtonHeaderBar,
    isEnableWaterMark: isEnableWaterMark,
    compressionQualityImageIos: compressionQualityImageIos,
    cameraQualityImageAndroid: cameraQualityImageAndroid,
  );

  // MARK: - OCR BACK
  /// Tạo cấu hình cho luồng chỉ đọc mặt sau giấy tờ (OCR Back).
  ///
  /// Chỉ chụp và trích xuất thông tin từ mặt sau của giấy tờ tùy thân.
  /// Thường dùng sau khi đã chụp mặt trước và nhận được [hashFrontOcr].
  ///
  /// * [accessToken]: Mã truy cập eKYC được cấp từ Dashboard.
  /// * [tokenId]: Token ID từ eKYC Dashboard.
  /// * [tokenKey]: Token Key từ eKYC Dashboard.
  /// * [hashFrontOcr]: Mã băm kết quả OCR mặt trước trả về từ bước trước đó.
  /// * [documentType]: Loại giấy tờ tùy thân (mặc định [DocumentType.identityCard]).
  /// * [changeBaseUrl]: Đường dẫn API tùy chỉnh (nếu có).
  /// * [isShowTutorial]: Hiển thị màn hình hướng dẫn trước khi chụp.
  /// * [isCheckLivenessCard]: Bật/tắt kiểm tra giấy tờ chụp trực tiếp.
  /// * [validateDocumentType]: Chế độ kiểm tra tính hợp lệ của giấy tờ.
  /// * [isValidatePostcode]: Bật/tắt kiểm tra mã bưu chính / mã tỉnh thành.
  /// * [isEnableGotIt]: Bật/tắt nút "Bỏ qua hướng dẫn".
  /// * [languageSdk]: Ngôn ngữ hiển thị trong SDK.
  /// * [isShowLogo]: Bật/tắt hiển thị logo thương hiệu.
  /// * [isTurnOffCallService]: Bật/tắt tự động gọi service của SDK sau khi chụp.
  /// * [modeButtonHeaderBar]: Vị trí nút điều hướng trên thanh header.
  /// * [isEnableWaterMark]: Bật/tắt chèn hình mờ (watermark) vào ảnh chụp.
  /// * [compressionQualityImageIos]: Hệ số nén ảnh trên iOS từ `0.0` đến `1.0` (mặc định SDK iOS: `0.6`).
  /// * [cameraQualityImageAndroid]: Chất lượng ảnh chụp trên Android từ `40` đến `100` (mặc định SDK Android: `80`).
  static ICEkycConfig ocrBack({
    String accessToken = '',
    String tokenId = '',
    String tokenKey = '',
    String hashFrontOcr = '',
    DocumentType documentType = DocumentType.identityCard,
    String changeBaseUrl = '',
    bool isShowTutorial = true,
    bool isCheckLivenessCard = true,
    ValidateDocumentType validateDocumentType = ValidateDocumentType.basic,
    bool isValidatePostcode = true,
    bool isEnableGotIt = true,
    LanguageSdk languageSdk = LanguageSdk.icekyc_vi,
    bool isShowLogo = false,
    bool isTurnOffCallService = true,
    ModeButtonHeaderBar modeButtonHeaderBar = ModeButtonHeaderBar.leftButton,
    bool isEnableWaterMark = false,
    double? compressionQualityImageIos,
    int? cameraQualityImageAndroid,
  }) => ICEkycConfig(
    accessToken: accessToken,
    tokenId: tokenId,
    tokenKey: tokenKey,
    documentType: documentType,
    isShowTutorial: isShowTutorial,
    hashFrontOcr: hashFrontOcr,
    isCheckLivenessCard: isCheckLivenessCard,
    validateDocumentType: validateDocumentType,
    isValidatePostcode: isValidatePostcode,
    isEnableGotIt: isEnableGotIt,
    languageSdk: languageSdk,
    isShowLogo: isShowLogo,
    isTurnOffCallService: isTurnOffCallService,
    modeButtonHeaderBar: modeButtonHeaderBar,
    isEnableWaterMark: isEnableWaterMark,
    compressionQualityImageIos: compressionQualityImageIos,
    cameraQualityImageAndroid: cameraQualityImageAndroid,
  );

  // MARK: - FACE VERIFICATION
  /// Tạo cấu hình cho luồng chỉ xác thực khuôn mặt (Face Verification).
  ///
  /// Thực hiện chụp ảnh chân dung theo khung Oval (xa/gần) và xác thực khuôn mặt
  /// kết hợp kiểm tra tính sống (Liveness detection), chống giả mạo mặt nạ/ảnh in.
  ///
  /// * [accessToken]: Mã truy cập eKYC được cấp từ Dashboard.
  /// * [tokenId]: Token ID từ eKYC Dashboard.
  /// * [tokenKey]: Token Key từ eKYC Dashboard.
  /// * [documentType]: Loại giấy tờ tùy thân.
  /// * [isShowTutorial]: Hiển thị màn hình hướng dẫn trước khi chụp.
  /// * [isCheckLivenessCard]: Bật/tắt kiểm tra giấy tờ chụp trực tiếp.
  /// * [isCheckMaskedFace]: Bật/tắt kiểm tra che mặt / đeo khẩu trang.
  /// * [checkLivenessFace]: Chế độ kiểm tra khuôn mặt sống ([LivenessFaceMode.noneCheckFace], [LivenessFaceMode.ibeta], [LivenessFaceMode.standard]).
  /// * [validateDocumentType]: Chế độ kiểm tra tính hợp lệ của giấy tờ.
  /// * [isValidatePostcode]: Bật/tắt kiểm tra mã bưu chính / mã tỉnh thành.
  /// * [isEnableGotIt]: Bật/tắt nút "Bỏ qua hướng dẫn".
  /// * [languageSdk]: Ngôn ngữ hiển thị trong SDK.
  /// * [isShowLogo]: Bật/tắt hiển thị logo thương hiệu.
  /// * [isTurnOffCallService]: Bật/tắt tự động gọi service của SDK sau khi chụp.
  /// * [isEnableScanQRCode]: Bật/tắt tính năng quét mã QR.
  /// * [isShowQRCodeResult]: Hiển thị kết quả quét mã QR.
  /// * [versionSdk]: Phiên bản SDK cho giao diện chụp ảnh chân dung ([VersionSdk.proOval] hoặc [VersionSdk.normal]).
  /// * [challengeCode]: Mã xác thực ngẫu nhiên từ hệ thống.
  /// * [modeButtonHeaderBar]: Vị trí nút điều hướng trên thanh header.
  /// * [isEnableWaterMark]: Bật/tắt chèn hình mờ (watermark) vào ảnh chụp.
  /// * [compressionQualityImageIos]: Hệ số nén ảnh trên iOS từ `0.0` đến `1.0` (mặc định SDK iOS: `0.6`).
  /// * [cameraQualityImageAndroid]: Chất lượng ảnh chụp trên Android từ `40` đến `100` (mặc định SDK Android: `80`).
  static ICEkycConfig faceVerification({
    String accessToken = '',
    String tokenId = '',
    String tokenKey = '',
    DocumentType documentType = DocumentType.identityCard,
    bool isShowTutorial = false,
    bool isCheckLivenessCard = false,
    bool isCheckMaskedFace = false,
    LivenessFaceMode checkLivenessFace = LivenessFaceMode.noneCheckFace,
    ValidateDocumentType validateDocumentType = ValidateDocumentType.basic,
    bool isValidatePostcode = false,
    bool isEnableGotIt = false,
    LanguageSdk languageSdk = LanguageSdk.icekyc_vi,
    bool isShowLogo = true,
    bool isTurnOffCallService = true,
    bool isEnableScanQRCode = false,
    bool isShowQRCodeResult = false,
    VersionSdk versionSdk = VersionSdk.proOval,
    String challengeCode = '',
    ModeButtonHeaderBar modeButtonHeaderBar = ModeButtonHeaderBar.leftButton,
    bool isEnableWaterMark = false,
    double? compressionQualityImageIos,
    int? cameraQualityImageAndroid,
  }) => ICEkycConfig(
    accessToken: accessToken,
    tokenId: tokenId,
    tokenKey: tokenKey,
    versionSdk: versionSdk,
    isShowTutorial: isShowTutorial,
    isCheckMaskedFace: isCheckMaskedFace,
    checkLivenessFace: checkLivenessFace,
    isEnableGotIt: isEnableGotIt,
    languageSdk: languageSdk,
    isShowLogo: isShowLogo,
    isTurnOffCallService: isTurnOffCallService,
    isEnableScanQRCode: isEnableScanQRCode,
    isShowQRCodeResult: isShowQRCodeResult,
    challengeCode: challengeCode,
    modeButtonHeaderBar: modeButtonHeaderBar,
    isEnableWaterMark: isEnableWaterMark,
    compressionQualityImageIos: compressionQualityImageIos,
    cameraQualityImageAndroid: cameraQualityImageAndroid,
  );

  // MARK: - SCAN QR CODE
  /// Tạo cấu hình cho luồng chỉ quét mã QR (Scan QR Code).
  ///
  /// Mở camera chuyên dụng để quét mã QR trên thẻ CCCD gắn chip hoặc các giấy tờ có mã QR.
  ///
  /// * [accessToken]: Mã truy cập eKYC được cấp từ Dashboard.
  /// * [tokenId]: Token ID từ eKYC Dashboard.
  /// * [tokenKey]: Token Key từ eKYC Dashboard.
  /// * [isShowTutorial]: Hiển thị màn hình hướng dẫn trước khi quét.
  /// * [isEnableGotIt]: Bật/tắt nút "Bỏ qua hướng dẫn".
  /// * [isTurnOffCallService]: Bật/tắt tự động gọi service của SDK sau khi quét.
  /// * [languageSdk]: Ngôn ngữ hiển thị trong SDK.
  /// * [isShowLogo]: Bật/tắt hiển thị logo thương hiệu.
  /// * [modeButtonHeaderBar]: Vị trí nút điều hướng trên thanh header.
  /// * [numberTimesRetryScanQRCode]: Số lần cho phép người dùng thử lại quét QR nếu quét thất bại.
  /// * [timeoutQRCodeFlow]: Thời gian đếm ngược giới hạn luồng quét QR (giây).
  static ICEkycConfig scanQRCode({
    required String accessToken,
    required String tokenId,
    required String tokenKey,
    bool isShowTutorial = false,
    bool isEnableGotIt = false,
    bool isTurnOffCallService = true,
    LanguageSdk languageSdk = LanguageSdk.icekyc_vi,
    bool isShowLogo = false,
    ModeButtonHeaderBar modeButtonHeaderBar = ModeButtonHeaderBar.leftButton,
    int? numberTimesRetryScanQRCode,
    int? timeoutQRCodeFlow,
  }) => ICEkycConfig(
    accessToken: accessToken,
    tokenId: tokenId,
    tokenKey: tokenKey,
    isTurnOffCallService: isTurnOffCallService,
    isShowTutorial: isShowTutorial,
    isEnableGotIt: isEnableGotIt,
    languageSdk: languageSdk,
    isShowLogo: isShowLogo,
    modeButtonHeaderBar: modeButtonHeaderBar,
    numberTimesRetryScanQRCode: numberTimesRetryScanQRCode,
    timeoutQRCodeFlow: timeoutQRCodeFlow,
  );
}
