import 'package:comfyview/cubit/cubit.dart';
import 'package:comfyview/cubit/states.dart';
import 'package:comfyview/screens/LoginSreenCamers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'images/logo.png',
      body:
          "Providing a comprehensive solution for the blind by using an embedded system to detect and identify objects in the physical world.",
      title: 'Welcome to ComfyView',
    ),
    BoardingModel(
      image: 'images/boarding2.jpg',
      body:
          'Using AI technology to describe objects and surroundings in real-time, enabling the blind to navigate through obstacles safely.',
      title: 'Our Mission',
    ),
    BoardingModel(
      image: 'images/boarding3.jpg',
      body: 'Contact us at ComfyView@gmail.com for inquiries and support.',
      title: 'Developers',
    ),
  ];
  bool isLast = false;

  var boarderController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComfyviewCubit, ComfyviewState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
              ),
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
                      setState(() {
                        isLast = index == boarding.length - 1;
                      });
                    },
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        BuildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                  ),
                ),
                const SizedBox(height: 30),
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
                      count: boarding.length,
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if (isLast) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
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
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget BuildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              model.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey[800],
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              model.body,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
}
