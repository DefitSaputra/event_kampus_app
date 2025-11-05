import 'package:flutter/material.dart';
// PERBAIKAN: Mengganti 'event_kampus_app_final' menjadi 'event_kampus_app'
import 'package:event_kampus_app/main.dart'; 
import '../data/models/event_model.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageBanner(context),
            _buildTextContent(context),
          ],
        ),
      ),
    );
  }

  // Widget ini yang menampilkan gambar
  Widget _buildImageBanner(BuildContext context) {
    return Stack(
      children: [
        // --- INI BAGIAN PENTINGNYA ---
        // Widget ini mengambil URL dari 'event.imageUrl'
        // dan menampilkannya sebagai gambar.
        Image.network(
          event.imageUrl, // <-- DATA DARI LANGKAH 2
          width: double.infinity,
          height: 150,
          fit: BoxFit.cover,
          // Ini adalah fallback jika gambar gagal dimuat
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: double.infinity,
              height: 150,
              color: Colors.grey[200],
              child: const Icon(
                Icons.image_not_supported_rounded,
                color: kTextColorLight, // kTextColorLight dari main.dart
                size: 50,
              ),
            );
          },
        ),
        // ---------------------------------

        // Badge Tanggal
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: kSecondaryColor, // kSecondaryColor dari main.dart
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  // PERBAIKAN: Menghilangkan deprecated warning
                  color: const Color.fromRGBO(0, 0, 0, 0.2), 
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              event.date,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget ini menampilkan teks (tidak berubah)
  Widget _buildTextContent(BuildContext context) {
    final bodyMediumColor = Theme.of(context).textTheme.bodyMedium?.color;
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.title,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on_rounded,
                  size: 16, color: kPrimaryColor), // kPrimaryColor dari main.dart
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  event.location,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        // PERBAIKAN: Menghilangkan deprecated warning
                        color: bodyMediumColor?.withAlpha((255 * 0.7).round()),
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}