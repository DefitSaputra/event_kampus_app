import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:event_kampus_app/main.dart'; // Import main.dart untuk warna

import '../../widgets/app_drawer.dart';
import 'about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.info_outline_rounded,
                  size: 80, color: kPrimaryColor), // Warna diubah
              const SizedBox(height: 20),
              Text(
                'Aplikasi Event Kampus',
                style: Theme.of(Get.context!).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Versi 1.0.0\n\nDibuat sebagai contoh implementasi Flutter dengan GetX state management dan navigation.',
                style: Theme.of(Get.context!).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Text(
                '© 2025 - Mahasiswa Teknik Informatika',
                style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
                      color: kTextColorLight.withOpacity(0.7),
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}