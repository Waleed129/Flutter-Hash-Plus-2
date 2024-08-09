// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:flutter/material.dart';
// import 'user.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'المسبحة الذكية',
//       theme: ThemeData.dark(
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// bool isSecured = true;

// Map<String, User> users = {
//   "bassam@gmail.com": User(email: 'bassam@gmail.com', password: 'Test@1234'),
//   "anas@gmail.com": User(email: 'anas@gmail.com', password: 'Password@123'),
// };

// class User {
//   String email;
//   String password;

//   User({required this.email, required this.password});
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   String _message = '';
//   Color _messageColor = Colors.black;
//   bool showPasswordHints = false;

//   bool hasUpperCase = false;
//   bool isLongEnough = false;
//   bool hasDigit = false;
//   bool hasSpecialCharacter = false;
//   bool isValidEmail = true;
//   bool isEmailSecured = false;

//   void _checkCredentials() {
//     String email = emailController.text;
//     String password = passwordController.text;

//     setState(() {
//       isValidEmail = email.contains('@') && email.endsWith('.com');
//       hasUpperCase = password.contains(RegExp(r'[A-Z]'));
//       isLongEnough = password.length >= 6;
//       hasDigit = password.contains(RegExp(r'\d'));
//       hasSpecialCharacter = password.contains(RegExp(r'[!@#\$&*~]'));
//     });

//     if (!isValidEmail) {
//       setState(() {
//         _message = 'يجب أن يحتوي الإيميل على "@" وينتهي بـ ".com"';
//         _messageColor = Colors.red;
//       });
//       return;
//     }

//     if (!hasUpperCase || !isLongEnough || !hasDigit || !hasSpecialCharacter) {
//       setState(() {
//         _message = 'كلمة السر غير صحيحة';
//         _messageColor = Colors.red;
//         showPasswordHints = true;
//       });
//       return;
//     }

//     if (users.containsKey(email)) {
//       if (users[email]!.password == password) {
//         setState(() {
//           _message = 'تم تسجيل الدخول بنجاح';
//           _messageColor = Colors.green;
//         });
//       } else {
//         setState(() {
//           _message = 'كلمة السر غير مسجلة بالنظام';
//           _messageColor = Colors.red;
//         });
//       }
//     } else {
//       setState(() {
//         _message = 'البريد الإلكتروني غير مسجل بالنظام';
//         _messageColor = Colors.red;
//       });
//     }
//   }

