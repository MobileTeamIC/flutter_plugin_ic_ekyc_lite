import 'enum_ekyc.dart';

/// Configuration class for eKYC SDK parameters
class ICEkycConfig {

  // MARK: - CÁC THUỘC TÍNH CƠ BẢN CÀI ĐẶT CHUNG SDK
  /// Mã truy cập SDK được cấp từ hệ thống eKYC Dashboard
  final String? accessToken;

  /// Token ID được cấp từ hệ thống eKYC Dashboard
  final String? tokenId;

  /// Token Key bí mật dùng để xác thực SDK
  final String? tokenKey;

  /// Phiên bản giao diện SDK cho chụp ảnh chân dung ([VersionSdk.proOval] hoặc [VersionSdk.normal])
  final VersionSdk? versionSdk;

  /// Loại luồng eKYC thực hiện ([FlowType.full], [FlowType.ocr], [FlowType.face], v.v.)
  final FlowType? flowType;

  /// Ngôn ngữ hiển thị trong SDK ([LanguageSdk.icekyc_vi] hoặc [LanguageSdk.icekyc_en])
  final LanguageSdk? languageSdk;

  /// Mã xác thực ngẫu nhiên sinh ra từ hệ thống backend
  final String? challengeCode;

  /// Mã phiên giao dịch client (Client Session ID) để định danh phiên làm việc
  final String? inputClientSession;

  /// Bật/tắt hiển thị màn hình hướng dẫn thao tác trước khi chụp
  final bool? isShowTutorial;

  /// Bật/tắt vô hiệu hóa hoàn toàn màn hình hướng dẫn
  final bool? isDisableTutorial;

  /// Bật/tắt hiển thị pop-up điều khoản yêu cầu quyền theo Nghị định bảo vệ dữ liệu
  final bool? isShowRequiredPermissionDecree;

  /// Bật/tắt hiển thị màn hình hướng dẫn chụp giấy tờ nâng cao
  final bool? isEnableTutorialCardAdvance;

  /// Bật/tắt hiển thị nút "Bỏ qua hướng dẫn" / "Đã hiểu"
  final bool? isEnableGotIt;

  /// Bật/tắt hiển thị nút chuyển đổi camera trước/sau
  final bool? isShowSwitchCamera;

  /// Vị trí camera khi chụp chân dung ([CameraPosition.positionFront] hoặc [CameraPosition.positionBack])
  final CameraPosition? cameraPositionForPortrait;

  /// Hệ số thu phóng camera (zoom)
  final double? zoomCamera;

  /// Thời gian hết hạn của phiên eKYC (tính bằng giây)
  final int? expiresTime;

  /// Bật/tắt tự động gọi service nội bộ của SDK sau khi chụp ảnh
  final bool? isTurnOffCallService;

  /// Tỉ lệ nén ảnh trên iOS (`0.0` -> `1.0`, SDK mặc định là `0.6`)
  final double? compressionQualityImageIos;

  /// Chất lượng ảnh camera trên Android (`40` -> `100`, SDK mặc định là `80`)
  final int? cameraQualityImageAndroid;

  /// Tỉ lệ nén ảnh (cũ) - Khuyến khích sử dụng [compressionQualityImageIos] cho iOS hoặc [cameraQualityImageAndroid] cho Android
  @Deprecated('Sử dụng compressionQualityImageIos cho iOS hoặc cameraQualityImageAndroid cho Android')
  final double? compressionQualityImage;

  /// Bật/tắt tự động tăng độ sáng màn hình khi chụp ảnh
  final bool? isEnableAutoBrightness;

  /// Thiết lập độ sáng màn hình khi mở camera (giá trị từ 0.0 đến 1.0)
  final double? screenBrightness;

  /// Bật/tắt bỏ qua màn hình xem lại ảnh sau khi chụp
  final bool? isSkipPreview;

  /// Bật/tắt mã hóa dữ liệu ảnh và kết quả trước khi truyền
  final bool? isEnableEncrypt;

  /// Khóa công khai (Public Key) dùng để mã hóa dữ liệu
  final String? encryptPublicKey;

  /// Chế độ tải file ảnh lên máy chủ
  final String? modeUploadFile;

