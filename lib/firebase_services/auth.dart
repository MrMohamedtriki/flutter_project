import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/firebase_services/storage.dart';
// Ensure this file exists at the specified path
import 'package:flutter_project/models/user.dart';
import 'package:flutter_project/shared/snackbar.dart';

class AuthMethods {
  register({
    required emailll,
    required passworddd,
    required context,
    required titleee,
    required usernameee,
    required imgName,
    required imgPath,
  }) async {
    String message = "ERROR => Not starting the code";
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailll,
        password: passworddd,
      );
      message = "ERROR => Registered only";
// ______________________________________________________________________
      String urlll = await getImgURL(
          imgName: imgName, imgPath: imgPath, folderName: 'profileIMG');
// _______________________________________________________________________
// firebase firestore (Database)
      CollectionReference users =
          FirebaseFirestore.instance.collection('userSSS');
      UserDate userr = UserDate(
          email: emailll,
          password: passworddd,
          title: titleee,
          username: usernameee,
          profileImg: urlll,
          uid: credential.user!.uid,
          followers: [],
          following: []);
      users
          .doc(credential.user!.uid)
          .set(userr.convert2Map())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      message = " Registered & User Added 2 DB ♥";
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.message}"); // Logs detailed error message

      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
      print("General Error: $e");
      showSnackBar(context, "ERROR: $e");
      print(e);
    }
    showSnackBar(context, message);
  }

  

  // functoin to get user details from Firestore (Database)
  Future<UserDate> getUserDetails() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      throw Exception("No user is currently signed in.");
    }
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('userSSS')
        .doc(currentUser.uid)
        .get();
    return UserDate.convertSnap2Model(snap);
  }
}
