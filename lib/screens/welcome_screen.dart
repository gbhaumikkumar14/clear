import 'package:clear/model/data.dart';
import 'package:clear/model/page_model.dart';
import 'package:clear/screens/reminders_screen.dart';
import 'package:clear/uiComponents/page_tile.dart';
import 'package:clear/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<PageModel> pageItems = [];
  int currentPosition = 0;
  late PageController pageController;

  Widget getPageIndicator(bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      height: isSelected ? 10.0 : 8.0,
      width: isSelected ? 10.0 : 8.0,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black87 : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageItems = getPageItems();
    pageController = PageController();
  }

  void moveNext() {
    print('Inside move next');
    pageController.animateToPage(currentPosition + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  updateSharedPref() async {
    print('Inside updateSharedPref');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(kisFirstTime, false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: pageItems.length,
                    itemBuilder: (context, index) {
                      return PageTile(
                        pageModel: pageItems[index],
                        onPressed: moveNext,
                      );
                    },
                    controller: pageController,
                    onPageChanged: (position) {
                      setState(() {
                        currentPosition = position;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: currentPosition == pageItems.length - 1,
                  child: InkWell(
                    onTap: () {
                      updateSharedPref();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RemindersScreen();
                      }));
                    },
                    child: Container(
                      height: 50.0,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text(
                        "GET STARTED",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: currentPosition > 0,
              child: Positioned(
                top: (MediaQuery.of(context).size.height *
                        (currentPosition == pageItems.length - 1 ? 30 : 35)) /
                    100,
                left: 0.0,
                right: 0.0,
                bottom: (MediaQuery.of(context).size.height *
                        (currentPosition == pageItems.length - 1 ? 30 : 35)) /
                    100,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < pageItems.length; i++)
                        i != currentPosition
                            ? getPageIndicator(false)
                            : getPageIndicator(true),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
