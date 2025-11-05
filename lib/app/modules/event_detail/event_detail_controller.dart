import 'package:get/get.dart';
import '../../data/models/event_model.dart';

class EventDetailController extends GetxController {
  // Siapkan variabel untuk menampung data event yang dikirim
  // Gunakan Rxn (Rx Nullable) agar bisa bernilai null awalnya
  final Rxn<Event> event = Rxn<Event>();

  @override
  void onInit() {
    super.onInit();
    // Ambil data event yang dikirim dari halaman Home
    // melalui 'arguments'
    var eventData = Get.arguments;

    // Pastikan data yang dikirim adalah tipe Event
    if (eventData is Event) {
      event.value = eventData;
    }
  }
}