//   void _validatePassword(String password) {
//     setState(() {
//       hasUpperCase = password.contains(RegExp(r'[A-Z]'));
//       isLongEnough = password.length >= 6;
//       hasDigit = password.contains(RegExp(r'\d'));
//       hasSpecialCharacter = password.contains(RegExp(r'[!@#\$&*~]'));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 2, 15, 37),
//         centerTitle: true,
//         title: const Text(
//           "صفحة تسجيل الدخول !",
//           style: TextStyle(
//             fontSize: 25,
//             color: Color.fromARGB(255, 255, 255, 255),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Image.asset(
//               "login_blue-removebg-preview.png",
//               height: 200,
//               width: 400,
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                   Focus(
//                     onFocusChange: (hasFocus) {
//                       setState(() {
//                         showPasswordHints =
//                             hasFocus && passwordController.text.isNotEmpty;
//                       });
//                     },
//                     child: TextFormField(
//                       controller: emailController,
//                       obscureText: isEmailSecured,
//                       decoration: InputDecoration(
//                         label: Align(
//                           alignment: Alignment.centerRight,
//                           child: Text("... يرجى كتابة الإيميل هنا"),
//                         ),
//                         prefixIcon: Icon(Icons.email),
//                         suffixIcon: Padding(
//                           padding: const EdgeInsets.only(right: 5.0),
//                           child: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 isEmailSecured = !isEmailSecured;
//                               });
//                             },
//                             icon: Icon(Icons.remove_red_eye),
//                           ),
//                         ),
//                         border: OutlineInputBorder(borderSide: BorderSide()),
//                         errorText: !isValidEmail
//                             ? 'يجب أن يحتوي الإيميل على "@" وينتهي بـ ".com"'
//                             : null,
//                         errorStyle: TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   Focus(
//                     onFocusChange: (hasFocus) {
//                       setState(() {
//                         showPasswordHints =
//                             hasFocus && passwordController.text.isNotEmpty;
//                       });
//                     },
//                     child: TextFormField(
//                       controller: passwordController,
//                       obscureText: isSecured,
//                       onChanged: _validatePassword,
//                       decoration: InputDecoration(
//                         label: Align(
//                           alignment: Alignment.centerRight,
//                           child: Text("... يرجى كتابة الرقم السري هنا"),
//                         ),
//                         suffixIcon: Icon(Icons.lock),
//                         prefixIcon: Padding(
//                           padding: const EdgeInsets.only(right: 5.0),
//                           child: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 isSecured = !isSecured;
//                               });
//                             },
//                             icon: Icon(Icons.remove_red_eye),
//                           ),
//                         ),
//                         border: OutlineInputBorder(borderSide: BorderSide()),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   if (showPasswordHints)
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "يجب أن تحتوي على حرف كبير",
//                             style: TextStyle(
//                               color: hasUpperCase ? Colors.green : Colors.red,
//                               fontSize: 12,
//                             ),
//                           ),
//                           Text(
//                             "يجب أن تكون مكونة من 6 أحرف على الأقل",
//                             style: TextStyle(
//                               color: isLongEnough ? Colors.green : Colors.red,
//                               fontSize: 12,
//                             ),
//                           ),
//                           Text(
//                             "يجب أن تحتوي على رقم",
//                             style: TextStyle(
//                               color: hasDigit ? Colors.green : Colors.red,
//                               fontSize: 12,
//                             ),
//                           ),
//                           Text(
//                             "يجب أن تحتوي على رمز خاص",
//                             style: TextStyle(
//                               color: hasSpecialCharacter
//                                   ? Colors.green
//                                   : Colors.red,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   InkWell(
//                     onTap: _checkCredentials,
//                     child: Container(
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.blue,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.login_outlined,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             "تسجيل دخول",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     _message,
//                     style: TextStyle(
//                       color: _messageColor,
//                       fontSize: 18,
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
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:flutter/material.dart';
// import 'user.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'المسبحة الذكية',
//       theme: ThemeData.dark(
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// bool isSecured = true;

// Map<String, User> users = {
//   "bassam@gmail.com": User(email: 'bassam@gmail.com', password: 'Test@1234'),
//   "anas@gmail.com": User(email: 'anas@gmail.com', password: 'Password@123'),
// };

// class User {
//   String email;
//   String password;

//   User({required this.email, required this.password});
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   String _message = '';
//   Color _messageColor = Colors.black;
//   bool showPasswordHints = false;

//   bool hasUpperCase = false;
//   bool isLongEnough = false;
//   bool hasDigit = false;
//   bool hasSpecialCharacter = false;
//   bool isValidEmail = true;
//   bool isEmailSecured = false;

//   void _checkCredentials() {
//     String email = emailController.text;
//     String password = passwordController.text;

//     setState(() {
//       isValidEmail = email.contains('@') && email.endsWith('.com');
//       hasUpperCase = password.contains(RegExp(r'[A-Z]'));
//       isLongEnough = password.length >= 6;
//       hasDigit = password.contains(RegExp(r'\d'));
//       hasSpecialCharacter = password.contains(RegExp(r'[!@#\$&*~]'));
//     });

//     if (!isValidEmail) {
//       setState(() {
//         _message = 'يجب أن يحتوي الإيميل على "@" وينتهي بـ ".com"';
//         _messageColor = Colors.red;
//       });
//       return;
//     }

//     if (!hasUpperCase || !isLongEnough || !hasDigit || !hasSpecialCharacter) {
//       setState(() {
//         _message = 'كلمة السر غير صحيحة';
//         _messageColor = Colors.red;
//         showPasswordHints = true;
//       });
//       return;
//     }

//     if (users.containsKey(email)) {
//       if (users[email]!.password == password) {
//         setState(() {
//           _message = 'تم تسجيل الدخول بنجاح';
//           _messageColor = Colors.green;
//         });
//         // التوجيه إلى صفحة العداد عند تسجيل الدخول بنجاح
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => CounterPage()),
//         );
//       } else {
//         setState(() {
//           _message = 'كلمة السر غير مسجلة بالنظام';
//           _messageColor = Colors.red;
//         });
//       }
//     } else {
//       setState(() {
//         _message = 'البريد الإلكتروني غير مسجل بالنظام';
//         _messageColor = Colors.red;
//       });
//     }
//   }

