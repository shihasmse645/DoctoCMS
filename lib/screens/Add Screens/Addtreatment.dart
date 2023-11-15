import 'package:doctocms/Models/treatmentitem.dart';
import 'package:flutter/material.dart';

import '../../Models/Doctormodel.dart';
import '../../constants/colors.dart';

class AddTreatment extends StatefulWidget {
  const AddTreatment({super.key});

  @override
  State<AddTreatment> createState() => _AddTreatmentState();
}

class _AddTreatmentState extends State<AddTreatment> {
  String? selectedDoctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: appColor,
        title: const Text('dosctosmart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 7, right: 7, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Treatment Plan",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: appColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: appColor, // Set the background color
                borderRadius: BorderRadius.circular(8.0),
                // Set the border radius
              ),
              child: DropdownButtonFormField<String>(
                value: selectedDoctor,
                items: doctors.map((Doctor doctor) {
                  return DropdownMenuItem<String>(
                    value: doctor.name,
                    child: Text(doctor.name),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDoctor = newValue;
                  });
                },
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), color: appColor),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor,
                  ),
                  onPressed: () {
                    //add function
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const addplan()));
                  },
                  child: const Text('Add'),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Card(
              color: const Color.fromARGB(255, 33, 243, 233),
              elevation: 10,
              child: Center(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text("1",style: TextStyle(color: Color.fromARGB(255, 18, 81, 132)),),
                  ),
                  title: const Text("Fever\n100\n1"),
                  trailing: IconButton(
                    onPressed: (){} ,
                    icon: const Icon(Icons.delete,color: Colors.red,)
                    ),
                ),
              ),
              
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), color: appColor),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        ":",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "0",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: appColor),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onPressed: () {
                  //confirm function
                },
                child: const Text('Confirm',style: TextStyle(fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class addplan extends StatefulWidget {
  const addplan({super.key});

  @override
  State<addplan> createState() => _addplanState();
}

class _addplanState extends State<addplan> {
  String? selectedTreatment;
  int selectedAmount=0;
  int unit = 0;

  void incrementQuantity() {
    setState(() {
      unit++;
    });
  }

  void decrementQuantity() {
    if (unit > 1) {
      setState(() {
        unit--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: appColor,
        title: const Text('dosctosmart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(top: 10, left: 7, right: 7, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Treatment Plan",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: appColor),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              " Treatment",
              style: TextStyle(fontSize:15, fontWeight:FontWeight.w200),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 65,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration:BoxDecoration(
                  color: appColor, // Set the background color
                  borderRadius: BorderRadius.circular(5.0),
                  border:  Border.all(
                    color: Colors.black,
                    width: 1.0,
                    //style: BorderStyle.solid
                  ),
                  // Set the border radius
                ),
                child: Center(
                  child: DropdownButtonFormField<String>(
                    value: selectedTreatment,
                    items: treatment.map((TreatmentItem treatment) {
                      return DropdownMenuItem<String>(
                        value: treatment.name,
                        child: Text(treatment.name),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTreatment = newValue;
                        selectedAmount = treatment
                      .firstWhere((item) => item.name == newValue)
                      .amount;
                      });
                    },
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Unit",style: TextStyle(fontSize:15, fontWeight:FontWeight.w200),),
                Text("Amount",style: TextStyle(fontSize:15, fontWeight:FontWeight.w200),)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration:BoxDecoration(
                  color: appColor, // Set the background color
                  borderRadius: BorderRadius.circular(5.0),
                 
                  // Set the border radius
                ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove,),
                          color: Colors.white,
                          onPressed: decrementQuantity,
                        ),
                        Container(
                          height: 30,
                          decoration:BoxDecoration(
                            color: Colors.white, // Set the background color
                            borderRadius: BorderRadius.circular(2.5),
                          
                            // Set the border radius
                          ),
                          child: Center(
                            child: Text(
                              '$unit',
                              style: const TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: incrementQuantity,
                          color: Colors.white,

                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration:BoxDecoration(
                  color: appColor, // Set the background color
                  borderRadius: BorderRadius.circular(5.0),
                 
                  // Set the border radius
                ),
                child: Center(
                  child:Text(selectedAmount.toString(),style: const TextStyle(fontSize: 15,color: Colors.white),) ,
                ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: appColor),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onPressed: () {
                  //save function
                },
                child: const Text('Save',style: TextStyle(fontSize: 18),),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
