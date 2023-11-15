import 'package:flutter/material.dart';

class CustomSquareWidget extends StatelessWidget {

  final String categoryName;
  final int number;
  final IconData icon;


  CustomSquareWidget({

    required this.categoryName,
    required this.number,
    required this.icon,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [

          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(7),
                topLeft: Radius.circular(7),
              ),
              color: Color.fromARGB(255, 129, 205, 213),
            ),
            height: 70,
            child:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon, // Use the provided iconData

                  ),
                  Text(
                    categoryName,
                    style:const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            //color: Color.fromARGB(255, 129, 205, 213),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(7),
                bottomLeft: Radius.circular(7),
              ),
              color: Color.fromARGB(255, 192, 219, 241),
            ),
            height: 30,
            child:  Center(
              child: Text(
                number.toString(),
                style:const TextStyle(color: Colors.white),
              ),
            ),
            //color: Color.fromARGB(255, 192, 219, 241),
          )
        ],
      ),
    );
  }
}
