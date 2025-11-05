import 'package:get/get.dart';

import '../modules/about/about_binding.dart';
import '../modules/about/about_view.dart';
import '../modules/agenda/agenda_binding.dart';
import '../modules/agenda/agenda_view.dart';
import '../modules/contact/contact_binding.dart';
import '../modules/contact/contact_view.dart';
import '../modules/event_detail/event_detail_binding.dart';
import '../modules/event_detail/event_detail_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';

// Bagian ini mendefinisikan nama-nama rute
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // Rute awal saat aplikasi dibuka
  static const INITIAL = Routes.HOME;

  // Daftar semua halaman/rute yang ada di aplikasi
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAIL,
      page: () => const EventDetailView(),
      binding: EventDetailBinding(),
      transition: Transition.rightToLeft, // Animasi transisi
    ),
    GetPage(
      name: _Paths.AGENDA,
      page: () => const AgendaView(),
      binding: AgendaBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
  ];
}