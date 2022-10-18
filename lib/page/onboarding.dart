import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/model/get_lottie.dart';
import 'package:onboarding/model/onboarding_model.dart';
import 'package:onboarding/providers/provider.dart';
import 'package:onboarding/widgets/onboard_widget.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<ONBModel> onbList = [
    ONBModel(
      title: "Stay fit at home",
      description: """We're here to help you keep active in
the most simple, effective, and
affordable way, all without leaving
the comfort of your home.""",
      image: GetLottie.getLottie("workout"),
    ),
    ONBModel(
      title: "On-demand routines that fits your needs",
      description: """Find classes ranging from cardio,
strength, yoga, and more, taught by
the most qualified trainers.""",
      image: GetLottie.getLottie("meditation"),
    ),
    ONBModel(
      title: "Accessible for all",
      description: """With routines that require little to no
equipment, we have something for
everybody.""",
      image: GetLottie.getLottie("dance-party"),
    ),
  ];
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: onbList
                  .map((e) => OnboardWidget(
                        title: e.title,
                        position: onbList.indexOf(e),
                        length: onbList.length,
                        pageController: _pageController,
                        description: e.description,
                        image: e.image,
                        isLast: e == onbList.last,
                      ))
                  .toList(),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 50,
                width: 100,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: context.watch<PageProvider>().page,
                  decorator: const DotsDecorator(
                    color: Colors.grey, // Inactive color
                    activeColor: darkYellow,
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
