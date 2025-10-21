import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';

class ferramentaDetails extends StatefulWidget {
  ferramentaDetails({super.key});

  @override
  _ferramentaDetailsState createState() => _ferramentaDetailsState();
}

class _ferramentaDetailsState extends State<ferramentaDetails> {
  //params

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("oioioioo"),
                  ],
                ),
                SizedBox(
                    child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rebinboca da parafuseta'),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Text('Rebinboca da parafuseto'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Rebinboca da parafuseto'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Rebinboca da parafuseto'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Text('Rebinboca da parafuseto'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Rebinboca da parafuseto'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Rebinboca da parafuseto'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            )));
  }
}
