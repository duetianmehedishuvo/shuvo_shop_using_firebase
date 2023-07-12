import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shuvo_shop_test/provider/auth_provider.dart';
import 'package:shuvo_shop_test/widgets/import_all_files.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCWj6Wz2D1Ad0JZS4GtrSRbDVSs2b88gaU",
      appId: "1:454936401333:android:783292c4c3e1c0e90e35fc",
      messagingSenderId: "454936401333",
      projectId: "shuvo-shop-test",
      storageBucket: "shuvo-shop-test.appspot.com",
    ),
  );

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shuvo Shop',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, bottomAppBarColor: kBlackColorLight),
      routes: allRouters,
      initialRoute: LauncherScreen.route,
      // home: const LauncherScreen(),
    );
  }
}
