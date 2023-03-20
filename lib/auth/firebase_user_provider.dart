import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BeautyInclusiveApplicationFirebaseUser {
  BeautyInclusiveApplicationFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

BeautyInclusiveApplicationFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BeautyInclusiveApplicationFirebaseUser>
    beautyInclusiveApplicationFirebaseUserStream() => FirebaseAuth.instance
            .authStateChanges()
            .debounce((user) => user == null && !loggedIn
                ? TimerStream(true, const Duration(seconds: 1))
                : Stream.value(user))
            .map<BeautyInclusiveApplicationFirebaseUser>(
          (user) {
            currentUser = BeautyInclusiveApplicationFirebaseUser(user);
            return currentUser!;
          },
        );
