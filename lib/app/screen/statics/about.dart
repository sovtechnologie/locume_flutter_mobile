import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/widget/reusedwidget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/about_bg.png",
              width: double.infinity,
              // Set a specific height for the image
              fit: BoxFit.cover, // Ensure the image covers the specified height
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Us",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10), // Add spacing between texts
                  Text(
                    "Connecting care",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10), // Add spacing between texts
                  const Text(
                    "Make the best locum agencies compete to find your perfect locum jobs. Get offered real shifts, matched exactly to your needs, before you’ve shared your contact details 🎉",
                    overflow: TextOverflow.visible,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 40), // Add spacing before the button
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Register Now"),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: HexColor("#033B61")),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      "600+",
                      style: TextStyle(
                          color: HexColor("#3ABBF2"),
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Healthcare Specialists here to support",
                      style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "98%",
                      style: TextStyle(
                          color: HexColor("#3ABBF2"),
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "NHS Framework Rating Platinum status",
                      style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "95%+",
                      style: TextStyle(
                          color: HexColor("#3ABBF2"),
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Trusts working with us regularly",
                      style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset("assets/SVG.png"),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Our mission & vision",
                    style: TextStyle(
                        fontSize: 24,
                        color: primaryColor,
                        fontWeight: FontWeight.w800),
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          "To improve patient outcomes by connecting and supporting ",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: textColor,
                          height: 1.5),
                      children: const [
                        TextSpan(
                          text: "Healthcare Professionals ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Make this part bold
                          ),
                        ),
                        TextSpan(
                          text: "and",
                        ),
                        TextSpan(
                          text: " Organisations",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Make this part bold
                          ),
                        ),
                        TextSpan(
                          text:
                              " – helping ensure we can all access the right care at the right time – worldwide.",
                        ),
                      ],
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Contact Us"),
                    style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(primaryColor),
                        backgroundColor: WidgetStateProperty.all(white)),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(color: HexColor("#F8F8FF")),
              child: Column(
                children: [
                  Image.asset(
                    "assets/ab.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "People are at the heart of everything we do",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: primaryColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Our expert teams help seek out and support the Healthcare Professionals needed to take care of our health every day.",
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Everything we do centres on connecting people.",
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "We connect with Healthcare Professionals worldwide, connecting them with the Healthcare Organisations that need them, who connect them with their patients in order to provide excellent patient care.",
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "And every single connection matters.",
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text("Find out more"))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(color: primaryColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Why choose us",
                      style: TextStyle(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800),
                    ),
                    buildJobChoiceCard(
                      imagePath: "assets/c1.svg",
                      title: "Choice of jobs",
                      description:
                          "Twenty of the best locum agencies compete for you on Messly. You see what shifts they have upfront. More choice means higher rates, less travel and better rotas.",
                    ),
                    buildJobChoiceCard(
                      imagePath: "assets/c2.svg",
                      title: "Trusted agencies",
                      description:
                          "We've selected the best-rated, most reliable agencies. See ratings from doctors before you speak to them, so you only work with the best.",
                    ),
                    buildJobChoiceCard(
                      imagePath: "assets/c3.svg",
                      title: "Personalised to you",
                      description:
                          "Set your locum wishlist on Messly, and only see jobs matched exactly to your needs. No spam, no time-wasting and a personalised service for you.",
                    ),
                    buildJobChoiceCard(
                      imagePath: "assets/c4.svg",
                      title: "Hassle-free & Easy",
                      description:
                          "TManage the process from website or mobile app, and use our Docs service to register with agenciesquickly. Nifty tech built to save you time.",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
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
          ],
        ),
      ),
    );
  }
}

Widget buildJobChoiceCard({
  required String imagePath,
  required String title,
  required String description,
}) {
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(imagePath),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            description,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}
