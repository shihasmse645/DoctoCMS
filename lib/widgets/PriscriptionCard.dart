import 'package:doctocms/constants/colors.dart';
import 'package:flutter/material.dart';

class PriscriptionCard extends StatelessWidget {
  const PriscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
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
                        Text("06-Sep-2023",style: TextStyle(color: Colors.white,),),
                
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
                     color: const Color.fromARGB(255, 238, 237, 237),
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Club Drug",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w400
                             ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
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
                        Container(
                          height: 30,
                          //width: 60,
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8.0),
                           color: appColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("BF",style: TextStyle(color: Colors.white,),),
                          ),
                        ),Container(
                          height: 30,
                          //width: 60,
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8.0),
                           color: appColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("5 Days",style: TextStyle(color: Colors.white,),),
                          ),
                        ),Container(
                          height: 30,
                          //width: 60,
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8.0),
                           color: appColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("1:1:1",style: TextStyle(color: Colors.white,),),
                          ),
                        ),
                        ],
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