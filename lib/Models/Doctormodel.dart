class Doctor {
  final String name;
  //final String? id;
  final String? specialty;
  //final String? location;
  //final String? imageUrl;
  //final List<String>? availableDays;

  Doctor({
    required this.name,
   // this.id,
    this.specialty,
    //this.location,
    //this.imageUrl,
    //this.availableDays,
  });
}
final List<Doctor> doctors = [
    Doctor(name: 'Muhammed Iqbal VM'),
    Doctor(name: 'Shafeeq V'),
    Doctor(name: 'Krishna Das'),
    Doctor(name: 'Aishwarya V'),
    Doctor(name: 'Bijeesh BDS'),
    Doctor(name: 'Irsad Ahmed'),
    Doctor(name: 'Dr. Pratheesh MBBS,MD'),
    Doctor(name: 'Sarath V'),
    

    // Add more doctors as needed
  ];