  // MARK: - CÁC THUỘC TÍNH VỀ GIẤY TỜ
  /// Loại giấy tờ tùy thân cần chụp/quét ([DocumentType.identityCard], [DocumentType.passport], v.v.)
  final DocumentType? documentType;

  /// Mã băm (hash) của kết quả OCR mặt trước (dùng khi thực hiện luồng chụp mặt sau)
  final String? hashFrontOcr;

  /// Bật/tắt kiểm tra giấy tờ chụp trực tiếp (chống chụp lại từ màn hình hoặc giấy tờ photocopy)
  final bool? isCheckLivenessCard;

  /// Bật/tắt tính năng quét mã QR trên giấy tờ
  final bool? isEnableScanQRCode;

  /// Bật/tắt hiển thị kết quả quét mã QR ngay trên giao diện SDK
  final bool? isShowQRCodeResult;

  /// Chế độ kiểm tra tính hợp lệ của giấy tờ ([ValidateDocumentType.none], [ValidateDocumentType.basic], v.v.)
  final ValidateDocumentType? validateDocumentType;

  /// Bật/tắt kiểm tra tính hợp lệ của mã bưu chính / mã tỉnh thành trên giấy tờ
  final bool? isValidatePostcode;

  /// Danh sách các loại giấy tờ bị chặn không cho phép quét
  final List<String>? listBlockedDocument;

  /// Phiên bản OCR áp dụng
  final String? modeVersionOCR;

  // MARK: - CÁC THUỘC TÍNH VỀ KHUÔN MẶT
  /// Bật/tắt tính năng so sánh khuôn mặt chân dung với ảnh trên giấy tờ tùy thân
  final bool? isEnableCompare;

  /// Loại so sánh khuôn mặt
  final int? compareType;

  /// Mã băm (hash) của ảnh khuôn mặt cần so sánh
  final String? hashImageCompare;

  /// Bật/tắt chế độ so sánh khuôn mặt tổng quát
  final bool? isCompareGeneral;

  /// Ngưỡng điểm số độ khớp khuôn mặt (Threshold level)
  final double? thresLevel;

  /// Chế độ kiểm tra tính sống của khuôn mặt ([LivenessFaceMode.noneCheckFace], [LivenessFaceMode.ibeta], [LivenessFaceMode.standard])
  final LivenessFaceMode? checkLivenessFace;

  /// Bật/tắt tính năng phát hiện che mặt hoặc đeo khẩu trang
  final bool? isCheckMaskedFace;

  // MARK: - CÁC THUỘC TÍNH VỀ VIỆC QUAY VIDEO LẠI QUÁ TRÌNH THỰC HIỆN OCR VÀ FACE TRONG SDK
  /// Bật/tắt quay lại video quá trình xác thực khuôn mặt
  final bool? isRecordVideoFace;

  /// Bật/tắt quay lại video quá trình chụp giấy tờ
  final bool? isRecordVideoDocument;

  // MARK: - CÁC THUỘC TÍNH VỀ MÔI TRƯỜNG PHÁT TRIỂN - URL TÁC VỤ TRONG SDK
  /// Bật/tắt chèn hình mờ (watermark) logo/thời gian vào ảnh chụp
  final bool? isEnableWaterMark;

  /// Bật/tắt nhúng metadata (EXIF/GPS/thiết bị) vào tệp ảnh
  final bool? isAddMetadataImage;

  /// Thời gian chờ tối đa khi gọi API hệ thống (giây)
  final int? timeoutCallApi;

  /// Đường dẫn máy chủ API tùy chỉnh (Base URL)
  final String? changeBaseUrl;

  /// Đường dẫn API tải ảnh lên tùy chỉnh
  final String? urlUploadImage;

  /// Đường dẫn API OCR tổng hợp tùy chỉnh
  final String? urlOcr;

  /// Đường dẫn API OCR mặt trước tùy chỉnh
  final String? urlOcrFront;

  /// Đường dẫn API so sánh khuôn mặt tùy chỉnh
  final String? urlCompare;

  /// Đường dẫn API so sánh khuôn mặt tổng quát tùy chỉnh
  final String? urlCompareGeneral;

