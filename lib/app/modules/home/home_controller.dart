import 'package:get/get.dart';
import '../../data/models/event_model.dart';

class HomeController extends GetxController {
  // Membuat daftar event menjadi 'observable'
  // Artinya, jika data di list ini berubah, widget yang menggunakannya
  // (seperti Obx) akan otomatis di-update
  final RxList<Event> eventList = <Event>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Panggil fungsi untuk mengisi data event saat controller siap
    fetchEvents();
  }

  // Fungsi untuk mengisi data dummy
  void fetchEvents() {
    // Simulasi pengambilan data (misal dari API)
    // Di sini kita gunakan data statis/dummy
    var dummyEvents = [
      Event(
        id: '1',
        title: 'Seminar Nasional AI 2025',
        description:
            'Seminar membahas perkembangan terkini Artificial Intelligence dan dampaknya di berbagai industri. Menghadirkan pembicara ahli dari dalam dan luar negeri.',
        date: '20 Des 2025',
        location: 'Aula Rektorat Lt. 3',
        imageUrl: 'https://placehold.co/400x400/673AB7/FFFFFF?text=AI+2025',
      ),
      Event(
        id: '2',
        title: 'Bazar Buku & Pameran Karya Seni',
        description:
            'Temukan ribuan buku diskon dan nikmati pameran karya seni mahasiswa. Terbuka untuk umum!',
        date: '22-25 Des 2025',
        location: 'Gedung Serbaguna (GSG)',
        imageUrl:
            'https://placehold.co/400x400/E91E63/FFFFFF?text=Bazar+Buku',
      ),
      Event(
        id: '3',
        title: 'Workshop Mobile Dev (Flutter)',
        description:
            'Belajar membangun aplikasi cross-platform dengan Flutter dari dasar hingga studi kasus. Wajib diikuti oleh mahasiswa IT.',
        date: '28 Des 2025',
        location: 'Laboratorium Komputer F-TI',
        imageUrl:
            'https://placehold.co/400x400/03A9F4/FFFFFF?text=Flutter',
      ),
      Event(
        id: '4',
        title: 'Pekan Olahraga Mahasiswa (POM)',
        description:
            'Ajang kompetisi olahraga antar fakultas. Dukung fakultasmu! Cabang: Futsal, Basket, Voli, Badminton.',
        date: '2-7 Jan 2026',
        location: 'GOR Kampus',
        imageUrl:
            'https://placehold.co/400x400/4CAF50/FFFFFF?text=POM+2026',
      ),
    ];

    // Masukkan data dummy ke dalam eventList
    eventList.assignAll(dummyEvents);
  }
}