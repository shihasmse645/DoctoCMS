import 'package:doctocms/constants/colors.dart';
import 'package:flutter/material.dart';

class appointmentCard extends StatelessWidget {
  const appointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return    Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
         
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("12-Sep-2023"),
                Icon(Icons.calendar_month)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30.0),
                   color: appColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Text("06:11 AM",style: TextStyle(color: Colors.white),),
                        SizedBox(width: 5,),
                        Icon(Icons.access_time,size: 20.0,color: Colors.white,)
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text("Muhammed Iqbal VM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            const Row(
              children: [
                Text("test",style: TextStyle(
                  fontSize: 18,color: Colors.grey,fontWeight: FontWeight.w400
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}