import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/screens/home_screen.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );

      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // //print("signed in " + user.displayName);
      // userProvider.addUserData(
      //     currentuser: user! ,
      //     userName: user.displayName as String,
      //     userEmail: user.email as String,
      //     userImage: user.photoURL as String
      // );

      return user;
    } catch (msg) {
      print(msg.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://img.freepik.com/free-vector/question-mark-sign-glowing-digital-style-background_1017-23982.jpg'),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Sign in to continue'),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: const Text(
                      '🗣Programming \n     Quiz(App!)',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.green,
                                offset: Offset(4, 4))
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Column(
                    children: [
                      SignInButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Adjust the border radius as needed
                        ),
                        Buttons.Apple,
                        text: "Sign In with Apple",
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Google,
                        text: "Sign In with Google",
                        onPressed: () async {
                          await _googleSignUp().then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              ));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Adjust the border radius as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Sign In if You Are agreeing with our',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text('Terms Privacy And Policy',
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
