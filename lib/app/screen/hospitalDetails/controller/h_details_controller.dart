import 'dart:convert';

import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/app/screen/hospitalDetails/model/Clinic_details_res.dart'
    as ClinicDetails;
import 'package:locume/app/screen/hospitalDetails/model/Hosptial_details_res.dart';

class HDetailsController extends GetxController {
  final int? hospitalId;
  final bool? isClinic;
  HDetailsController(this.hospitalId, this.isClinic);

  @override
  void onInit() {
    super.onInit();
    if (hospitalId != null && isClinic == false) {
      getHospitalDetails(hospitalId ?? 0);
    }
    if (isClinic == true) {
      getClinicDetails(hospitalId ?? 0);
    }
  }

  var doctorList = <Map<String, String>>[
    {
      "image":
          "https://locumedocument.s3.ap-south-1.amazonaws.com/1740660643574profile_image.jpg",
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
  ].obs;

  Rx<List<Result>> hospital_data = Rx<List<Result>>([]);
  Rx<List<ClinicDetails.Result>> clinic_data =
      Rx<List<ClinicDetails.Result>>([]);
  RxInt rating = 4.obs;
  List<String> Speciality = [
    "Emergency Med",
    "Anesthesiology",
    "Cardiology",
    "Endocrinology",
    "Gastroenterology",
    "Nephrology",
    "Dermatology",
    "Medical oncology",
    "Primary care",
  ];

  getHospitalDetails(int hospitalId) async {
    final response =
        await ApiProvider.post("/api/hospital/getSingleHospital", head: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
    }, data: {
      "hospitalId": hospitalId
    });
    final map = jsonDecode(response.body);
    print(map);
    HospitalDetailsRes res = HospitalDetailsRes.fromJson(map);
    if (res.status == 200) {
      hospital_data.value = res.result ?? [];
    }
  }

  getClinicDetails(int clinicId) async {
    final response =
        await ApiProvider.post("/api/clinic/getSingleClinic", head: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
    }, data: {
      "clinicId": clinicId
    });
    final map = jsonDecode(response.body);
    print(map);
    ClinicDetails.ClinicDetails res = ClinicDetails.ClinicDetails.fromJson(map);
    if (res.status == 200) {
      clinic_data.value = res.result ?? [];
    }
  }
}
