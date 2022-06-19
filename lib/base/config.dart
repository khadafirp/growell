import 'package:flutter/services.dart';

class Config {
  static const baseUrlConst = 'baseUrl';
  static const debuggableConst = 'debuggable';
  static const clientIdConst = 'clientId';
  static const clientVersionConst = 'clientVersion';
  static const deviceIdConst = 'deviceId';
  static const packageIdConst = 'packageId';
  static const versionCodeConst = 'versionCode';
  static const primaryCertificateConst = 'PRIMARY_CER';
  static const backupCertificateConst = 'BACKUP_CER';

  static Map<String, dynamic>? _config;
  // static String _firebaseToken;

  static void setConfig(
    String baseUrl,
    bool isDebug,
    String clientId,
    String clientVersion,
    String deviceId,
    String packageId,
    ByteData primaryCer,
    ByteData backupCer,
    String versionCode,
    String amplitudeKey,
  ) {
    final config = {
      baseUrlConst: baseUrl,
      debuggableConst: isDebug,
      clientIdConst: clientId,
      clientVersionConst: clientVersion,
      deviceIdConst: deviceId,
      packageIdConst: packageId,
      primaryCertificateConst: primaryCer,
      backupCertificateConst: backupCer,
      versionCodeConst: versionCode
    };
    _config = config;
  }

  // static void setFirebaseToken(String firebaseToken) {
  //   _firebaseToken = firebaseToken;
  // }

  static bool isDebuggable() => _config?[debuggableConst];

  static String getBaseUrl() => _config?[baseUrlConst];

  static String getClientId() => _config?[clientIdConst];

  static String getVersion() => _config?[clientVersionConst];

  static String getVersionCode() => _config?[versionCodeConst];

  static String getDeviceId() => _config?[deviceIdConst];

  static String getPackageId() => _config?[packageIdConst];

  static ByteData getPrimaryCertificate() => _config?[primaryCertificateConst];

  static ByteData getBackupCertificate() => _config?[backupCertificateConst];


}
