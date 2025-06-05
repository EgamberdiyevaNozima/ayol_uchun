// import 'package:ayol_uchun_project/features/login/widgets/parol_tasdiq.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class Confirmation extends StatefulWidget {
//   Confirmation({super.key});
//
//   @override
//   State<Confirmation> createState() => _ConfirmationState();
// }
//
// class _ConfirmationState extends State<Confirmation> {
//   final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
//   final List<TextEditingController> _controllers =
//   List.generate(6, (_) => TextEditingController());
//
//   @override
//   void dispose() {
//     for (var node in _focusNodes) {
//       node.dispose();
//     }
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//   void _onChanged(int index, String value) {
//     if (value.isNotEmpty && index < 5) {
//       _focusNodes[index + 1].requestFocus();
//     } else if (value.isEmpty && index > 0) {
//       _focusNodes[index - 1].requestFocus();
//     }
//   }
//
//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) => Center(
//         child: Container(
//           width: 335,
//           height: 265,
//           padding: EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xFFE84266).withOpacity(0.1),
//                 ),
//                 child: Center(
//                   child: SvgPicture.asset(
//                     'assets/icons/check.svg',
//                     width: 32,
//                     height: 32,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 "Telefon raqamingiz\nmuvaffaqiyatli tasdiqlandi",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//               ),
//               Spacer(),
//               SizedBox(
//                 width: 295,
//                 height: 44,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFFE84266),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     'Tushunarli',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/background.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           SafeArea(
//             child: Column(
//               children: [
//                 SizedBox(height: 30),
//                 Container(
//                   width: 335,
//                   height: 60.5,
//                   margin: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.symmetric(horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         'assets/icons/check.svg',
//                         width: 20,
//                         height: 20,
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           'Telefon raqamingizga tasdiqlash\n kodi yuborildi',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Text(
//                   'Xush kelibsiz!',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24),
//                   child: Text(
//                     "O'quv platformasiga kirish uchun quyida telefon raqamingizga yuborilgan tasdiqlash kodini kiriting",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Text(
//                   "Tasdiqlash kodi",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(6, (index) {
//                     return Container(
//                       width: 50,
//                       height: 49,
//                       margin: EdgeInsets.symmetric(horizontal: 4),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: TextField(
//                         controller: _controllers[index],
//                         focusNode: _focusNodes[index],
//                         keyboardType: TextInputType.number,
//                         textAlign: TextAlign.center,
//                         maxLength: 1,
//                         style: TextStyle(fontSize: 20),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           counterText: '',
//                         ),
//                         onChanged: (value) => _onChanged(index, value),
//                       ),
//                     );
//                   }),
//                 ),
//                 SizedBox(height: 350),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24),
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFFE84266),
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       minimumSize: Size(double.infinity, 0),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => ParolTasdiq()),
//                       );
//                     },
//
//                     child: Text(
//                       'Kirish',
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Confirmation extends StatefulWidget {
  Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: Container(
          width: 335,
          height: 265,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE84266).withOpacity(0.1),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/check.svg',
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Telefon raqamingiz\nmuvaffaqiyatli tasdiqlandi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Spacer(),
              SizedBox(
                width: 295,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE84266),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Tushunarli',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  width: 335,
                  height: 60.5,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/check.svg',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Telefon raqamingizga tasdiqlash\n kodi yuborildi',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Xush kelibsiz!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "O'quv platformasiga kirish uchun quyida telefon raqamingizga yuborilgan tasdiqlash kodini kiriting",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  "Tasdiqlash kodi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return Container(
                      width: 50,
                      height: 49,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        onChanged: (value) => _onChanged(index, value),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 350),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE84266),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(double.infinity, 0),
                    ),
                    onPressed: () {
                      String code = _controllers.map((c) => c.text).join();
                      if (code.length == 6) {
                        _showSuccessDialog();
                      }
                    },
                    child: Text(
                      'Kirish',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}