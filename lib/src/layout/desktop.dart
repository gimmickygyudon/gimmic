import 'package:flutter/material.dart';
import 'package:gimmic/src/navbar.dart';
import 'package:gimmic/assets/colors.dart';
import 'package:gimmic/assets/label.dart';
import 'package:intl/intl.dart';

class LayoutDesktop extends StatelessWidget {
  LayoutDesktop({super.key});
  final String timenow = DateFormat("EEEEE, MMMM dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: Navbar.isDesktop(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 0.0, left: 48.0, right: 48.0, bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    top: 0.0, left: 12.0, right: 12.0, bottom: 0.0),
                child: Text(
                  'Hi',
                  style: TextStyle(
                    color: ColorsResources.primarytextcolor,
                    fontSize: 48,
                    //fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 12.0, right: 12.0, bottom: 32.0),
                child: Text(
                  timenow,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    //fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 0,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Hero(
                            tag: 'catHero',
                            child: Container(
                              height: 200.0,
                              width: 410.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                image: const DecorationImage(
                                  image: AssetImage("images/hellocat1.jpg"),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                              // child: Text("YOUR TEXT"),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                StringResource.header,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 48,
                                  //fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                StringResource.paragraph,
                                style: TextStyle(
                                    color: ColorsResources.primarytextcolor,
                                    fontSize: 16),
                              ),
                              SizedBox(height: 40.0),
                            ],
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.orange.shade100),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.orange),
                                  /* minimumSize: MaterialStateProperty.all(
                                      const Size(220, 50)), */
                                  elevation: const MaterialStatePropertyAll(0),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/resource');
                                },
                                child: const Text("Get Started"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
