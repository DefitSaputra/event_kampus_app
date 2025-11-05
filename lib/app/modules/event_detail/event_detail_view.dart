import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:event_kampus_app/main.dart'; // Import main.dart untuk warna

import 'event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Kita tidak pakai AppBar, kita pakai CustomScrollView
      // untuk membuat efek collapsing header
      body: Obx(() {
        if (controller.event.value == null) {
          return _buildErrorState(context);
        }

        final event = controller.event.value!;
        
        return CustomScrollView(
          slivers: [
            // --- AppBar yang bisa collapse ---
            SliverAppBar(
              expandedHeight: 250.0, // Tinggi gambar saat full
              floating: false,
              pinned: true, // Tetap ada saat di-scroll ke atas
              backgroundColor: kPrimaryColor,
              iconTheme: const IconThemeData(color: Colors.white),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  event.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                background: Image.network(
                  event.imageUrl,
                  fit: BoxFit.cover,
                  // Efek gelap agar judul terbaca
                  color: Colors.black.withOpacity(0.4),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
            
            // --- Konten Halaman ---
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Info Tanggal & Lokasi
                    _buildInfoCard(context, event),
                    
                    const Divider(height: 40, thickness: 1),
                    
                    // Deskripsi
                    Text(
                      'Deskripsi Event',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      event.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 50), // Spasi di bawah
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // Card untuk info Tanggal & Lokasi
  Widget _buildInfoCard(BuildContext context, event) {
    return Card(
      elevation: 0,
      color: kPrimaryColor.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: kPrimaryColor.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(
              context,
              Icons.calendar_today_rounded,
              'Tanggal',
              event.date,
            ),
            const Divider(height: 24),
            _buildInfoRow(
              context,
              Icons.location_on_rounded,
              'Lokasi',
              event.location,
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk baris info (Icon + Judul + Isi)
  Widget _buildInfoRow(
      BuildContext context, IconData icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: kPrimaryColor, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: kTextColorLight,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Tampilan jika data error
  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 80, color: Colors.redAccent),
          const SizedBox(height: 16),
          Text(
            'Gagal memuat detail event.',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}