import 'package:flutter/material.dart';
import 'package:flutter_plugin_ic_ekyc/ekyc/ekyc.dart';
import 'package:flutter_plugin_ic_ekyc/ekyc/services/ekyc_presentation.dart';
import 'package:flutter_plugin_ic_ekyc/ekyc/services/enum_ekyc.dart';
import 'package:flutter_plugin_ic_ekyc/ekyc/services/ekyc_response.dart';
import 'package:flutter_plugin_ic_ekyc_example/view/log_screen.dart';
import 'package:flutter_plugin_ic_ekyc_example/view/setting_screen.dart';

import '../service/shared_preference.dart';

class EkycScreen extends StatefulWidget {
  const EkycScreen({super.key});

  @override
  State<EkycScreen> createState() => _EkycScreenState();
}

class _EkycScreenState extends State<EkycScreen> {
  // You can source these from secure storage/config later per your environment
  late final String _accessToken;
  late final String _tokenId;
  late final String _tokenKey;
  late final String _baseUrl;
  final TextEditingController _hashFrontOcrController = TextEditingController();
  LanguageSdk _languageSdk = LanguageSdk.icekyc_vi;
  @override
  void initState() {
    super.initState();
    _accessToken = SharedPreferenceService.instance.getString(SharedPreferenceKeys.accessToken);
    _tokenId = SharedPreferenceService.instance.getString(SharedPreferenceKeys.tokenId);
    _tokenKey = SharedPreferenceService.instance.getString(SharedPreferenceKeys.tokenKey);
    _baseUrl = SharedPreferenceService.instance.getString(SharedPreferenceKeys.baseUrl);
    _languageSdk = SharedPreferenceService.instance.getBool(SharedPreferenceKeys.isViLanguageMode, defaultValue: true) ? LanguageSdk.icekyc_vi : LanguageSdk.icekyc_en;
  }

  @override
  void dispose() {
    _hashFrontOcrController.dispose();
    super.dispose();
  }

