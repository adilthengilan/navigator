import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/indexController.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/navigation_dashboard.dart';
import 'package:navigator_portal/view/desktop_view/home/desktop_homes.dart';
import 'package:navigator_portal/view/desktop_view/registration/login.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _HomePageState();
}

class _HomePageState extends State<DesktopView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Indexes indexes = Get.put(Indexes()); // Instantiate CounterController
    bool verify = false;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.2),
              child: Image.asset('assets/images/logobluetext.png'),
            ),
            SizedBox(height: 30, child: AppBarButtons()),
            sizedBox(0, width * 0.10),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPageDesk(),
                    ));
                // showDialogueForProviders(context, verify);
              },
              child: Container(
                height: 40,
                width: width * 0.1,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 91, 67, 129),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    'Login/Signup',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
            ),
            sizedBox(0, width * 0.05),
          ]),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Home(height: height, width: width),
                sizedBox(height * 0.2, 0),
                // get_in_Touch()
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          // Scroll to the bottom
          _scrollController.animateTo(
            _scrollController.position.minScrollExtent,
            duration: Duration(milliseconds: 400),
            curve: Curves.linear,
          );
        },
        tooltip: 'Scroll to Bottom',
        child: Icon(Icons.arrow_upward),
      ),
    );
  }

  Widget AppBarButtons() {
    final Indexes indexes =
        Get.find<Indexes>(); // Instantiate CounterController

    List<String> buttons = ['Home', 'Courses', 'Blog', 'Contact'];

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        return TextButton(
            onPressed: () {
              indexes.SelectedIndexes.value = index;
              switch (index) {
                case 0:
                  _scrollToPosition(0);
                case 1:
                  _scrollToPosition(800);
                case 2:
                  _scrollToPosition(800);

                case 3:
                  _scrollToPosition(1200);
                case 4:
                  _scrollToPosition(2000);
              }
            },
            child: Obx(
              () => Text(
                buttons[index],
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: indexes.SelectedIndexes.value == index
                        ? Color.fromARGB(255, 107, 38, 144)
                        : Colors.black),
              ),
            ));
      },
    );
  }

  void _scrollToPosition(double position) {
    _scrollController.animateTo(
      position,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void verifyDetails(NameController, IdController, bool verify) {
    if (NameController.text.isNotEmpty && IdController.text.isNotEmpty) {
      if (NameController.text == ClientName && IdController.text == ClientId) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Navigation_dashBoard(),
            ));
      } else {}
    }
  }

  void showDialogueForProviders(BuildContext context, bool verify) {
    final TextEditingController NameController = TextEditingController();
    final TextEditingController IdController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Please Login With Your Client name and id',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          content: SizedBox(
            height: 200,
            child: Column(
              children: [
                TextField(
                  controller: NameController,
                  decoration: InputDecoration(
                    hintText: 'Enter client name',
                  ),
                ),
                sizedBox(20, 0),
                TextField(
                    controller: IdController,
                    decoration: InputDecoration(
                      hintText: 'Enter client id',
                    )),
                sizedBox(20, 0),
                TextButton(
                  onPressed: () {
                    verifyDetails(NameController, IdController, verify);
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