  /// Đường dẫn API xác minh khuôn mặt tùy chỉnh
  final String? urlVerifyFace;

  /// Đường dẫn API thêm khuôn mặt tùy chỉnh
  final String? urlAddFace;

  /// Đường dẫn API thêm thông tin thẻ tùy chỉnh
  final String? urlAddCardId;

  /// Đường dẫn API kiểm tra giấy tờ thật/giả tùy chỉnh
  final String? urlLivenessCard;

  /// Đường dẫn API kiểm tra che mặt tùy chỉnh
  final String? urlCheckMaskedFace;

  /// Đường dẫn API tìm kiếm khuôn mặt tùy chỉnh
  final String? urlSearchFace;

  /// Đường dẫn API kiểm tra khuôn mặt sống 2D tùy chỉnh
  final String? urlLivenessFace;

  /// Đường dẫn API kiểm tra khuôn mặt sống 3D tùy chỉnh
  final String? urlLivenessFace3D;

  /// Đường dẫn API ghi log của SDK
  final String? urlLogSdk;

  /// Header tùy chỉnh bổ sung khi SDK gửi request API
  final Map<String, dynamic>? headersRequest;

  /// Mã định danh phiên giao dịch eKYC (Transaction ID)
  final String? transactionId;

  /// Mã giao dịch từ phía đối tác
  final String? transactionPartnerId;

  /// Mã giao dịch đối tác cho bước OCR
  final String? transactionPartnerIdOCR;

  /// Mã giao dịch đối tác cho bước OCR mặt trước
  final String? transactionPartnerIdOCRFront;

  /// Mã giao dịch đối tác cho kiểm tra giấy tờ mặt trước
  final String? transactionPartnerIdLivenessFront;

  /// Mã giao dịch đối tác cho kiểm tra giấy tờ mặt sau
  final String? transactionPartnerIdLivenessBack;

  /// Mã giao dịch đối tác cho bước so sánh khuôn mặt
  final String? transactionPartnerIdCompareFace;

  /// Mã giao dịch đối tác cho kiểm tra khuôn mặt sống
  final String? transactionPartnerIdLivenessFace;

  /// Mã giao dịch đối tác cho kiểm tra che mặt
  final String? transactionPartnerIdMaskedFace;

  // MARK: - CÁC THUỘC TÍNH VỀ CHỈNH SỬA TÊN CÁC TỆP TIN HIỆU ỨNG - VIDEO HƯỚNG DẪN
  /// Tên tệp animation khung oval
  final String? nameOvalAnimation;

  /// Tên tệp animation phản hồi hướng dẫn
  final String? nameFeedbackAnimation;

  /// Tên tệp animation quét mã QR
  final String? nameScanQRCodeAnimation;

  /// Tên tệp animation xem trước giấy tờ
  final String? namePreviewDocumentAnimation;

  /// Tên tệp animation tải thành công
  final String? nameLoadSuccessAnimation;

  /// Tên tệp âm thanh hướng dẫn chụp chân dung
  final String? nameHelpAudioFace;

  /// Tên tệp video hướng dẫn chụp chân dung
  final String? nameHelpVideoFace;

  /// Tên tệp video hướng dẫn chụp giấy tờ
  final String? nameHelpVideoDocument;

  // MARK: - CÁC THUỘC TÍNH VỀ MÀU SẮC GIAO DIỆN TRONG SDK
  /// Vị trí nút đóng/lùi trên thanh header ([ModeButtonHeaderBar.leftButton] hoặc [ModeButtonHeaderBar.rightButton])
  final ModeButtonHeaderBar? modeButtonHeaderBar;

  /// Mã màu mã hex nội dung trên thanh header bar
  final String? contentColorHeaderBar;

  /// Mã màu nền thanh header bar
  final String? backgroundColorHeaderBar;

  /// Mã màu chữ nội dung chính
  final String? textColorContentMain;

  /// Mã màu tiêu đề chính
  final String? titleColorMain;

  /// Mã màu nền màn hình chính
  final String? backgroundColorMainScreen;

  /// Mã màu đường viền phân cách
  final String? backgroundColorLine;

  /// Mã màu nền nút khi kích hoạt
  final String? backgroundColorActiveButton;

