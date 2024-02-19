import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../core/data/db/hydrate.dart';
import '../../firebase_options.dart';
import '../class/bloc_observer.dart';
import 'dependency_injection.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: kDebugMode?  AndroidProvider.debug: AndroidProvider.playIntegrity,
    appleProvider: kDebugMode?  AppleProvider.appAttest: AppleProvider.appAttestWithDeviceCheckFallback,
  );
  await Hydrated.instance.initialize();
  Bloc.observer = AppBlocObserver();
  dependencyInjection();
}

///
/// com.google.firebase.appcheck.debug.internal.DebugAppCheckProvider(14671):
/// Enter this debug secret into the allow list in the
/// Firebase Console for your project: [8695faaa-b406-4bb3-8baa-96d82e668206]
