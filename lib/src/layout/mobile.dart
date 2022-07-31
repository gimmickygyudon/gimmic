import 'package:flutter/material.dart';
import 'package:gimmic/src/drawer.dart';
import 'package:gimmic/src/navbar.dart';
import 'package:gimmic/assets/colors.dart';
import 'package:gimmic/assets/label.dart';

class LayoutMobile extends StatelessWidget {
  const LayoutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: Navbar.isMobile(),
      endDrawer: const SideDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 18.0, bottom: 10.0, right: 44.0, left: 44.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        StringResource.header,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorsResources.primarytextcolor,
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const Text(
                        StringResource.paragraph,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorsResources.primarytextcolor,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 80.0),
                      ElevatedButton(
                        // style: const ButtonStyle()
                        //     .copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              ColorsResources.primarycolor),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          minimumSize:
                              MaterialStateProperty.all(const Size(220, 50)),
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        child: const Text(StringResource.getStarted),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
