import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
Future<List> getMedicines() async {
  List medicines = [];

  CollectionReference collectionReferenceMedicine = db.collection('medicines');

  QuerySnapshot queryMedicines = await collectionReferenceMedicine.get();

  for (var doc in queryMedicines.docs) {
    medicines.add(doc.data());
  }

  return medicines;
}
