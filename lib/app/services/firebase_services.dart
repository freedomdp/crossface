import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crossface/app/logic/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  FirebaseServices._();

  static final instance = FirebaseServices._();

  final auth = FirebaseAuth.instance;

  final firebase = FirebaseFirestore.instance;

  final googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }

  Stream<DocumentSnapshot<UserModel>> userCrossFaces() async* {
    yield* instance.firebase
        .collection('test')
        .doc(instance.auth.currentUser!.email!)
        .withConverter(
            fromFirestore: (snap, _) => UserModel.fromJson(snap.data()!),
            toFirestore: (user, _) => user.toJson())
        .snapshots();
  }
}
