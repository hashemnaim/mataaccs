import 'package:get/get.dart';
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_speech/google_speech.dart';
import 'package:metacces/app_controller.dart';
import 'package:rxdart/rxdart.dart';

class AppController extends GetxController {
  RxInt selectedIndexOperation = 2.obs;

  String stringVoice =
      ' mate X Texas taxes Taxi attack metaxas metaxas metaxas Nita ads metaxas BDubs your Texas ataxia in Texas my text bedecked modexus my text read text my Texas the deck modexus Mythic in Texas Metaxa Detective my dad medaccess metaxas my dad medacta mid-deck midday Mythic methacton modexus midday Maddox modexus midday Texas modexus Meet Nita Abscess Texas. Metaxas. Metastasis. Texas';
  String stopVoice = "Close Clos Lost Closes closed Lowe's";
  // final RecorderStream recorder = RecorderStream();
  List<String> listName = [
    "home",
    "account",
    "report",
    "qoustion",
    "play",
    "wallet",
    "done",
    "report",
  ];
  bool recognizing = false;
  bool recognizeFinished = false;
  RxBool showMenuCard = false.obs;

  RxString text = ''.obs;
  StreamSubscription<List<int>>? _audioStreamSubscription;
  BehaviorSubject<List<int>>? _audioStream;

  void streamingRecognize() async {
    // await recorder.initialize();
    // _audioStream = BehaviorSubject<List<int>>();

    // _audioStreamSubscription = recorder.audioStream.listen((event) {
    //   _audioStream!.add(event);
    // });
    // await recorder.start();

    recognizing = true;

    final serviceAccount = ServiceAccount.fromString(
        (await rootBundle.loadString('assets/test_service_account.json')));
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
    final config = _getConfig();

    final responseStream = speechToText.streamingRecognize(
        StreamingRecognitionConfig(config: config, interimResults: true),
        _audioStream!);

    var responseText = '';

    responseStream.listen((data) {
      final currentText =
          data.results.map((e) => e.alternatives.first.transcript).join('\n');

      if (data.results.first.isFinal) {
        log('currentText $currentText');
        if (currentText.contains('.')) {
          responseText += '\n' + currentText.replaceAll('.', '');
        } else {
          responseText += '\n' + currentText;
        }

        text.value = responseText;
        // log('dee ${text.split(' ').last}');
        // log('fiiiiiind ${stringVoice.split(' ').contains(text.split(' ').last)}');
        // log('text1 $text');
        if (stopVoice
            .toLowerCase()
            .split(' ')
            .contains(text.toLowerCase().split(' ').last)) {
          showMenuCard.value = false;
        }
        if (stringVoice
            .toLowerCase()
            .split(' ')
            .contains(text.toLowerCase().split(' ').last)) {
          showMenuCard.value = true;
        }

        recognizeFinished = true;
      } else {
        log('currentText $currentText');
        if (stopVoice
            .toLowerCase()
            .split(' ')
            .contains(text.toLowerCase().split(' ').last)) {
          showMenuCard.value = false;
        }
        if (currentText.contains('.')) {
          text.value = responseText + '\n' + currentText.replaceAll('.', '');
        } else {
          text.value = responseText + '\n' + currentText;
        }

        // log('text2 $text');
        // log('fiiiiiind ${stringVoice.split(' ').contains(text.split(' ').last)}');
        if (stringVoice
            .toLowerCase()
            .split(' ')
            .contains(text.toLowerCase().split(' ').last)) {
          showMenuCard.value = true;
        }
        recognizeFinished = true;
      }
    }, onDone: () {
      recognizing = false;
    });
    update(['Voice']);
  }

  void stopRecording() async {
    // await recorder.stop();
    await _audioStreamSubscription?.cancel();
    await _audioStream?.close();

    recognizing = false;
    update(['Voice']);
  }

  RecognitionConfig _getConfig() => RecognitionConfig(
      encoding: AudioEncoding.LINEAR16,
      model: RecognitionModel.basic,
      enableAutomaticPunctuation: true,
      sampleRateHertz: 16000,
      languageCode: 'en-US');

  /// Animation Circle
  int selectedIndexHome = -1;

  setSelectedIndexHome(int selectedIndexHome) {
    this.selectedIndexHome = selectedIndexHome;
    update();
  }
}
