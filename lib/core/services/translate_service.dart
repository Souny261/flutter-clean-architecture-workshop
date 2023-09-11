import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final localeProvider = StateNotifierProvider<LocaleState, Locale>((ref) {
  return LocaleState();
});

class LocaleState extends StateNotifier<Locale> {
  LocaleState() : super(const Locale('en')) {
    setLocale(const Locale('lo'));
  }
  void setLocale(Locale locale) async {
    state = locale;
  }
}

AppLocalizations translate(BuildContext context) {
  return AppLocalizations.of(context)!;
}
