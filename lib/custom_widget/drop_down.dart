// import 'package:flutter/material.dart';

// class DropDown extends StatefulWidget {
//   DropDown({super.key, required this.text, required this.result});
//   final String text;
//   late String result;

//   @override
//   State<DropDown> createState() => _DropDownState();
// }

// class _DropDownState extends State<DropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           widget.text,
//           style: const TextStyle(fontSize: 18),
//         ),
//         const SizedBox(width: 23),
//         DropdownButton<String>(
//           value: widget.result,
//           onChanged: (value) {
//             setState(() {
//               widget.result = value as String;
//             });
//           },
//           items: const [
//             DropdownMenuItem(
//               value: 'None',
//               child: Text('None'),
//             ),
//             DropdownMenuItem(
//               value: 'Mild',
//               child: Text('Mild'),
//             ),
//             DropdownMenuItem(
//               value: 'Moderate',
//               child: Text('Moderate'),
//             ),
//             DropdownMenuItem(
//               value: 'Severe',
//               child: Text('Severe'),
//             ),
//             DropdownMenuItem(
//               value: 'Very Severe',
//               child: Text('Very Severe'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
