import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:version_1/homepage/models/Product.dart';

Future<void> getData() async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('products');
  late var allData;
  QuerySnapshot querySnapshot = await _collectionRef.get();
  allData = await querySnapshot.docs.map((doc) => doc.data()).toList();
  for (var i in allData) {
    // print(i);
    int flag = 0;
    for (var j in demo_product) {
      if (j.title == i['title']) {
        flag = 1;
        break;
      }
    }
    if (flag == 1) {
      continue;
    }
    demo_product.add(Product(
      image: i['image'],
      title: i['title'],
      price: i['price'],
      description: i['description'],
    ));
  }
  print (demo_product);
}
