import 'package:flutter/material.dart';

import '../widgets/button_customized.dart';
import './signup_screen.dart';
import '../utils/onbording_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    // implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // implement dispose
    _controller.dispose();
    super.dispose();
  }

  void getStartedfun(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const SignupPage()));
  }

  void nextButtonFun() {
    setState(() {
      currentIndex++;
    });
    // if (currentIndex == contents.length) {
    // currentIndex = 0;
    // _controller.jumpToPage(0);
    // } else {
    _controller.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        // title: Image.asset('assets/appbar1.png'),
        // ),
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Image.asset('assets/appbar1.png'),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 99,
            height: MediaQuery.of(context).size.height * 0.45,
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex + index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.height * 0.99,
                      height: MediaQuery.of(context).size.height * 0.30,
                      child: Image.asset(
                        contents[i].image,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      // ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  contents.length, (index) => buildDot(index, context)),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.070,
          ),
          SizedBox(
              child: (currentIndex == contents.length - 1)
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    )
                  : ButtonCustomized(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.070,
                      butttonText: "Next ->",
                      buttonpress: () => nextButtonFun(),
                      buttonColor: Colors.white,
                      textColor: Colors.black,
                    )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          ButtonCustomized(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.070,
            butttonText: "Get Started",
            buttonpress: () => getStartedfun(context),
            buttonColor: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.030,
          ),
        ],
      ),
    ));
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      width:
          //  currentIndex == index?
          MediaQuery.of(context).size.width * 0.035,
      // : MediaQuery.of(context).size.width * 0.028,
      height: MediaQuery.of(context).size.height * 0.02,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: currentIndex == index
            ? Theme.of(context).colorScheme.primary
            : Colors.grey[400],
      ),
    );
  }
}
