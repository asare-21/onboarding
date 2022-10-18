import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onboarding/providers/provider.dart';
import 'package:provider/provider.dart';

class OnboardWidget extends StatelessWidget {
  const OnboardWidget(
      {super.key,
      required this.description,
      required this.image,
      this.isLast = false,
      required this.pageController,
      required this.position,
      required this.length,
      required this.title});
  final String title, description, image;
  final bool isLast;
  final PageController pageController;
  final int position, length;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            const Spacer(),
            CircleAvatar(
                backgroundColor: Colors.grey[50],
                radius: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LottieBuilder.asset(image),
                )),
            const Spacer(
              flex: 2,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Spacer(
              flex: 3,
            ),
            isLast
                ? ElevatedButton(
                    onPressed: () {
                      pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linearToEaseOut);
                      context.read<PageProvider>().spage = 0;
                    },
                    child: SizedBox(
                        width: 100,
                        child: Text(
                          "Go back",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        )))
                : ElevatedButton(
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                      context.read<PageProvider>().spage = position + 1;
                    },
                    child: SizedBox(
                        width: 100,
                        child: Text(
                          "Next",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ))),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