  /// Mã màu nền nút khi vô hiệu hóa
  final String? backgroundColorDeactiveButton;

  /// Mã màu chữ nút khi kích hoạt
  final String? titleColorActiveButton;

  /// Mã màu chữ nút khi vô hiệu hóa
  final String? titleColorDeactiveButton;

  /// Mã màu nền màn hình chụp giấy tờ
  final String? backgroundColorCaptureDocumentScreen;

  /// Mã màu nền màn hình chụp khuôn mặt
  final String? backgroundColorCaptureFaceScreen;

  /// Mã màu hiệu ứng thông báo khuôn mặt hợp lệ
  final String? effectColorNoticeFace;

  /// Mã màu chữ thông báo khuôn mặt
  final String? textColorNoticeFace;

  /// Mã màu hiệu ứng khi khuôn mặt không hợp lệ
  final String? effectColorNoticeInvalidFace;

  /// Mã màu nội dung hiệu ứng khuôn mặt
  final String? colorContentFaceEffect;

  /// Mã màu hiệu ứng khi giấy tờ hợp lệ
  final String? effectColorNoticeValidDocument;

  /// Mã màu hiệu ứng khi giấy tờ không hợp lệ
  final String? effectColorNoticeInvalidDocument;

  /// Mã màu chữ thông báo giấy tờ hợp lệ
  final String? textColorNoticeValidDocument;

  /// Mã màu chữ thông báo giấy tờ không hợp lệ
  final String? textColorNoticeInvalidDocument;

  /// Mã màu nút bấm chụp ảnh
  final String? tintColorButtonCapture;

  /// Mã màu viền khung chụp khuôn mặt
  final String? backgroundColorBorderCaptureFace;

  /// Bật/tắt hiển thị logo thương hiệu trong màn hình eKYC
  final bool? isShowLogo;

  /// Đường dẫn hoặc tên asset logo thương hiệu
  final String? logo;

  /// Logo thương hiệu hiển thị tại màn hình oval
  final String? logoFaceOval;

  /// Chiều rộng hiển thị của logo (pixel)
  final double? widthLogo;

  /// Chiều cao hiển thị của logo (pixel)
  final double? heightLogo;

  /// Asset hình ảnh hướng dẫn quét mã QR
  final String? imageTutorialQRCode;

  /// Asset hình ảnh hướng dẫn chụp mặt trước
  final String? imageTutorialFront;

  /// Asset hình ảnh hướng dẫn chụp mặt sau
  final String? imageTutorialBack;

  /// Asset hình ảnh hướng dẫn giấy tờ bị mờ
  final String? imageTutorialBlur;

  /// Asset hình ảnh hướng dẫn giấy tờ bị mất góc
  final String? imageTutorialLostAngle;

  /// Asset hình ảnh hướng dẫn giấy tờ bị lóa sáng
  final String? imageTutorialGlare;

  /// Mã màu nền hộp thoại popup
  final String? backgroundColorPopup;

  /// Mã màu chữ nội dung trong popup
  final String? textColorContentPopup;

  /// Bật/tắt kiểm tra và chặn camera ảo
  final bool? isEnableCheckVirtualCamera;

  /// Bật/tắt kiểm tra và chặn chạy trên máy ảo (Simulator/Emulator)
  final bool? isEnableCheckSimulator;

  /// Bật/tắt kiểm tra và chặn thiết bị đã bị Jailbreak/Root
  final bool? isEnableCheckJailbroken;

  /// Bật/tắt hiệu ứng chuyển cảnh khi đóng màn hình SDK
  final bool? isAnimatedDismissed;

  /// Số lần cho phép thử lại quét mã QR nếu thất bại
  final int? numberTimesRetryScanQRCode;

  /// Thời gian giới hạn đếm ngược của luồng quét mã QR (giây)
  final int? timeoutQRCodeFlow;

