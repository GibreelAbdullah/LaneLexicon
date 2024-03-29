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
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme: Theme.of(context).iconTheme,
      ),
      drawer: CommonDrawer(currentScreen: title),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        itemCount: abbreviations.length,
        itemBuilder: (context, index) {
          if (fullForms[index] == "") {
            return Text(
              abbreviations[index],
              textScaleFactor: 2,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey,
                  ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .25,
                  child: Text(abbreviations[index],
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: Text(fullForms[index],
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
