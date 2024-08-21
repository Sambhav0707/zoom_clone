import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/Utils/utils.dart';

class AuthMethods {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?>  get authChanges => _auth.authStateChanges();

  Future<bool>signWithGoogle(BuildContext context)async{

    bool res = false;

    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =  await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken:  googleAuth?.idToken,

      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if(user!=null){
        if(userCredential.additionalUserInfo!.isNewUser){

          _firestore.collection('user').doc(user.uid).set({

            'username' : user.displayName,
            'user id' : user.uid,
            'profilePhoto' : user.photoURL,

          });

        }
        res = true;
      }

    }on FirebaseAuthException catch(e){

      showSnackBar(context, e.message!);



      res = false;



    }
    return res;
  }

}