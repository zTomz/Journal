import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class Translator {
  static TranslateLanguage getDeviceLanguage(BuildContext context) {
    final localeLangCode = Localizations.localeOf(context).languageCode;
    if (localeLangCode == 'en') {
      return TranslateLanguage.english;
    } else if (localeLangCode == 'de') {
      return TranslateLanguage.german;
    } else if (localeLangCode == 'fr') {
      return TranslateLanguage.french;
    } else if (localeLangCode == 'es') {
      return TranslateLanguage.spanish;
    } else if (localeLangCode == 'it') {
      return TranslateLanguage.italian;
    } else if (localeLangCode == 'pt') {
      return TranslateLanguage.portuguese;
    } else if (localeLangCode == 'ru') {
      return TranslateLanguage.russian;
    } else if (localeLangCode == 'ja') {
      return TranslateLanguage.japanese;
    } else if (localeLangCode == 'ko') {
      return TranslateLanguage.korean;
    } else if (localeLangCode == 'zh') {
      return TranslateLanguage.chinese;
    } else if (localeLangCode == 'ar') {
      return TranslateLanguage.arabic;
    } else if (localeLangCode == 'hi') {
      return TranslateLanguage.hindi;
    } else if (localeLangCode == 'tr') {
      return TranslateLanguage.turkish;
    } else if (localeLangCode == 'pl') {
      return TranslateLanguage.polish;
    } else if (localeLangCode == 'nl') {
      return TranslateLanguage.dutch;
    } else if (localeLangCode == 'sv') {
      return TranslateLanguage.swedish;
    } else if (localeLangCode == 'uk') {
      return TranslateLanguage.ukrainian;
    } else if (localeLangCode == 'id') {
      return TranslateLanguage.indonesian;
    } else if (localeLangCode == 'th') {
      return TranslateLanguage.thai;
    } else if (localeLangCode == 'vi') {
      return TranslateLanguage.vietnamese;
    } else if (localeLangCode == 'ms') {
      return TranslateLanguage.malay;
    } else if (localeLangCode == 'bn') {
      return TranslateLanguage.bengali;
    } else if (localeLangCode == 'ta') {
      return TranslateLanguage.tamil;
    } else if (localeLangCode == 'gu') {
      return TranslateLanguage.gujarati;
    } else if (localeLangCode == 'mr') {
      return TranslateLanguage.marathi;
    } else if (localeLangCode == 'fa') {
      return TranslateLanguage.persian;
    }

    return TranslateLanguage.english;
  }

  static Future<String> translateText(BuildContext context, String text) async {
    final translator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: getDeviceLanguage(context),
    );
    final modelManager = OnDeviceTranslatorModelManager();

    if (await modelManager.isModelDownloaded(
          getDeviceLanguage(context).bcpCode,
        ) &&
        context.mounted) {
      await modelManager.downloadModel(
        getDeviceLanguage(context).bcpCode,
      );
    }

    return await translator.translateText(text);
  }
}
