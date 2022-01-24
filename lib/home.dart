// import 'package:flash_cards/services/api.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Container(
//         child: FutureBuilder<List<DataTable>>(
//           future: API().getAPI(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   // var results = sources![index];
//                   return Container(
//                     height: 250,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       children: [
//                         // Card(
//                         //   elevation: 6,
//                         //   child: Image.network(
//                         //     results,
//                         //     fit: BoxFit.cover,
//                         //     height: 150,
//                         //     width: 300,
//                         //   ),
//                         //   // Text(results.type),
//                         // ),
//                         // Text(results),
//                         // Text(results),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     ));
//   }
// }
