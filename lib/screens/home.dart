import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     String currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());

//     return SafeArea(
//       child: ListView(
//         padding: const EdgeInsets.symmetric(
//           vertical: 35,
//           horizontal: 30
//         ),
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//           )
//         ],
//       ),
//     );
//   }
// }