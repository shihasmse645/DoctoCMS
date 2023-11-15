import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ClinicalNotesCard extends StatelessWidget {
  const ClinicalNotesCard({super.key});

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
                        Text("11-Sep-2023",style: TextStyle(color: Colors.white,),),
                
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 55,
                    width: 150,
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.0),
                     color: appColor,
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text("06:11 AM",style: TextStyle(color: Colors.white),),
                          // SizedBox(width: 5,),
                          Icon(Icons.edit_note_outlined,size: 20.0,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text("Complaints",style: TextStyle(color: Colors.white,),),
                                    
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 150,
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.0),
                     color: appColor,
                    ),
                    child: const Center(
                      child: Row(
                        children: [
                          // Text("06:11 AM",style: TextStyle(color: Colors.white),),
                          // SizedBox(width: 5,),
                          Icon(Icons.find_in_page,size: 20.0,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text("Observation",style: TextStyle(color: Colors.white,),),
                                    
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 55,
                    width: 150,
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.0),
                     color: appColor,
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text("06:11 AM",style: TextStyle(color: Colors.white),),
                          // SizedBox(width: 5,),
                          Icon(Icons.insert_drive_file,size: 20.0,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text("Investigation",style: TextStyle(color: Colors.white,),),
                                    
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 150,
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.0),
                     color: appColor,
                    ),
                    child: const Center(
                      child: Row(
                        children: [
                          // Text("06:11 AM",style: TextStyle(color: Colors.white),),
                          // SizedBox(width: 5,),
                          Icon(Icons.medical_services,size: 20.0,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text("Diagnosis",style: TextStyle(color: Colors.white,),),
                                    
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8.0),
                       color: appColor,
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Text("06:11 AM",style: TextStyle(color: Colors.white),),
                            // SizedBox(width: 5,),
                            Icon(Icons.notes,size: 20.0,color: Colors.white,),
                            SizedBox(width: 5,),
                            Text("Notes",style: TextStyle(color: Colors.white,),),
                                      
                          ],
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 20,),
        ],
      ),
    );
  }
}