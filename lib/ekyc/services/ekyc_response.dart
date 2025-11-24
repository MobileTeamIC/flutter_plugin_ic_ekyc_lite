import 'dart:convert';
import 'enum_ekyc.dart';
import 'ekyc_key_result.dart';

/// Response model for eKYC operations
/// Contains status and data in a unified JSON structure
class EkycResponse {
  /// Status of the eKYC operation
  final EkycStatus status;
  /// Data of the successful eKYC operation
  final EkycResultData? successData;
  /// Data of the cancelled eKYC operation
  final EkycCancelledData? cancelledData;
  final Map<String, dynamic>? errorData;

  const EkycResponse({
    required this.status,
    this.successData,
    this.cancelledData,
    this.errorData,
  });

  /// Parse from JSON string (from native)
  factory EkycResponse.fromJson(String jsonString) {
    try {
      final Map<String, dynamic> json = jsonDecode(jsonString);
      final String statusString = json['status'] as String? ?? 'FAILED';
      final EkycStatus status = EkycStatus.fromString(statusString);
      final Map<String, dynamic>? data = json['data'] as Map<String, dynamic>?;

      switch (status) {
        case EkycStatus.success:
          return EkycResponse(
            status: status,
            successData: data != null ? EkycResultData.fromMap(data) : null,
          );
        case EkycStatus.cancelled:
          return EkycResponse(
            status: status,
            cancelledData: data != null
                ? EkycCancelledData.fromMap(data)
                : null,
          );
        case EkycStatus.failed:
          return EkycResponse(
            status: status,
            errorData: data,
          );
      }
    } catch (e) {
      // If parsing fails, return failed status
      return EkycResponse(
        status: EkycStatus.failed,
        errorData: {'error': 'Failed to parse response: $e'},
      );
    }
  }

  /// Convert to Map for easy access
  Map<String, dynamic> toMap() {
    return {
      'status': status.value,
      'data': _getDataMap(),
    };
  }

  Map<String, dynamic>? _getDataMap() {
    switch (status) {
      case EkycStatus.success:
        return successData?.toMap();
      case EkycStatus.cancelled:
        return cancelledData?.toMap();
      case EkycStatus.failed:
        return errorData;
    }
  }

  /// Check if operation was successful
  bool get isSuccess => status == EkycStatus.success;

  /// Check if operation was cancelled
  bool get isCancelled => status == EkycStatus.cancelled;

  /// Check if operation failed
  bool get isFailed => status == EkycStatus.failed;
}

/// Data model for successful eKYC operation
class EkycResultData {
  final String? cropParam;
  final String? pathImageFrontFull;
  final String? pathImageBackFull;
  final String? pathImageFaceFull;
  final String? pathImageFaceFarFull;
  final String? pathImageFaceNearFull;
  final String? pathImageFaceScan3D;
  final String? clientSessionResult;

  const EkycResultData({
    this.cropParam,
    this.pathImageFrontFull,
    this.pathImageBackFull,
    this.pathImageFaceFull,
    this.pathImageFaceFarFull,
    this.pathImageFaceNearFull,
    this.pathImageFaceScan3D,
    this.clientSessionResult,
  });

  /// Parse from Map (from native JSON)
  factory EkycResultData.fromMap(Map<String, dynamic> map) {
    return EkycResultData(
      cropParam: map[ICEkycKeyResult.cropParam] as String?,
      pathImageFrontFull:
          map[ICEkycKeyResult.pathImageFrontFull] as String?,
      pathImageBackFull: map[ICEkycKeyResult.pathImageBackFull] as String?,
      pathImageFaceFull: map[ICEkycKeyResult.pathImageFaceFull] as String?,
      pathImageFaceFarFull:
          map[ICEkycKeyResult.pathImageFaceFarFull] as String?,
      pathImageFaceNearFull:
          map[ICEkycKeyResult.pathImageFaceNearFull] as String?,
      pathImageFaceScan3D:
          map[ICEkycKeyResult.pathImageFaceScan3D] as String?,
      clientSessionResult:
          map[ICEkycKeyResult.clientSessionResult] as String?,
    );
  }

  /// Convert to Map
  Map<String, dynamic> toMap() {
    return {
      if (cropParam != null) ICEkycKeyResult.cropParam: cropParam,
      if (pathImageFrontFull != null)
        ICEkycKeyResult.pathImageFrontFull: pathImageFrontFull,
      if (pathImageBackFull != null)
        ICEkycKeyResult.pathImageBackFull: pathImageBackFull,
      if (pathImageFaceFull != null)
        ICEkycKeyResult.pathImageFaceFull: pathImageFaceFull,
      if (pathImageFaceFarFull != null)
        ICEkycKeyResult.pathImageFaceFarFull: pathImageFaceFarFull,
      if (pathImageFaceNearFull != null)
        ICEkycKeyResult.pathImageFaceNearFull: pathImageFaceNearFull,
      if (pathImageFaceScan3D != null)
        ICEkycKeyResult.pathImageFaceScan3D: pathImageFaceScan3D,
      if (clientSessionResult != null)
        ICEkycKeyResult.clientSessionResult: clientSessionResult,
    };
  }

  bool get isNotEmpty => cropParam != null || pathImageFrontFull != null || pathImageBackFull != null || pathImageFaceFull != null || pathImageFaceFarFull != null || pathImageFaceNearFull != null || pathImageFaceScan3D != null || clientSessionResult != null;

  bool get isEmpty => !isNotEmpty;
}

/// Data model for cancelled eKYC operation
class EkycCancelledData {
  /// The last screen that the user cancelled the eKYC operation
  /// 
  /// Uses unified EkycLastScreen enum format (based on iOS ScreenType)
  /// Automatically converts from Android format if needed
  final EkycLastScreen lastScreen;

  const EkycCancelledData({
    required this.lastScreen,
  });

  /// Parse from Map (from native JSON)
  /// Handles both iOS and Android formats
  factory EkycCancelledData.fromMap(Map<String, dynamic> map) {
    final lastScreenString = map['lastScreen'] as String?;
    return EkycCancelledData(
      lastScreen: EkycLastScreen.fromString(lastScreenString),
    );
  }

  /// Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'lastScreen': lastScreen.value,
    };
  }
}

