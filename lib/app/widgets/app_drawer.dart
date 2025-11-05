import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:event_kampus_app/main.dart'; // Import main.dart untuk warna

import '../routes/app_pages.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengetahui rute saat ini untuk highlight
    final String currentRoute = Get.currentRoute;

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              // Gradient modern
              gradient: LinearGradient(
                colors: [
                  kPrimaryColor,
                  kPrimaryColor.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Icon(Icons.school, color: Colors.white, size: 40),
                  SizedBox(width: 16),
                  Text(
                    'Event Kampus',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  icon: Icons.home_rounded,
                  title: 'Home (Daftar Event)',
                  route: Routes.HOME,
                  currentRoute: currentRoute,
                  onTap: () => Get.offAllNamed(Routes.HOME),
                ),
                _buildDrawerItem(
                  icon: Icons.calendar_today_rounded,
                  title: 'Agenda Minggu Ini',
                  route: Routes.AGENDA,
                  currentRoute: currentRoute,
                  onTap: () => Get.toNamed(Routes.AGENDA),
                ),
                _buildDrawerItem(
                  icon: Icons.people_alt_rounded,
                  title: 'Panitia & Kontak',
                  route: Routes.CONTACT,
                  currentRoute: currentRoute,
                  onTap: () => Get.toNamed(Routes.CONTACT),
                ),
                _buildDrawerItem(
                  icon: Icons.info_outline_rounded,
                  title: 'Tentang Aplikasi',
                  route: Routes.ABOUT,
                  currentRoute: currentRoute,
                  onTap: () => Get.toNamed(Routes.ABOUT),
                ),
                const Divider(height: 20, indent: 16, endIndent: 16),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: kTextColorLight),
                  title: const Text('Tutup Menu'),
                  onTap: () => Get.back(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper untuk item drawer agar bisa di-highlight
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required String route,
    required String currentRoute,
    required VoidCallback onTap,
  }) {
    final bool isSelected = (currentRoute == route);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? kPrimaryColor.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? kPrimaryColor : kTextColorLight),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? kPrimaryColor : kTextColorDark,
          ),
        ),
        onTap: () {
          Get.back(); // Tutup drawer
          onTap(); // Pindah halaman
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}