//   void _validatePassword(String password) {
//     setState(() {
//       hasUpperCase = password.contains(RegExp(r'[A-Z]'));
//       isLongEnough = password.length >= 6;
//       hasDigit = password.contains(RegExp(r'\d'));
//       hasSpecialCharacter = password.contains(RegExp(r'[!@#\$&*~]'));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 2, 15, 37),
//         centerTitle: true,
//         title: const Text(
//           "صفحة تسجيل الدخول !",
//           style: TextStyle(
//             fontSize: 25,
//             color: Color.fromARGB(255, 255, 255, 255),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Image.asset(
//               "login_blue-removebg-preview.png",
//               height: 200,
//               width: 400,
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                   Focus(
//                     onFocusChange: (hasFocus) {
//                       setState(() {
//                         showPasswordHints =
//                             hasFocus && passwordController.text.isNotEmpty;
//                       });
//                     },
//                     child: TextFormField(
//                       controller: emailController,
//                       obscureText: isEmailSecured,
//                       decoration: InputDecoration(
//                         label: Align(
//                           alignment: Alignment.centerRight,
//                           child: Text("... يرجى كتابة الإيميل هنا"),
//                         ),
//                         prefixIcon: Icon(Icons.email),
//                         suffixIcon: Padding(
//                           padding: const EdgeInsets.only(right: 5.0),
//                           child: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 isEmailSecured = !isEmailSecured;
//                               });
//                             },
//                             icon: Icon(Icons.remove_red_eye),
//                           ),
//                         ),
//                         border: OutlineInputBorder(borderSide: BorderSide()),
//                         errorText: !isValidEmail
//                             ? 'يجب أن يحتوي الإيميل على "@" وينتهي بـ ".com"'
//                             : null,
//                         errorStyle: TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   Focus(
//                     onFocusChange: (hasFocus) {
//                       setState(() {
//                         showPasswordHints =
//                             hasFocus && passwordController.text.isNotEmpty;
//                       });
//                     },
//                     child: TextFormField(
//                       controller: passwordController,
//                       obscureText: isSecured,
//                       onChanged: _validatePassword,
//                       decoration: InputDecoration(
//                         label: Align(
//                           alignment: Alignment.centerRight,
//                           child: Text("... يرجى كتابة الرقم السري هنا"),
//                         ),
//                         suffixIcon: Icon(Icons.lock),
//                         prefixIcon: Padding(
//                           padding: const EdgeInsets.only(right: 5.0),
//                           child: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 isSecured = !isSecured;
//                               });
//                             },
//                             icon: Icon(Icons.remove_red_eye),
//                           ),
//                         ),
//                         border: OutlineInputBorder(borderSide: BorderSide()),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   if (showPasswordHints)
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "يجب أن تحتوي على حرف كبير",
//                             style: TextStyle(
//                               color: hasUpperCase ? Colors.green : Colors.red,
//                               fontSize: 12,
//                             ),
//                           ),
//                           Text(
//                             "يجب أن تكون مكونة من 6 أحرف على الأقل",
//                             style: TextStyle(
//                               color: isLongEnough ? Colors.green : Colors.red,
//                               fontSize: 12,
//                             ),
//                           ),
//                           Text(
//                             "يجب أن تحتوي على رقم",
//                             style: TextStyle(
//                               color: hasDigit ? Colors.green : Colors.red,
//                               fontSize: 12,
//                             ),
//                           ),
//                           Text(
//                             "يجب أن تحتوي على رمز خاص",
//                             style: TextStyle(
//                               color: hasSpecialCharacter
//                                   ? Colors.green
//                                   : Colors.red,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   InkWell(
//                     onTap: _checkCredentials,
//                     child: Container(
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.blue,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.login_outlined,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             "تسجيل دخول",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     _message,
//                     style: TextStyle(
//                       color: _messageColor,
//                       fontSize: 18,
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

// // صفحة العداد
// class CounterPage extends StatefulWidget {
//   const CounterPage({super.key});

//   @override
//   State<CounterPage> createState() => _CounterPageState();
// }

// class _CounterPageState extends State<CounterPage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('صفحة العداد'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _incrementCounter,
//               child: Text('زيادة العداد'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'قيمة العداد: $_counter',
//               style: TextStyle(fontSize: 24),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ignore: duplicate_ignore
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'المسبحة الذكية',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

bool isSecured = true;

Map<String, User> users = {
  "bassam@gmail.com": User(email: 'bassam@gmail.com', password: 'Test@1234'),
  "anas@gmail.com": User(email: 'anas@gmail.com', password: 'Password@123'),
};

class User {
  String email;
  String password;

  User({required this.email, required this.password});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _message = '';
  Color _messageColor = Colors.black;
  bool showPasswordHints = false;

  bool hasUpperCase = false;
  bool isLongEnough = false;
  bool hasDigit = false;
  bool hasSpecialCharacter = false;
  bool isValidEmail = true;
  bool isEmailSecured = false;

  void _checkCredentials() {
    String email = emailController.text;
    String password = passwordController.text;

    setState(() {
      isValidEmail = email.contains('@') && email.endsWith('.com');
      hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      isLongEnough = password.length >= 6;
      hasDigit = password.contains(RegExp(r'\d'));
      hasSpecialCharacter = password.contains(RegExp(r'[!@#\$&*~]'));
    });

    if (!isValidEmail) {
      setState(() {
        _message = 'يجب أن يحتوي الإيميل على "@" وينتهي بـ ".com"';
        _messageColor = Colors.red;
      });
      return;
    }

    if (!hasUpperCase || !isLongEnough || !hasDigit || !hasSpecialCharacter) {
      setState(() {
        _message = 'كلمة السر غير صحيحة';
        _messageColor = Colors.red;
        showPasswordHints = true;
      });
      return;
    }

    if (users.containsKey(email)) {
      if (users[email]!.password == password) {
        setState(() {
          _message = 'تم تسجيل الدخول بنجاح';
          _messageColor = Colors.green;
        });
        // التوجيه إلى صفحة المسبحة عند تسجيل الدخول بنجاح
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homescreen()),
        );
      } else {
        setState(() {
          _message = 'كلمة السر غير مسجلة بالنظام';
          _messageColor = Colors.red;
        });
      }
    } else {
      setState(() {
        _message = 'البريد الإلكتروني غير مسجل بالنظام';
        _messageColor = Colors.red;
      });
    }
  }

  void _validatePassword(String password) {
    setState(() {
      hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      isLongEnough = password.length >= 6;
      hasDigit = password.contains(RegExp(r'\d'));
      hasSpecialCharacter = password.contains(RegExp(r'[!@#\$&*~]'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF020F25),
        centerTitle: true,
        title: const Text(
          "صفحة تسجيل الدخول !",
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "login_blue-removebg-preview.png",
              height: 200,
              width: 400,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        showPasswordHints =
                            hasFocus && passwordController.text.isNotEmpty;
                      });
                    },
                    child: TextFormField(
                      controller: emailController,
                      obscureText: isEmailSecured,
                      decoration: InputDecoration(
                        label: Align(
                          alignment: Alignment.centerRight,
                          child: Text("... يرجى كتابة الإيميل هنا"),
                        ),
                        prefixIcon: Icon(Icons.email),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isEmailSecured = !isEmailSecured;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        errorText: !isValidEmail
                            ? 'يجب أن يحتوي الإيميل على "@" وينتهي بـ ".com"'
                            : null,
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        showPasswordHints =
                            hasFocus && passwordController.text.isNotEmpty;
                      });
                    },
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: isSecured,
                      onChanged: _validatePassword,
                      decoration: InputDecoration(
                        label: Align(
                          alignment: Alignment.centerRight,
                          child: Text("... يرجى كتابة الرقم السري هنا"),
                        ),
                        suffixIcon: Icon(Icons.lock),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isSecured = !isSecured;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (showPasswordHints)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "يجب أن تحتوي على حرف كبير",
                            style: TextStyle(
                              color: hasUpperCase ? Colors.green : Colors.red,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "يجب أن تكون مكونة من 6 أحرف على الأقل",
                            style: TextStyle(
                              color: isLongEnough ? Colors.green : Colors.red,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "يجب أن تحتوي على رقم",
                            style: TextStyle(
                              color: hasDigit ? Colors.green : Colors.red,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "يجب أن تحتوي على رمز خاص",
                            style: TextStyle(
                              color: hasSpecialCharacter
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: _checkCredentials,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "تسجيل دخول",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _message,
                    style: TextStyle(
                      color: _messageColor,
                      fontSize: 18,
                    ),
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

// صفحة المسبحة
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int count = 0;

  counter() {
    setState(() {
      count++;
    });
  }

  reset() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF020F25),
        centerTitle: true,
        title: Text(
          "اسْتَغْفِرُوا رَبَّكُمْ إِنَّهُ كَانَ غَفَّارًا",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Color(0xFF020F25),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.50,
                  height: MediaQuery.of(context).size.width / 1.50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 38, 26),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 9),
                            color: Colors.white.withOpacity(.5),
                            spreadRadius: 8,
                            blurRadius: 20)
                      ]),
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Text(
                        count.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Transform.translate(
                  offset: Offset(0, -0),
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 26, 38, 26),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              color: Colors.white.withOpacity(.5),
                              spreadRadius: 5,
                              blurRadius: 5),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => counter(),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 32, 45, 33),
                                shape: BoxShape.circle),
                          ),
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size(80, 80)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => reset(),
                              child: Icon(
                                Icons.wifi_protected_setup_sharp,
                                size: 33,
                              ),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.red, elevation: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
