import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moca/controllers/admin_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHomeScreen extends StatelessWidget {
  final AdminController _adminController = Get.put(AdminController());
  AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff3edf7),
        title: const Center(
            child: Text(
              'MOCA - Admin',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1C1B1F),
              ),
            )),
      ),
      body: SingleChildScrollView(
        padding:  const EdgeInsets.fromLTRB(18,40,18,18),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 3,
              shadowColor: Colors.black,
              color: const Color(0xFFFFFBFE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total Submissions',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto (
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '23',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto (
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Card(
              elevation: 3,
              shadowColor: Colors.black,
              color: const Color(0xFFFFFBFE),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Average Score',
                      style: GoogleFonts.roboto (
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '85',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto (
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Card(
              elevation: 3,
              shadowColor: Colors.black,
              color: const Color(0xFFFFFBFE),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Download Data CSV',
                      style: GoogleFonts.roboto (
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextButton(
                        onPressed: _adminController.downloadCSV,
                        style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                        backgroundColor: const Color(0xFF6750a4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                      ),
                        child: Text (
                          textAlign: TextAlign.center,
                          'Download',
                          style: GoogleFonts.roboto (
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Card(
              elevation: 3,
              shadowColor: Colors.black,
              color: const Color(0xFFFFFBFE),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 25, 30, 30),
                      child: SearchBar(
                        hintText: "Search User by Email",
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(horizontal: 12)),
                        leading: const Icon(Icons.person_outline, size: 24),
                        trailing: const [Icon(Icons.search, size: 24)],
                        elevation: MaterialStateProperty.all(1),
                      ),
                    ),

                    Column(
                      children: [
                        Text (
                          textAlign: TextAlign.left,
                          'User Name: Yahya Bin Naveed',
                          style: GoogleFonts.roboto (
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text (
                          textAlign: TextAlign.left,
                          'Email: yahya.bin.naveed@gmail.com',
                          style: GoogleFonts.roboto (
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text (
                          textAlign: TextAlign.left,
                          'Total Score: 96',
                          style: GoogleFonts.roboto (
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextButton(
                      onPressed: _adminController.downloadCSV,
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                          backgroundColor: const Color(0xFF6750a4),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                      ),
                      child: Text (
                        textAlign: TextAlign.center,
                        'Download',
                        style: GoogleFonts.roboto (
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