  const ICEkycConfig({
    this.accessToken,
    this.tokenId,
    this.tokenKey,
    this.versionSdk,
    this.flowType,
    this.languageSdk,
    this.challengeCode,
    this.inputClientSession,
    this.isShowTutorial,
    this.isDisableTutorial,
    this.isShowRequiredPermissionDecree,
    this.isEnableTutorialCardAdvance,
    this.isEnableGotIt,
    this.isShowSwitchCamera,
    this.cameraPositionForPortrait,
    this.zoomCamera,
    this.expiresTime,
    this.isTurnOffCallService,
    this.compressionQualityImageIos,
    this.cameraQualityImageAndroid,
    this.compressionQualityImage,
    this.isEnableAutoBrightness,
    this.screenBrightness,
    this.isSkipPreview,
    this.isEnableEncrypt,
    this.encryptPublicKey,
    this.modeUploadFile,
    this.documentType,
    this.hashFrontOcr,
    this.isCheckLivenessCard,
    this.isEnableScanQRCode,
    this.isShowQRCodeResult,
    this.validateDocumentType,
    this.isValidatePostcode,
    this.listBlockedDocument,
    this.modeVersionOCR,
    this.isEnableCompare,
    this.compareType,
    this.hashImageCompare,
    this.isCompareGeneral,
    this.thresLevel,
    this.checkLivenessFace,
    this.isCheckMaskedFace,
    this.isRecordVideoFace,
    this.isRecordVideoDocument,
    this.isEnableWaterMark,
    this.isAddMetadataImage,
    this.timeoutCallApi,
    this.changeBaseUrl,
    this.urlUploadImage,
    this.urlOcr,
    this.urlOcrFront,
    this.urlCompare,
    this.urlCompareGeneral,
    this.urlVerifyFace,
    this.urlAddFace,
    this.urlAddCardId,
    this.urlLivenessCard,
    this.urlCheckMaskedFace,
    this.urlSearchFace,
    this.urlLivenessFace,
    this.urlLivenessFace3D,
    this.urlLogSdk,
    this.headersRequest,
    this.transactionId,
    this.transactionPartnerId,
    this.transactionPartnerIdOCR,
    this.transactionPartnerIdOCRFront,
    this.transactionPartnerIdLivenessFront,
    this.transactionPartnerIdLivenessBack,
    this.transactionPartnerIdCompareFace,
    this.transactionPartnerIdLivenessFace,
    this.transactionPartnerIdMaskedFace,
    this.nameOvalAnimation,
    this.nameFeedbackAnimation,
    this.nameScanQRCodeAnimation,
    this.namePreviewDocumentAnimation,
    this.nameLoadSuccessAnimation,
    this.nameHelpAudioFace,
    this.nameHelpVideoFace,
    this.nameHelpVideoDocument,
    this.modeButtonHeaderBar,
    this.contentColorHeaderBar,
    this.backgroundColorHeaderBar,
    this.textColorContentMain,
    this.titleColorMain,
    this.backgroundColorMainScreen,
    this.backgroundColorLine,
    this.backgroundColorActiveButton,
    this.backgroundColorDeactiveButton,
    this.titleColorActiveButton,
    this.titleColorDeactiveButton,
    this.backgroundColorCaptureDocumentScreen,
    this.backgroundColorCaptureFaceScreen,
    this.effectColorNoticeFace,
    this.textColorNoticeFace,
    this.effectColorNoticeInvalidFace,
    this.colorContentFaceEffect,
    this.effectColorNoticeValidDocument,
    this.effectColorNoticeInvalidDocument,
    this.textColorNoticeValidDocument,
    this.textColorNoticeInvalidDocument,
    this.tintColorButtonCapture,
    this.backgroundColorBorderCaptureFace,
    this.isShowLogo,
    this.logo,
    this.logoFaceOval,
    this.widthLogo,
    this.heightLogo,
    this.imageTutorialQRCode,
    this.imageTutorialFront,
    this.imageTutorialBack,
    this.imageTutorialBlur,
    this.imageTutorialLostAngle,
    this.imageTutorialGlare,
    this.backgroundColorPopup,
    this.textColorContentPopup,
    this.isEnableCheckVirtualCamera,
    this.isEnableCheckSimulator,
    this.isEnableCheckJailbroken,
    this.isAnimatedDismissed,
    this.numberTimesRetryScanQRCode,
    this.timeoutQRCodeFlow,
  });

  /// Convert to Map for method channel
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = { };

