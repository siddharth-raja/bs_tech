import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.4,
            width: size.width,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(113, 114, 222, 1)
            ),
            child: Row(
              children: [
                Icon(Icons.menu)
              ],
            ),
          )
        ],
      ),
    );
  }
}