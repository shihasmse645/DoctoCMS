import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text("06-Sep-2023",style: TextStyle(color: Colors.black,),),
                    Icon(Icons.calendar_month,size: 20.0,color: Colors.black,),
                  ],
                ),
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
            const Text("Muhammed Iqbal",style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.w500
            ),),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 6,),
                    child: Container(
                      height: 30,
                      //width: 60,
                      decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15.0),
                       color: appColor,
                      ),
                      child:  const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("INV93",style: TextStyle(color: Colors.white,),)
                        ),
                    ),
        
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 10,right: 6,),
                    child: Container(
                      height: 30,
                      //width: 60,
                      decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15.0),
                       color: appColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("15",style: TextStyle(color: Colors.white,),),
                      ),
                    ),
        
                  ),
                  
                ],
              ),
          ],
        ),
      ),
    );
  }
}