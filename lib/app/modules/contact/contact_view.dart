import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:event_kampus_app/main.dart'; // Import main.dart untuk warna

import '../../widgets/app_drawer.dart';
import 'contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panitia & Kontak'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.people_alt_rounded,
                size: 80, color: kPrimaryColor), // Warna diubah
            const SizedBox(height: 20),
            Text(
              'Halaman Panitia & Kontak',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Ini adalah halaman untuk menampilkan informasi kontak panitia penyelenggara event di kampus.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const Divider(height: 40),
            // Card untuk kontak
            Card(
              elevation: 0,
              color: kPrimaryColor.withOpacity(0.05),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.email_rounded, color: kPrimaryColor),
                      title: const Text('Email Panitia'),
                      subtitle: const Text('event@kampus.ac.id'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.phone_rounded, color: kPrimaryColor),
                      title: const Text('Hotline (WA)'),
                      subtitle: const Text('0812-3456-7890'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}