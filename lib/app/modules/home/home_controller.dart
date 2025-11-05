// File ini berada di: lib/app/modules/home/home_controller.dart
// PERBAIKAN ADA DI BARIS INI:
import 'package:get/get.dart';
import '../../data/models/event_model.dart';

class HomeController extends GetxController {
  final RxList<Event> eventList = <Event>[].obs;
  final RxBool isLoading = true.obs; // Tambahkan status loading

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  void fetchEvents() {
    isLoading.value = true;
    // Simulasi delay 1 detik
    Future.delayed(const Duration(seconds: 1), () {
      eventList.value = [
        Event(
          id: '1',
          title: 'Seminar Nasional AI 2025',
          description:
              'Seminar mendalam tentang masa depan Artificial Intelligence dan dampaknya pada industri. Menghadirkan pembicara ahli dari perusahaan teknologi terkemuka.',
          date: '10 Des 2025',
          location: 'Auditorium Utama, Gedung A',
          imageUrl: 'https://plus.unsplash.com/premium_photo-1683121710572-7723bd2e235d?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1032',
        ),
        Event(
          id: '2',
          title: 'Workshop Flutter: Build Apps Faster',
          description:
              'Workshop 2 hari penuh untuk mahasiswa yang ingin belajar membangun aplikasi mobile cross-platform dengan Flutter dan GetX.',
          date: '12 Des 2025',
          location: 'Lab Komputer, Gedung B Lt. 3',
          imageUrl: 'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870',
        ),
        Event(
          id: '3',
          title: 'Bazaar & Pensi "CampusVibe"',
          description:
              'Acara tahunan terbesar! Menampilkan bazaar makanan, clothing, dan pertunjukan musik dari band-band mahasiswa. Wajib datang!',
          date: '15 Des 2025',
          location: 'Lapangan Utama Kampus',
          imageUrl: 'https://plus.unsplash.com/premium_photo-1681494075589-0796795f9655?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=884',
        ),
        Event(
          id: '4',
          title: 'Lomba Debat Bahasa Inggris',
          description:
              'Asah kemampuan berpikir kritis dan public speaking Anda dalam Lomba Debat Bahasa Inggris tingkat universitas.',
          date: '17 Des 2025',
          location: 'Ruang Aula, Gedung C',
          imageUrl: 'https://plus.unsplash.com/premium_photo-1706546717624-b7b4aa9394c4?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870',
        ),
      ];
      isLoading.value = false; // Selesai loading
    });
  }
}