import 'package:flutter/material.dart';

class EcommerceScreen extends StatelessWidget {
  const EcommerceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: CircleAvatar(
                radius: 105,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor:
                      Colors.grey[200], // Add background color for border
                  child: const CircleAvatar(
                    radius: 145,
                    backgroundImage: AssetImage('images/boarding2.jpg'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Product Information
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Comfy View Glove',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Price: \$1000',
                      style: TextStyle(
                        color: Colors.teal[900],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Price: \$1500',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add to Cart Functionality
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Product Description
            const Text(
              'Product Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed faucibus elit ligula, vel ullamcorper orci volutpat eget. Donec auctor, sem vel tristique feugiat, velit justo convallis lorem, et consectetur lacus orci id nulla. Quisque sed arcu in nunc lacinia eleifend. Proin non lacus nec tellus vestibulum fermentum. Aliquam tincidunt velit sit amet augue luctus, nec vestibulum magna malesuada.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';

// class EcommerceScreen extends StatelessWidget {
//   const EcommerceScreen({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   image: DecorationImage(
//                     image: AssetImage('images/boarding2.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: 10,
//                       right: 10,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.grey.withOpacity(0.5),
//                         child: IconButton(
//                           onPressed: () {
//                             // Handle favorite button press
//                           },
//                           icon: Icon(
//                             Icons.favorite,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Product Information
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Comfy View Glove',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Text(
//                       'Price: \$1000',
//                       style: TextStyle(
//                         color: Colors.teal[900],
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       'Price: \$1500',
//                       style: TextStyle(
//                         decoration: TextDecoration.lineThrough,
//                         color: Colors.grey,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Add to Cart Functionality
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 12, horizontal: 24),
//                     backgroundColor: Colors.blue,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   child: Text(
//                     'Add to Cart',
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             // Product Description
//             Text(
//               'Product Description',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed faucibus elit ligula, vel ullamcorper orci volutpat eget. Donec auctor, sem vel tristique feugiat, velit justo convallis lorem, et consectetur lacus orci id nulla. Quisque sed arcu in nunc lacinia eleifend. Proin non lacus nec tellus vestibulum fermentum. Aliquam tincidunt velit sit amet augue luctus, nec vestibulum magna malesuada.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             // Similar Products
//           ],
//         ),
//       ),
//     );
//   }
// }
