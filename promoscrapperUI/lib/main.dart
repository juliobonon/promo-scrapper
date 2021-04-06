import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:promoscrapperUI/providers/product_provider.dart';
import 'package:promoscrapperUI/wrapper.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth>(
          create: (_) => Auth(),
        ),
        Provider(
          create: (_) => ProductProvider(),
        ),
        StreamProvider(
          create: (context) => context.read<Auth>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: AuthWrapper(),
      ),
    );
  }
}