    if (accessToken != null) map['access_token'] = accessToken!;
    if (tokenId != null) map['token_id'] = tokenId!;
    if (tokenKey != null) map['token_key'] = tokenKey!;
    if (versionSdk != null) map['version_sdk'] = versionSdk!.name;
    if (flowType != null) map['flow_type'] = flowType!.name;
    if (languageSdk != null) map['language_sdk'] = languageSdk!.name;
    if (challengeCode != null) map['challenge_code'] = challengeCode!;
    if (inputClientSession != null) map['input_client_session'] = inputClientSession!;
    if (isShowTutorial != null) map['is_show_tutorial'] = isShowTutorial!;
    if (isDisableTutorial != null) map['is_disable_tutorial'] = isDisableTutorial!;
    if (isShowRequiredPermissionDecree != null) map['is_show_required_permission_decree'] = isShowRequiredPermissionDecree!;
    if (isEnableTutorialCardAdvance != null) map['is_enable_tutorial_card_advance'] = isEnableTutorialCardAdvance!;
    if (isEnableGotIt != null) map['is_enable_gotit'] = isEnableGotIt!;
    if (isShowSwitchCamera != null) map['is_show_switch_camera'] = isShowSwitchCamera!;
    if (cameraPositionForPortrait != null) map['camera_position_for_portrait'] = cameraPositionForPortrait!.name;
    if (zoomCamera != null) map['zoom_camera'] = zoomCamera!;
    if (expiresTime != null) map['expires_time'] = expiresTime!;
    if (isTurnOffCallService != null) map['is_turn_off_call_service'] = isTurnOffCallService!;
    final iosQuality = compressionQualityImageIos ?? compressionQualityImage;
    if (iosQuality != null) {
      map['compression_quality_image_ios'] = iosQuality;
      map['compression_quality_image'] = iosQuality;
    }
    if (cameraQualityImageAndroid != null) {
      map['camera_quality_image_android'] = cameraQualityImageAndroid!;
    }
    if (isEnableAutoBrightness != null) map['is_enable_auto_brightness'] = isEnableAutoBrightness!;
    if (screenBrightness != null) map['screen_brightness'] = screenBrightness!;
    if (isSkipPreview != null) map['is_skip_preview'] = isSkipPreview!;
    if (isEnableEncrypt != null) map['is_enable_encrypt'] = isEnableEncrypt!;
    if (encryptPublicKey != null) map['encrypt_public_key'] = encryptPublicKey!;
    if (modeUploadFile != null) map['mode_upload_file'] = modeUploadFile!;
    if (documentType != null) map['document_type'] = documentType!.name;
    if (hashFrontOcr != null) map['hash_front_ocr'] = hashFrontOcr!;
    if (isCheckLivenessCard != null) map['is_check_liveness_card'] = isCheckLivenessCard!;
    if (isEnableScanQRCode != null) map['is_enable_scan_qrcode'] = isEnableScanQRCode!;
    if (isShowQRCodeResult != null) map['is_show_qrcode_result'] = isShowQRCodeResult!;
    if (validateDocumentType != null) map['validate_document_type'] = validateDocumentType!.name;
    if (isValidatePostcode != null) map['is_validate_postcode'] = isValidatePostcode!;
    if (listBlockedDocument != null) map['list_blocked_document'] = listBlockedDocument!;
    if (modeVersionOCR != null) map['mode_version_ocr'] = modeVersionOCR!;
    if (isEnableCompare != null) map['is_enable_compare'] = isEnableCompare!;
    if (compareType != null) map['compare_type'] = compareType!;
    if (hashImageCompare != null) map['hash_image_compare'] = hashImageCompare!;
    if (isCompareGeneral != null) map['is_compare_general'] = isCompareGeneral!;
    if (thresLevel != null) map['thres_level'] = thresLevel!;
    if (checkLivenessFace != null) map['check_liveness_face'] = checkLivenessFace!.name;
    if (isCheckMaskedFace != null) map['is_check_masked_face'] = isCheckMaskedFace!;
    if (isRecordVideoFace != null) map['is_record_video_face'] = isRecordVideoFace!;
    if (isRecordVideoDocument != null) map['is_record_video_document'] = isRecordVideoDocument!;
    if (isEnableWaterMark != null) map['is_enable_water_mark'] = isEnableWaterMark!;
    if (isAddMetadataImage != null) map['is_add_metadata_image'] = isAddMetadataImage!;
    if (timeoutCallApi != null) map['timeout_call_api'] = timeoutCallApi!;
    if (changeBaseUrl != null) map['change_base_url'] = changeBaseUrl!;
    if (urlUploadImage != null) map['url_upload_image'] = urlUploadImage!;
    if (urlOcr != null) map['url_ocr'] = urlOcr!;
    if (urlOcrFront != null) map['url_ocr_front'] = urlOcrFront!;
    if (urlCompare != null) map['url_compare'] = urlCompare!;
    if (urlCompareGeneral != null) map['url_compare_general'] = urlCompareGeneral!;
    if (urlVerifyFace != null) map['url_verify_face'] = urlVerifyFace!;
    if (urlAddFace != null) map['url_add_face'] = urlAddFace!;
    if (urlAddCardId != null) map['url_add_card_id'] = urlAddCardId!;
    if (urlLivenessCard != null) map['url_liveness_card'] = urlLivenessCard!;
    if (urlCheckMaskedFace != null) map['url_check_masked_face'] = urlCheckMaskedFace!;
    if (urlSearchFace != null) map['url_search_face'] = urlSearchFace!;
    if (urlLivenessFace != null) map['url_liveness_face'] = urlLivenessFace!;
    if (urlLivenessFace3D != null) map['url_liveness_face_3d'] = urlLivenessFace3D!;
    if (urlLogSdk != null) map['url_log_sdk'] = urlLogSdk!;
    if (headersRequest != null) map['headers_request'] = headersRequest!;
    if (transactionId != null) map['transaction_id'] = transactionId!;
    if (transactionPartnerId != null) map['transaction_partner_id'] = transactionPartnerId!;
    if (transactionPartnerIdOCR != null) map['transaction_partner_id_ocr'] = transactionPartnerIdOCR!;
    if (transactionPartnerIdOCRFront != null) map['transaction_partner_id_ocr_front'] = transactionPartnerIdOCRFront!;
    if (transactionPartnerIdLivenessFront != null) map['transaction_partner_id_liveness_front'] = transactionPartnerIdLivenessFront!;
    if (transactionPartnerIdLivenessBack != null) map['transaction_partner_id_liveness_back'] = transactionPartnerIdLivenessBack!;
    if (transactionPartnerIdCompareFace != null) map['transaction_partner_id_compare_face'] = transactionPartnerIdCompareFace!;
    if (transactionPartnerIdLivenessFace != null) map['transaction_partner_id_liveness_face'] = transactionPartnerIdLivenessFace!;
    if (transactionPartnerIdMaskedFace != null) map['transaction_partner_id_masked_face'] = transactionPartnerIdMaskedFace!;
    if (nameOvalAnimation != null) map['name_oval_animation'] = nameOvalAnimation!;
    if (nameFeedbackAnimation != null) map['name_feedback_animation'] = nameFeedbackAnimation!;
    if (nameScanQRCodeAnimation != null) map['name_scan_qrcode_animation'] = nameScanQRCodeAnimation!;
    if (namePreviewDocumentAnimation != null) map['name_preview_document_animation'] = namePreviewDocumentAnimation!;
    if (nameLoadSuccessAnimation != null) map['name_load_success_animation'] = nameLoadSuccessAnimation!;
    if (nameHelpAudioFace != null) map['name_help_audio_face'] = nameHelpAudioFace!;
    if (nameHelpVideoFace != null) map['name_help_video_face'] = nameHelpVideoFace!;
    if (nameHelpVideoDocument != null) map['name_help_video_document'] = nameHelpVideoDocument!;
    if (modeButtonHeaderBar != null) map['mode_button_header_bar'] = modeButtonHeaderBar!.name;
    if (contentColorHeaderBar != null) map['content_color_header_bar'] = contentColorHeaderBar!;
    if (backgroundColorHeaderBar != null) map['background_color_header_bar'] = backgroundColorHeaderBar!;
    if (textColorContentMain != null) map['text_color_content_main'] = textColorContentMain!;
    if (titleColorMain != null) map['title_color_main'] = titleColorMain!;
    if (backgroundColorMainScreen != null) map['background_color_main_screen'] = backgroundColorMainScreen!;
    if (backgroundColorLine != null) map['background_color_line'] = backgroundColorLine!;
    if (backgroundColorActiveButton != null) map['background_color_active_button'] = backgroundColorActiveButton!;
    if (backgroundColorDeactiveButton != null) map['background_color_deactive_button'] = backgroundColorDeactiveButton!;
    if (titleColorActiveButton != null) map['title_color_active_button'] = titleColorActiveButton!;
    if (titleColorDeactiveButton != null) map['title_color_deactive_button'] = titleColorDeactiveButton!;
    if (backgroundColorCaptureDocumentScreen != null) map['background_color_capture_document_screen'] = backgroundColorCaptureDocumentScreen!;
    if (backgroundColorCaptureFaceScreen != null) map['background_color_capture_face_screen'] = backgroundColorCaptureFaceScreen!;
    if (effectColorNoticeFace != null) map['effect_color_notice_face'] = effectColorNoticeFace!;
    if (textColorNoticeFace != null) map['text_color_notice_face'] = textColorNoticeFace!;
    if (effectColorNoticeInvalidFace != null) map['effect_color_notice_invalid_face'] = effectColorNoticeInvalidFace!;
    if (colorContentFaceEffect != null) map['color_content_face_effect'] = colorContentFaceEffect!;
    if (effectColorNoticeValidDocument != null) map['effect_color_notice_valid_document'] = effectColorNoticeValidDocument!;
    if (effectColorNoticeInvalidDocument != null) map['effect_color_notice_invalid_document'] = effectColorNoticeInvalidDocument!;
    if (textColorNoticeValidDocument != null) map['text_color_notice_valid_document'] = textColorNoticeValidDocument!;
    
