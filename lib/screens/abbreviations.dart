import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class Abbreviations extends StatelessWidget {
  final String title;
  final List<String> abbreviations;
  final List<String> fullForms;
  const Abbreviations({
    Key? key,
    required this.title,
    required this.abbreviations,
    required this.fullForms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme: Theme.of(context).iconTheme,
      ),
      drawer: CommonDrawer(currentScreen: title),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        itemCount: abbreviations.length,
        itemBuilder: (context, index) {
          if (fullForms[index] == "") {
            return Container(
              // alignment: AlignmentDirectional.bottomStart,
              child: Text(
                abbreviations[index],
                textScaleFactor: 2,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.grey,
                    ),
              ),
            );
          } else {
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .25,
                    child: Text(abbreviations[index],
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(fullForms[index],
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
