import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

// --- PALET WARNA LIGHT MODE ---
const kPrimaryColor = Color(0xFF005A9C); 
const kSecondaryColor = Color(0xFF00C896); 
const kBackgroundColor = Color(0xFFF8F9FA);
const kTextColorDark = Color(0xFF333333);
const kTextColorLight = Color(0xFF666666);

// --- PALET WARNA DARK MODE (BARU) ---
const kDarkBackgroundColor = Color(0xFF1E1E1E); 
const kDarkCardColor = Color(0xFF2C2C2C); 
const kDarkTextColor = Color(0xFFF5F5F5);


void main() {
  runApp(
    GetMaterialApp(
      title: "Aplikasi Event Kampus",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,

  
      themeMode: ThemeMode.system,

      // --- TEMA LIGHT MODE (YANG SUDAH ADA) ---
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        brightness: Brightness.light, // Menandakan ini Light Theme
        colorScheme: const ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          background: kBackgroundColor,
          onBackground: kTextColorDark,
          surface: Colors.white, // Warna Card
          onError: Colors.redAccent,
        ),
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headlineLarge: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 24, color: kTextColorDark),
          headlineSmall: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 18, color: kTextColorDark),
          bodyMedium: GoogleFonts.poppins(
              fontSize: 14, color: kTextColorLight, height: 1.5),
          labelLarge: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kBackgroundColor,
          foregroundColor: kPrimaryColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        ),
        // --- PERBAIKAN DI SINI ---
        cardTheme: CardThemeData(
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.1),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        // -------------------------
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          hintStyle:
              GoogleFonts.poppins(color: kTextColorLight.withOpacity(0.7)),
        ),
      ),

      // --- TEMA DARK MODE (BARU) ---
      darkTheme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColor: kPrimaryColor, // Warna brand tetap sama
        scaffoldBackgroundColor: kDarkBackgroundColor,
        brightness: Brightness.dark, // Menandakan ini Dark Theme
        colorScheme: const ColorScheme.dark(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          background: kDarkBackgroundColor,
          onBackground: kDarkTextColor,
          surface: kDarkCardColor, // Warna Card di dark mode
          onError: Colors.redAccent,
        ),
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headlineLarge: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 24, color: kDarkTextColor),
          headlineSmall: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 18, color: kDarkTextColor),
          bodyMedium: GoogleFonts.poppins(
              fontSize: 14, color: kDarkTextColor.withOpacity(0.8), height: 1.5),
          labelLarge: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kDarkBackgroundColor,
          foregroundColor: kDarkTextColor, // Teks & Ikon jadi terang
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: kDarkTextColor,
          ),
        ),
        // --- PERBAIKAN DI SINI ---
        cardTheme: CardThemeData(
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.3),
          color: kDarkCardColor, // Warna Card gelap
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        // -------------------------
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: kDarkCardColor, // Warna input gelap
          hintStyle:
              GoogleFonts.poppins(color: kDarkTextColor.withOpacity(0.5)),
        ),
      ),
      // ------------------------------
    ),
  );
}