import 'package:flutter/material.dart';
import 'package:event_kampus_app/main.dart'; // Import main.dart untuk warna
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
      // Card style sudah diatur di main.dart
      clipBehavior: Clip.antiAlias, // Untuk memotong gambar di sudut
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Gambar (Banner)
            _buildImageBanner(context),
            
            // Bagian Teks (Konten)
            _buildTextContent(context),
          ],
        ),
      ),
    );
  }

  // Widget untuk banner gambar dengan badge tanggal
  Widget _buildImageBanner(BuildContext context) {
    return Stack(
      children: [
        // Gambar Event
        Image.network(
          event.imageUrl,
          width: double.infinity,
          height: 150,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: double.infinity,
              height: 150,
              color: Colors.grey[200],
              child: const Icon(
                Icons.image_not_supported_rounded,
                color: kTextColorLight,
                size: 50,
              ),
            );
          },
        ),
        
        // Badge Tanggal
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: kSecondaryColor, // Warna aksen
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
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

  // Widget untuk konten teks (Judul & Lokasi)
  Widget _buildTextContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul Event
          Text(
            event.title,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          
          // Info Lokasi
          Row(
            children: [
              const Icon(Icons.location_on_rounded,
                  size: 16, color: kPrimaryColor),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  event.location,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: kTextColorLight,
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