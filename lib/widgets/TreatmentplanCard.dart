import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TreatmentCard extends StatelessWidget {
  const TreatmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Padding(padding: EdgeInsets.only(top: 10,left: )),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 6,),
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.0),
                     color: appColor,
                    ),
                    child: const Row(
                      children: [
                        // Text("06:11 AM",style: TextStyle(color: Colors.white),),
                        // SizedBox(width: 5,),
                        Icon(Icons.calendar_month,size: 20.0,color: Colors.white,),
                        Text("09-Sep-2023",style: TextStyle(color: Colors.white,),),
                
                      ],
                    ),
                  ),
      
                ),
                
              ],
            ),
            const SizedBox(height: 15,),
            const Padding(
                  padding: EdgeInsets.only(left: 12,),
                  child: Text("Muhammed Iqbal",style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.w500
                  ),),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 6,),
                  child: Container(
                    height: 30,
                    //width: 60,
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.0),
                     color: appColor,
                    ),
                    child:  const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text("INV96",style: TextStyle(color: Colors.white,),)
                      ),
                  ),
      
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 10,right: 6,),
                  child: Container(
                    height: 30,
                    //width: 60,
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.0),
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
            const Divider(
              thickness: 3,
              color: appColor,
            ),
            const SizedBox(height: 10,),
             Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.0),
                     color: Color.fromARGB(255, 238, 237, 237),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("RCT",style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.w300
                                      ),),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      //width: 60,
                      decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8.0),
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
              ),
              )
            
          
        ],
      ),
    );
  }
}