import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'navigation_hub.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase (अपनी Supabase URL और Anon Key यहाँ डालें)
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );

  runApp(const PranjalMediaProApp());
}

class PranjalMediaProApp extends StatelessWidget {
  const PranjalMediaProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pranjal Media Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F0F), // Dark Charcoal / Black
        primaryColor: const Color(0xFFD4AF37), // Premium Gold Accent
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37),
          secondary: Color(0xFFC5A059),
          surface: Color(0xFF1A1A1A),
        ),
        fontFamily: 'Roboto',
      ),
      home: const NavigationHub(),
    );
  }
}
