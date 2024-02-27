// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:form_validator/form_validator.dart';
//
// class registrationpage extends StatefulWidget {
//   const registrationpage({super.key});
//
//   @override
//   State<registrationpage> createState() => _registrationpageState();
// }
//
// class _registrationpageState extends State<registrationpage> {
//   final _formkey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _dateOfBirthController = TextEditingController();
//
//   Future<void> _registeruser() async {
//     if (_formkey.currentState!.validate()) {
//       try {
//         final email = _emailController.text;
//         final password = _passwordController.text;
//         final username = _usernameController.text;
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//       } on FirebaseAuthException catch (e) {
//         print(e.code);
//         print(e.message);
//       } catch (e) {
//         print(e.toString());
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Form(
//           key: _formkey,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20.0,
//               ),
//               Center(
//                 child: Text(
//                   "Admin Registration",
//                 ),),
//               TextFormField(
//                 controller: _usernameController,
//                 validator: ValidationBuilder().minLength(30).required().build(),
//                 decoration: InputDecoration(labelText: "Username"),
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 validator: ValidationBuilder().email().required().build(),
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 validator: ValidationBuilder().minLength(8).required().build(),
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//               ),
//               TextFormField(
//                 controller: _dateOfBirthController,
//                 validator: ValidationBuilder().date().required().build(),
//                 decoration: InputDecoration(labelText: "Date of Birth"),
//                 readOnly: true,
//                 onTap: () {
//                   showDatePicker(context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),)
//                   .then((selectedDate) {
//                     if(selectedDate != null){
//                       _dateOfBirthController.text = selectedDate.toString();
//                     }
//                   });
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: _registeruser,
//                 child: Text("Register"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
