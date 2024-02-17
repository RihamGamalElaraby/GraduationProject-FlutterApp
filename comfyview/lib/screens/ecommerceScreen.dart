import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EcommerceScreen extends StatelessWidget {
  const EcommerceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              height: 150,
              width: double.infinity,
              child: CarouselSlider(
                items: [
                  'images/faceprint.png',
                  'images/boarding2.jpg',
                  'images/boarding3.jpg',
                ].map((String imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.fill, // Adjust the fit as needed
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: 250.5,
                  initialPage: 0,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200, // Set a fixed height for the image
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Image(
                        height: 200,
                        width: double.infinity,
                        image: AssetImage('images/boarding2.jpg'),
                      ),
                      //  if (model.discount != 0)
                      Container(
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          'DISCOUNT',
                          style: TextStyle(fontSize: 10.0, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Comfy View Glove!',
                  // model.name ?? 'NULL',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Text(
                      'Price: 1000\$ ',
                      // : ${model.price.round()}',
                      style: TextStyle(
                        color: Colors.teal[900],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    // if (model.discount != 0)
                    Text(
                      'Price: 1500\$',
                      //  ${model.old_price.round()}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(), // Add spacer to push the IconButton to the end
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      // SuperMarketCubit.get(context)
                      //         .favourite
                      //         .containsKey(model.id)
                      //     ? SuperMarketCubit.get(context).favourite[model.id]!
                      //         ? Colors.teal
                      //         : Colors.grey
                      //     : Colors.grey,
                      radius: 15.0,
                      child: IconButton(
                        onPressed: () {
                          // SuperMarketCubit.get(context)
                          //     .ChangeFacouriteData(model.id ?? 0);
                          // print(model.id);
                        },
                        icon: Icon(
                          Icons.star,
                          color: const Color.fromARGB(255, 255, 212, 212),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, 'layoutScreen');
                    // if (formKey.currentState!.validate()) {
                    //   LoginCubit.get(context).userLogin(
                    //       email: emailController.text,
                    //       Password: passwarController.text);
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    primary: Color.fromRGBO(30, 136, 229, 1),
                    // Background color
                    onPrimary: Colors.white, // Text color
                    elevation: 10.0, // Elevation
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
