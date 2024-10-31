import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/widget/custom_textField.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact us"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              "assets/about_bg.png",
              width: double.infinity,
              fit: BoxFit.cover, // Ensure the image covers the specified height
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10), // Add spacing between texts
                  // Add spacing between texts
                  const Text(
                    "Be a part of the future of work. Boost your career with global clients, ambitious projects and the freedom of working remotely.",
                    overflow: TextOverflow.visible,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Remote. Proven. Ready.",
                    style: TextStyle(color: primaryColor.withOpacity(0.50)),
                  ),
                  SizedBox(height: 40), // Add spacing before the button
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: buildCustomTextFieldWithButton(
                        hintText: "Enter your email",
                        buttonText: "Send Now",
                        onPressed: () {},
                        primaryColor: primaryColor,
                        textColor: white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: HexColor("#F8F8FF"),
                    border: Border.all(width: 1, color: primaryColor),
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    Text(
                      "Contact information",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    buildContactInfoBox(
                      icon: Icons.call,
                      title: "Phone Number",
                      phoneNumber: "+91 8879881815 / +91 7738311925",
                    ),
                    buildContactInfoBox(
                        icon: Icons.location_pin,
                        title: "Our location",
                        phoneNumber:
                            "Shop No 2, Vishwakarma Opposite Om Surya apartment Sawarkar Nagar Thane West, Maharashtra ,400606"),
                    buildContactInfoBox(
                        icon: Icons.email,
                        title: "Our Email",
                        phoneNumber: "info@locum.com"),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Get in touch with us",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "First Name",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Last Name",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Your Email",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 100,
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText: "Your Message",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text("SEND MESSAGE"))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
                width: double.maxFinite,
                decoration: BoxDecoration(color: primaryColor),
                child: Column(
                  children: [
                    Image.asset("assets/fotter.png"),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Join our talent community.",
                            style: TextStyle(
                                fontSize: 24,
                                color: white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Join our global talent community to receive alerts when new life-changing opportunities become available.",
                            overflow: TextOverflow.visible,
                            style: TextStyle(color: white, height: 1.5),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      HexColor("#033B61"))),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.login),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Sign in",
                                    style: TextStyle(color: white),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 100,
            )
          ]),
        ));
  }
}

Widget buildContactInfoBox({
  required IconData icon,
  required String title,
  required String phoneNumber,
}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Icon(
              icon,
              size: 50,
              color: primaryColor,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            phoneNumber,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget buildCustomTextFieldWithButton({
  required String hintText,
  required String buttonText,
  required VoidCallback onPressed,
  required Color primaryColor,
  required Color textColor,
}) {
  return SizedBox(
    height: 50,
    child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                ),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                ),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                ),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
              backgroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
            ),
            onPressed: onPressed,
            child: Row(
              children: [
                Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(Icons.arrow_forward)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
