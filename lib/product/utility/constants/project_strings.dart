// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

@immutable
final class ProjectStrings {
  const ProjectStrings._();

  static const String projectName = 'Vibe sevkiyat sistemi';
  static const String order = 'Sevkiyat';
  static const String orders = 'Sevkiyatlar';
  static const String shipment = 'Yükleme';
  static const String vss = 'VSS';
  static const String vibe = 'Vibe';
  static const String orderSystem = 'sevkiyat sistemi';
  static const String ok = 'Tamam';
  static const String cancel = 'İptal';
  static const String username = 'Kullanıcı Adı';
  static const String password = 'Şifre';
  static const String usernameEmptyError = 'Kullanıcı adı boş olamaz';
  static const String passwordEmptyError = 'Şifre boş olamaz';
  static const String login = 'Giriş yap';
  static const String logOut = 'Çıkış yap';
  static const String areYouSureForLogout = 'Çıkış yapmak istiyor musun?';
  static const String scanBarcodeFailed = 'Barkod taranamadı';
  static const String barcodeNotFound =
      'Barkod bulunamadı!\n Senkronizasyon yapıp tekrar deneyiniz';
  static const String barcodesDoNotMatch = 'Barkodlar uyuşmuyor';
  static const String barcodeMatched = 'Barkod tarandı';
  static const String removeBarcodeScanFiled = 'Barkod silinemedi';
  static const String removeBarcodeScanSuccess = 'Barkod silindi';
  static const String printWaybill = 'İrsaliye Yazdır';
  static const String barcodeLimit = 'Daha fazla barkod okutamazsınız';
  static const String somethingError = 'Bir hata oluştu';
  static const String deliveredBy = 'Teslim Eden';
  static const String recipient = 'Teslim Alan';
  static const String settings = 'Ayarlar';
  static const String synchronizeDatas = 'Verileri eşitle';
  static const String datasSynchronized = 'Veriler eşitlendi';
  static const String toManyRequest =
      'Çok fazla istek gönderiyorsunuz!.\n Lütfen bekleyin';
  static const String areYouSureForDeleteScan =
      'Taramayı silmek istediğinize emin misiniz?';
}
