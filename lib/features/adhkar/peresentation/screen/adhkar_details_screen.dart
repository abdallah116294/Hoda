import 'package:flutter/material.dart';
import 'package:quran_app/features/adhkar/peresentation/widget/adhkar_details_widget.dart';

class AdhkarDetailsScreen extends StatelessWidget {
  AdhkarDetailsScreen(
      {super.key,
      // required this.text,
      // required this.count,
      required this.onPressed1,
      required this.onPressed2,
      required this.adhkarName,
      // required this.length,
      required this.array});
  // final String text;
  // final int count;
  final VoidCallback onPressed1, onPressed2;
  // int length;
  List array;
 final String adhkarName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Directionality(
            textDirection: TextDirection.ltr,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                )),
          ),
        title:  Center(
            child: Text(
          adhkarName,
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: const Color(0xFF230E4E),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return AdhkarDetialsWidget(
                  text: array[index].text,
                  count: array[index].count,
                  audoi: array[index].audio,
                  onPressed1: onPressed1,
                  onPressed2: onPressed2);
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: array.length),
      ),
    );
  }
}