  void _navigateToLog(EkycResponse response) {
    // Convert EkycResponse to Map for LogScreen
    final resultData = response.successData;
    if (resultData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LogScreen(resultData: resultData),
        ),
      );
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('eKYC'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingScreen()),
              );
            },
            tooltip: 'Cài đặt',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hash Input Section
              _buildHashInputSection(),
              const SizedBox(height: 24),
              // Action Buttons
              _buildActionButton(
                icon: Icons.verified_user,
                title: 'eKYC luồng đầy đủ',
                description: 'Thực hiện toàn bộ quy trình xác thực',
                onPressed: () => _handleFullEkyc(),
              ),
              const SizedBox(height: 12),
              _buildActionButton(
                icon: Icons.document_scanner,
                title: 'Thực hiện OCR giấy tờ',
                description: 'Quét và nhận dạng thông tin từ giấy tờ',
                onPressed: () => _handleOcrOnly(),
              ),
              const SizedBox(height: 12),
              _buildActionButton(
                icon: Icons.credit_card,
                title: 'OCR chỉ mặt trước',
                description: 'Quét mặt trước của giấy tờ',
                onPressed: () => _handleOcrFront(),
              ),
              const SizedBox(height: 12),
              _buildActionButton(
                icon: Icons.credit_card,
                title: 'OCR chỉ mặt sau',
                description: 'Quét mặt sau của giấy tờ',
                onPressed: () => _handleOcrBack(),
              ),
              const SizedBox(height: 12),
              _buildActionButton(
                icon: Icons.face,
                title: 'Kiểm tra khuôn mặt',
                description: 'Xác thực khuôn mặt với ảnh giấy tờ',
                onPressed: () => _handleFaceVerification(),
              ),
              const SizedBox(height: 12),
              _buildActionButton(
                icon: Icons.qr_code_scanner,
                title: 'Quét QR code',
                description: 'Quét mã QR từ giấy tờ',
                onPressed: () => _handleScanQRCode(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHashInputSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Hash Image Front (Tùy chọn)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _hashFrontOcrController,
              decoration: const InputDecoration(
                labelText: 'Hash image front from OCR front result',
                hintText: 'Nhập hash từ kết quả OCR mặt trước',
                helperText: 'Cần thiết cho OCR mặt sau và Face Verification',
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onPressed,
  }) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleFullEkyc() async {
    final config = ICEkycPresets.fullEkyc(
      accessToken: _accessToken,
      tokenId: _tokenId,
      tokenKey: _tokenKey,
      languageSdk: _languageSdk,
    );
    
    final response = await ICEkyc.instance.startEkycFull(config);
    
    if (response.isSuccess) {
      // Xử lý data thành công
      final data = response.successData;
      print("Đường dẫn ảnh trước: ${data?.pathImageFrontFull}");
      _navigateToLog(response);
    } else if (response.isCancelled) {
      // User thoát màn hình
      final lastScreen = response.cancelledData?.lastScreen;
      _showError("Người dùng đã hủy ở màn hình: ${lastScreen?.value ?? 'unknown'}");
    } else {
      // Lỗi hệ thống
      final errorMessage = response.errorData?['message'] ?? 'Lỗi không xác định';
      _showError(errorMessage);
    }
  }

  Future<void> _handleOcrOnly() async {
    final config = ICEkycPresets.ocrOnly(
      accessToken: _accessToken,
      tokenId: _tokenId,
      tokenKey: _tokenKey,
      languageSdk: _languageSdk,
    );
    
    final response = await ICEkyc.instance.startEkycOcr(config);
    
    if (response.isSuccess) {
      _navigateToLog(response);
    } else if (response.isCancelled) {
      final lastScreen = response.cancelledData?.lastScreen;
      _showError("Người dùng đã hủy ở màn hình: ${lastScreen?.value ?? 'unknown'}");
    } else {
      final errorMessage = response.errorData?['message'] ?? response.errorData?['error'] ?? 'Lỗi không xác định';
      _showError(errorMessage);
    }
  }

  Future<void> _handleOcrFront() async {
    final config = ICEkycPresets.ocrFront(
      accessToken: _accessToken,
      tokenId: _tokenId,
      tokenKey: _tokenKey,
      languageSdk: _languageSdk,
    );
    
    final response = await ICEkyc.instance.startEkycOcrFront(config);
    
    if (response.isSuccess) {
      _navigateToLog(response);
    } else if (response.isCancelled) {
      final lastScreen = response.cancelledData?.lastScreen;
      _showError("Người dùng đã hủy ở màn hình: ${lastScreen?.value ?? 'unknown'}");
    } else {
      final errorMessage = response.errorData?['message'] ?? 'Lỗi không xác định';
      _showError(errorMessage);
    }
  }

  Future<void> _handleOcrBack() async {
    final config = ICEkycPresets.ocrBack(
      accessToken: _accessToken,
      tokenId: _tokenId,
      tokenKey: _tokenKey,
      hashFrontOcr: _hashFrontOcrController.text,
      languageSdk: _languageSdk,
    );
    
    final response = await ICEkyc.instance.startEkycOcrBack(config);
    
    if (response.isSuccess) {
      _navigateToLog(response);
    } else if (response.isCancelled) {
      final lastScreen = response.cancelledData?.lastScreen;
      _showError("Người dùng đã hủy ở màn hình: ${lastScreen?.value ?? 'unknown'}");
    } else {
      final errorMessage = response.errorData?['message'] ?? 'Lỗi không xác định';
      _showError(errorMessage);
    }
  }

  Future<void> _handleFaceVerification() async {
    final config = ICEkycPresets.faceVerification(
      accessToken: _accessToken,
      tokenId: _tokenId,
      tokenKey: _tokenKey,
      languageSdk: _languageSdk,
    );
    
    final response = await ICEkyc.instance.startEkycFace(config);
    
    if (response.isSuccess) {
      _navigateToLog(response);
    } else if (response.isCancelled) {
      final lastScreen = response.cancelledData?.lastScreen;
      _showError("Người dùng đã hủy ở màn hình: ${lastScreen?.value ?? 'unknown'}");
    } else {
      final errorMessage = response.errorData?['message'] ?? 'Lỗi không xác định';
      _showError(errorMessage);
    }
  }

  Future<void> _handleScanQRCode() async {
    final config = ICEkycPresets.scanQRCode(
      accessToken: _accessToken,
      tokenId: _tokenId,
      tokenKey: _tokenKey,
      languageSdk: _languageSdk,
    );
    
    final response = await ICEkyc.instance.startEkycScanQRCode(config);
    
    if (response.isSuccess) {
      _navigateToLog(response);
    } else if (response.isCancelled) {
      final lastScreen = response.cancelledData?.lastScreen;
      _showError("Người dùng đã hủy ở màn hình: ${lastScreen?.value ?? 'unknown'}");
    } else {
      final errorMessage = response.errorData?['message'] ?? 'Lỗi không xác định';
      _showError(errorMessage);
    }
  }
}
