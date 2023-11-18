import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(
              height: 200,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          SizedBox(
            height: 200,
            child: Container(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Food',
        style: TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 214, 153, 40),
      elevation: 0.0,
      leading: Container(
        // alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 223, 178, 82),
            borderRadius: BorderRadius.circular(10)),
        child: SvgPicture.asset(
          'assets/icons/Menu.svg',
          // width: 20,
          // height: 20,
        ),
      ),
    );
  }
}
