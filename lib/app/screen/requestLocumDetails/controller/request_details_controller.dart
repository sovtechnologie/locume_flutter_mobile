import 'dart:convert';

import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/app/screen/manage/model/RequestRaised_model.dart';

class RequestDetailsController extends GetxController {
  RxBool reqStatus = true.obs;
  RxBool isLoding = false.obs;
  RxBool ReqLoding = false.obs;
  RxBool ReqLodingR = false.obs;
  final int? id;
  RequestDetailsController(this.id);
  @override
  void onInit() {
    super.onInit();
    // if (id != null) {
    //   getspecialdoctors(id ?? 0);
    // }
    getReqRaisedDetails(id ?? 0);
  }

  RxList<Result> requestRaisedDetails = <Result>[].obs;
  Future<void> getReqRaisedDetails(int idd, [bool showLoder = true]) async {
    try {
      if (showLoder) {
        isLoding.value = true;
      } // Start loading
      final response = await ApiProvider.post(
        "/api/bookings/getUserBookingData",
        head: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${Get.find<AuthProvider>().token}',
        },
        data: {
          "bookingId": 20,
          "status": 0,
        },
      );

      final map = jsonDecode(response.body);
      final res = RequestRaised.fromJson(map);

      if (res.status == 200) {
        requestRaisedDetails.value = res.result ?? [];
        reqStatus.value = res.result![0].isActive ?? false;
      } else {
        // Handle API failure scenario
        print("Error: ${res.message ?? 'Something went wrong'}");
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      isLoding.value = false; // Ensure loading stops
    }
  }

  Future<void> ActiveOrDeactiveReq(
      bool status, int userid, int bookingId) async {
    try {
      ReqLoding.value = true; // Start loading
      final response = await ApiProvider.put(
        "/api/bookings/updateBookings",
        head: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${Get.find<AuthProvider>().token}',
        },
        data: {"bookingId": bookingId, "isActive": status},
      );

      final map = jsonDecode(response.body);
      print(map);

      if (map['status'] == 200) {
        reqStatus.value = !status;
        getReqRaisedDetails(id ?? 0, false);
      } else {
        // Handle API failure scenario
        print("Error: ${map["message"] ?? 'Something went wrong'}");
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      ReqLoding.value = false; // Ensure loading stops
    }
  }

  Future<void> changeLocumStatus(int bookingId, int userID, int status) async {
    try {
      if (status == 2) {
        ReqLodingR.value = true; // Start loading
      } else {
        ReqLoding.value = true;
      } // Start loading
      final response = await ApiProvider.post(
        "/api/bookings/changeLocumeStatus",
        head: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${Get.find<AuthProvider>().token}',
        },
        data: {"bookingId": bookingId, "userId": userID, "status": status},
      );

      final map = jsonDecode(response.body);
      print(map);

      if (map['status'] == 200) {
        getReqRaisedDetails(id ?? 0, false);
      } else {
        // Handle API failure scenario
        print("Error: ${map["message"] ?? 'Something went wrong'}");
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      ReqLoding.value = false;
      ReqLodingR.value = false; // Ensure loading stops
    }
  }

  Future<void> accepetORrejecteReq(int bookingId, int status) async {
    try {
      if (status == 2) {
        ReqLodingR.value = true; // Start loading
      } else {
        ReqLoding.value = true;
      } // Start loading
      final response = await ApiProvider.post(
        "/api/bookings/acceptOrRejectBooking",
        head: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${Get.find<AuthProvider>().token}',
        },
        data: {"bookingId": bookingId, "status": status},
      );

      final map = jsonDecode(response.body);
      print(map);

      if (map['status'] == 200) {
        getReqRaisedDetails(id ?? 0, false);
      } else {
        // Handle API failure scenario
        print("Error: ${map["message"] ?? 'Something went wrong'}");
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      ReqLoding.value = false;
      ReqLodingR.value = false; // Ensure loading stops
    }
  }

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
  RxInt currentIndex = 0.obs;
  RxList<String> imageUrls = <String>[
    'https://locumedocument.s3.ap-south-1.amazonaws.com/1741586110601Hospital.jpg',
    'https://locumedocument.s3.ap-south-1.amazonaws.com/1741586110601Hospital.jpg',
    'https://locumedocument.s3.ap-south-1.amazonaws.com/1741586110601Hospital.jpg',
  ].obs;
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
