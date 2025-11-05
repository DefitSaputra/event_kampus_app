import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:event_kampus_app/main.dart'; // Import main.dart untuk warna

import '../../routes/app_pages.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/event_card.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Kampus'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Selamat Datang
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang, Mahasiswa!",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: kPrimaryColor,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Temukan event terbaik di kampusmu",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          
          // Daftar Event
          Expanded(
            child: Obx(() {
              if (controller.eventList.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: kPrimaryColor),
                      SizedBox(height: 16),
                      Text('Memuat data event...'),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: controller.eventList.length,
                itemBuilder: (context, index) {
                  final event = controller.eventList[index];
                  return EventCard(
                    event: event,
                    onTap: () {
                      Get.toNamed(Routes.EVENT_DETAIL, arguments: event);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}