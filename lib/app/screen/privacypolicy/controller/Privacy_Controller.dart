import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyController extends GetxController {
  ScrollController scrollController = ScrollController();

// Define `data` as an observable list
  List<Map<String, String>> privacyPolicy = [
    {
      "title": "Introduction",
      "body":
          "This Privacy Policy explains how we collect, use, and share your information when you use our app. We value your privacy and are committed to protecting your personal data."
    },
    {
      "title": "Information We Collect",
      "body":
          "We collect information you provide directly, such as when you create an account, as well as information gathered automatically through your interactions with the app, such as usage data and device information."
    },
    {
      "title": "How We Use Your Information",
      "body":
          "We use your data to provide, maintain, and improve our services, for customer support, and to personalize your experience. We may also use it to communicate with you about updates or promotions."
    },
    {
      "title": "Data Sharing and Disclosure",
      "body":
          "We do not sell your personal information. We may share data with trusted third-party partners to enhance functionality, comply with legal obligations, or for business operations, under strict confidentiality agreements."
    },
    {
      "title": "Your Rights",
      "body":
          "You have the right to access, update, or delete your personal data at any time. Contact our support team if you wish to exercise these rights."
    },
    {
      "title": "Security",
      "body":
          "We implement appropriate technical and organizational measures to safeguard your personal information from unauthorized access, loss, or misuse."
    },
    {
      "title": "Changes to this Policy",
      "body":
          "We may update this Privacy Policy periodically to reflect changes in our practices. We encourage you to review this page regularly for the latest information."
    },
    {
      "title": "Contact Us",
      "body":
          "If you have any questions or concerns about our privacy practices, please contact us at support@yourapp.com."
    }
  ];
}
