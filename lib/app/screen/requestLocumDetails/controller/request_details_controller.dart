import 'package:get/get.dart';

class RequestDetailsController extends GetxController {
  var doctorList = <Map<String, String>>[
    {
      "image": "https://via.placeholder.com/100",
      "name": "Dr. Denies Martine",
      "md": "MBBS, MD",
      "work": "Cardiologist",
      "experience": "10",
      "location": "Apollo Hospital, West Ham",
      "id": "1",
    },
    {
      "image": "https://via.placeholder.com/100",
      "name": "Dr. John Doe",
      "md": "MBBS, MS",
      "work": "Neurologist",
      "experience": "15",
      "location": "City Hospital, New York",
      "id": "2",
    },
    {
      "image": "https://via.placeholder.com/100",
      "name": "Dr. Sarah Williams",
      "md": "MBBS, PhD",
      "work": "Dermatologist",
      "experience": "8",
      "location": "Sunrise Clinic, California",
      "id": "3",
    },
  ].obs; // RxList for reactivity
}
