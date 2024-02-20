import 'package:comfyview/cubit/states.dart';
import 'package:comfyview/screens/LoginSreenCamers.dart';
import 'package:comfyview/shared/reusablecomponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:comfyview/cubit/cubit.dart';

class boardingModel {
  final String image;
  final String title;
  final String body;

  boardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  /*The project aims to provide a comprehensive solution for the blind by using an embedded 
  system to detect and identify objects in the physical world, sending the information to a 
  website and a mobile application, where AI technology is used to describe the objects and their surroundings in real-time.
   The system can also help the blind navigate through obstacles by providing audio and haptic feedback through the mobile 
   application to alert them of potential hazards.*/

  List<boardingModel> boarding = [
    boardingModel(
      image: 'images/logo.png',
      body:
          "The project aims to provide a comprehensive solution for the blind by using an embedded system to detect and identify objects in the physical world",
      title: 'Comfy View App',
    ),
    boardingModel(
      image: 'images/boarding2.jpg',
      body:
          'sending the information to a  website and a mobile application, where AI technology is used to describe the objects and their surroundings in real-time. The system can also help the blind navigate through obstacles by providing audio and haptic feedback through the mobile  application to alert them of potential hazards',
      title: 'Purpose',
    ),
    boardingModel(
      image: 'images/boarding3.jpg',
      body: 'ComfyView@gmail.com',
      title: 'Devolpers',
    ),
  ];
  bool isLast = false;

  var boarderController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComfyviewCubit, ComfyviewState>(
      listener: (context, state) => {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                TextButton(
                    onPressed: () {
                      navigateandreplace(context, LoginScreen());
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      controller: boarderController,
                      onPageChanged: (int index) {
                        if (index == boarding.length - 1) {
                          setState(() {
                            isLast = true;
                          });
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          BuildBoardingItem(boarding[index]),
                      itemCount: boarding.length,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                          controller: boarderController,
                          effect: const ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            dotHeight: 10,
                            expansionFactor: 4,
                            dotWidth: 10,
                            spacing: 5,
                            activeDotColor: Colors.blue,
                          ),
                          count: boarding.length),
                      const Spacer(),
                      FloatingActionButton(
                        onPressed: () {
                          if (isLast) {
                            navigateandreplace(context, LoginScreen());
                          } else {
                            boarderController.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.ease);
                          }
                        },
                        backgroundColor: Colors.blue[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)),
                        child: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ));
      },
    );
  }

  Widget BuildBoardingItem(boardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Image(
            image: AssetImage(model.image),
          )),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.body,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
}
