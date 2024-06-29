// import 'package:comfyview/screens/lostAndFound/cubit/LostAndFoundcubit.dart';
// import 'package:comfyview/screens/lostAndFound/cubit/lostAndFoundStates.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:maps_launcher/maps_launcher.dart';

// class LostAndFound extends StatelessWidget {
//   LostAndFound({Key? key}) : super(key: key);

//   final searchController = TextEditingController();

//   void _onSearchButtonPressed(BuildContext context) {
//     LostAndFoundCubit.get(context)
//         .LocationBack(searchValue: searchController.text);
//   }

//   void _openMaps(BuildContext context, String location) {
//     MapsLauncher.launchQuery(location);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: true,
//       body: BlocConsumer<LostAndFoundCubit, LostAndFoundStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Lost and Found',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     controller: searchController,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                       labelText: 'Search',
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(color: Colors.blue),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                       contentPadding:
//                           const EdgeInsets.symmetric(vertical: 15.0),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide:
//                             BorderSide(color: Colors.blue.withOpacity(0.5)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(color: Colors.blue),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () => _onSearchButtonPressed(context),
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Search',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Divider(
//                     thickness: 1,
//                     color: Colors.black,
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Results',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     height: MediaQuery.of(context).size.height *
//                         0.5, // Adjust the height as needed
//                     child: state is LoadingStatesLost
//                         ? const Center(child: CircularProgressIndicator())
//                         : state is FailStatesLost
//                             ? const Center(
//                                 child: Text(
//                                   'No results found or an error occurred.',
//                                   style: TextStyle(
//                                       color: Colors.red, fontSize: 16),
//                                 ),
//                               )
//                             : ListView.separated(
//                                 itemBuilder: (context, index) => Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   elevation: 4,
//                                   margin:
//                                       const EdgeInsets.symmetric(vertical: 10),
//                                   child: ListTile(
//                                     onTap: () {},
//                                     contentPadding: const EdgeInsets.all(20.0),
//                                     title: Row(
//                                       children: [
//                                         const Text(
//                                           'Location: ',
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Text(
//                                             LostAndFoundCubit.get(context)
//                                                     .location ??
//                                                 'no location',
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                               color: Colors.blue,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     trailing: IconButton(
//                                       onPressed: () {
//                                         _openMaps(
//                                           context,
//                                           LostAndFoundCubit.get(context)
//                                                   .location ??
//                                               'no location',
//                                         );
//                                       },
//                                       icon: const Icon(Icons.gps_fixed),
//                                     ),
//                                   ),
//                                 ),
//                                 separatorBuilder: (context, index) =>
//                                     const SizedBox(),
//                                 itemCount: 1,
//                               ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:comfyview/screens/lostAndFound/cubit/LostAndFoundcubit.dart';
import 'package:comfyview/screens/lostAndFound/cubit/lostAndFoundStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_launcher/maps_launcher.dart';

class LostAndFound extends StatelessWidget {
  LostAndFound({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  void _onSearchButtonPressed(BuildContext context) {
    LostAndFoundCubit.get(context)
        .LocationBack(searchValue: searchController.text);
  }

  void _openMaps(BuildContext context, String location) {
    if (location.isNotEmpty &&
        Uri.tryParse(location)?.hasAbsolutePath == true) {
      MapsLauncher.launchQuery(location);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid location URL')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<LostAndFoundCubit, LostAndFoundStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lost and Found',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.blue.withOpacity(0.5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _onSearchButtonPressed(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Search',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Results',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: state is LoadingStatesLost
                        ? const Center(child: CircularProgressIndicator())
                        : state is FailStatesLost
                            ? const Center(
                                child: Text(
                                  'No results found or an error occurred.',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                              )
                            : Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 4,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  onTap: () {},
                                  contentPadding: const EdgeInsets.all(20.0),
                                  title: Row(
                                    children: [
                                      const Text(
                                        'Location: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          LostAndFoundCubit.get(context)
                                                  .location ??
                                              'no location',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      _openMaps(
                                        context,
                                        LostAndFoundCubit.get(context)
                                                .location ??
                                            'no location',
                                      );
                                    },
                                    icon: const Icon(Icons.gps_fixed),
                                  ),
                                ),
                              ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
