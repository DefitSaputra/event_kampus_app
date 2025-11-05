import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:event_kampus_app/main.dart'; // Import main.dart untuk warna

import '../../widgets/app_drawer.dart';
import 'agenda_controller.dart';

class AgendaView extends GetView<AgendaController> {
  const AgendaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda Minggu Ini'),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_today_rounded,
                  size: 80, color: kPrimaryColor), // Warna diubah
              const SizedBox(height: 20),
              Text(
                'Halaman Agenda Minggu Ini',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Ini adalah halaman untuk menampilkan daftar agenda kegiatan yang akan datang dalam seminggu.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}