    if (textColorNoticeInvalidDocument != null) map['text_color_notice_invalid_document'] = textColorNoticeInvalidDocument!;
    if (tintColorButtonCapture != null) map['tint_color_button_capture'] = tintColorButtonCapture!;
    if (backgroundColorBorderCaptureFace != null) map['background_color_border_capture_face'] = backgroundColorBorderCaptureFace!;
    if (isShowLogo != null) map['is_show_logo'] = isShowLogo!;
    if (logo != null) map['logo'] = logo!;
    if (logoFaceOval != null) map['logo_face_oval'] = logoFaceOval!;
    if (widthLogo != null) map['width_logo'] = widthLogo!;
    if (heightLogo != null) map['height_logo'] = heightLogo!;
    if (imageTutorialQRCode != null) map['image_tutorial_qrcode'] = imageTutorialQRCode!;
    if (imageTutorialFront != null) map['image_tutorial_front'] = imageTutorialFront!;
    if (imageTutorialBack != null) map['image_tutorial_back'] = imageTutorialBack!;
    if (imageTutorialBlur != null) map['image_tutorial_blur'] = imageTutorialBlur!;
    if (imageTutorialLostAngle != null) map['image_tutorial_lost_angle'] = imageTutorialLostAngle!;
    if (imageTutorialGlare != null) map['image_tutorial_glare'] = imageTutorialGlare!;
    if (backgroundColorPopup != null) map['background_color_popup'] = backgroundColorPopup!;
    if (textColorContentPopup != null) map['text_color_content_popup'] = textColorContentPopup!;
    if (isEnableCheckVirtualCamera != null) map['is_enable_check_virtual_camera'] = isEnableCheckVirtualCamera!;
    if (isEnableCheckSimulator != null) map['is_enable_check_simulator'] = isEnableCheckSimulator!;
    if (isEnableCheckJailbroken != null) map['is_enable_check_jailbroken'] = isEnableCheckJailbroken!;
    if (isAnimatedDismissed != null) map['is_animated_dismissed'] = isAnimatedDismissed!;

    if (numberTimesRetryScanQRCode != null) map['number_times_retry_scan_qr_code'] = numberTimesRetryScanQRCode!;
    if (timeoutQRCodeFlow != null) map['timeout_qr_code_flow'] = timeoutQRCodeFlow!;
    
    return map;
  }
}
