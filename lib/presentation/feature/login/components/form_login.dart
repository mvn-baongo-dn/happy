// import 'package:flutter/material.dart';
// import 'package:happy/presentation/feature/login/components/email_form_field.dart';
// import 'package:happy/presentation/feature/login/components/password_form_field.dart';

// import 'package:rive/rive.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String validEmail = "Dandi@gmail.com";
//   String validPassword = "12345";

//   /// input form controller
//   FocusNode emailFocusNode = FocusNode();
//   TextEditingController emailController = TextEditingController();

//   FocusNode passwordFocusNode = FocusNode();
//   TextEditingController passwordController = TextEditingController();

//   /// rive controller and input
//   StateMachineController? controller;

//   SMIInput<bool>? isChecking;
//   SMIInput<double>? numLook;
//   SMIInput<bool>? isHandsUp;

//   SMIInput<bool>? trigSuccess;
//   SMIInput<bool>? trigFail;

//   @override
//   void initState() {
//     emailFocusNode.addListener(emailFocus);
//     passwordFocusNode.addListener(passwordFocus);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     emailFocusNode.removeListener(emailFocus);
//     passwordFocusNode.removeListener(passwordFocus);
//     super.dispose();
//   }

//   void emailFocus() {
//     isChecking?.change(emailFocusNode.hasFocus);
//   }

//   void passwordFocus() {
//     isHandsUp?.change(passwordFocusNode.hasFocus);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("Build Called Again");
//     return Scaffold(
//       backgroundColor: const Color(0xFFD6E2EA),
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           children: [
//             const SizedBox(height: 32),
//             Container(
//               height: 64,
//               width: 64,
//               padding: const EdgeInsets.all(16),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: const Image(
//                 image: AssetImage("assets/rive_logo.png"),
//               ),
//             ),
//             const SizedBox(height: 32),
//             Text(
//               "Chào mừng bạn trở lại",
//               style: Theme.of(context).textTheme.headlineMedium,
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 250,
//               width: 250,
//               child: RiveAnimation.asset(
//                 "assets/login-teddy.riv",
//                 fit: BoxFit.fitHeight,
//                 stateMachines: const ["Login Machine"],
//                 onInit: (artboard) {
//                   controller = StateMachineController.fromArtboard(
//                     artboard,

//                     /// from rive, you can see it in rive editor
//                     "Login Machine",
//                   );
//                   if (controller == null) return;

//                   artboard.addController(controller!);
//                   isChecking = controller?.findInput("isChecking");
//                   numLook = controller?.findInput("numLook");
//                   isHandsUp = controller?.findInput("isHandsUp");
//                   trigSuccess = controller?.findInput("trigSuccess");
//                   trigFail = controller?.findInput("trigFail");
//                 },
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   EmailFormField(
//                     emailController: emailController,
//                     emailFocusNode: emailFocusNode,
//                     numLook: numLook,
//                   ),
//                   const SizedBox(height: 8),
//                   PasswordFormField(
//                       passwordFocusNode: passwordFocusNode,
//                       passwordController: passwordController),
//                   const SizedBox(height: 32),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     height: 64,
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         emailFocusNode.unfocus();
//                         passwordFocusNode.unfocus();

//                         final email = emailController.text;
//                         final password = passwordController.text;

//                         showLoadingDialog(context);
//                         await Future.delayed(
//                           const Duration(milliseconds: 2000),
//                         );
//                         if (mounted) Navigator.pop(context);

//                         if (email == validEmail && password == validPassword) {
//                           trigSuccess?.change(true);
//                         } else {
//                           trigFail?.change(true);
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       child: const Text("Login"),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// void showLoadingDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (_) {
//       return WillPopScope(
//         onWillPop: () async => false,
//         child: Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 32),
//                 child: CircularProgressIndicator(),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
