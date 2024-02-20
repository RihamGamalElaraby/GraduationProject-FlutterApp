import 'package:comfyview/cubit/cubit.dart';
import 'package:comfyview/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalLayout extends StatefulWidget {
  const GlobalLayout({super.key});

  @override
  State<GlobalLayout> createState() => _GlobalLayoutState();
}

class _GlobalLayoutState extends State<GlobalLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComfyviewCubit, ComfyviewState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leadingWidth: 100,
            backgroundColor: Colors.white,
            title: const Text(
              'Comfy View',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            actions: [
              // IconButton(
              //     padding: EdgeInsets.all(0),
              //     onPressed: () {
              //       Navigator.pushNamed(context, 'lostandfound');
              //     },
              //     icon: Icon(
              //       Icons.search,
              //       size: 25,
              //       color: Colors.blue,
              //     )),
              IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    // navigatTo(context, LostAndFound());
                    Navigator.pushNamed(context, 'profileScreen');
                  },
                  icon: const Icon(
                    Icons.person_3_sharp,
                    size: 25,
                    color: Colors.blue,
                  )),
            ],
          ),
          body: ComfyviewCubit.get(context)
              .screens[ComfyviewCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                ComfyviewCubit.get(context).changeBottomIndex(index);
              },
              currentIndex: ComfyviewCubit.get(context).currentIndex,
              elevation: 100,
              selectedItemColor: Colors.blue,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    label: 'Result',
                    icon: Icon(
                      Icons.front_hand_rounded,
                    )),
                BottomNavigationBarItem(
                    label: 'Lost&Found',
                    icon: Icon(
                      Icons.search,
                    )),
                BottomNavigationBarItem(
                    label: 'Shoping',
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                    )),
                BottomNavigationBarItem(
                    label: 'Setting',
                    icon: Icon(
                      Icons.settings,
                    )),
              ]),
        );
      },
    );
  }
}
