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

Future<Object?> getMedicineById(String id) async {
  DocumentSnapshot? medicineSnapshot;

  CollectionReference collectionReferenceMedicine = db.collection('medicines');

  try {
    medicineSnapshot = await collectionReferenceMedicine.doc(id).get();
  } catch (e) {
    return null;
  }

  if (medicineSnapshot.exists) {
    return medicineSnapshot.data();
  } else {
    return null;
  }
}
