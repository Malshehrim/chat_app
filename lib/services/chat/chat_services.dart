import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  // get instance of firestore
  final _firestore = FirebaseFirestore.instance;

  //get user stream
  /*

  [
  {
  'email': gigi@gmail.com
  'id': ..
  },
   {
  'email': gigi@gmail.com
  'id': ..
  },

]
  */

  Stream<List<Map<String,dynamic>> getUserStream(){
    return _firestore.collection('Users').snapshots().map((snapshot){ return snapshot.docs.map(doc){
      //go through each individual user 
      final user = doc.data();

      //
      return user;

    };},);

  }
  // send messages

  // get messages
}
