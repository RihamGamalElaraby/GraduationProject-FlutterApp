import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  const resultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'The Result of the captured \n  photo will appear here',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        // navigateTo(context, WebViewScreen(article['url']));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: CircleAvatar(
                              child: Image(
                                width: double.infinity,
                                image: AssetImage('images/faceprint.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Result:',
                                        // article['title']
                                        //     as String, // Ensure that it's cast to String
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        ' Chair',
                                        // article['title']
                                        //     as String, // Ensure that it's cast to String
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Location: ',
                                        // article['title']
                                        //     as String, // Ensure that it's cast to String
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'https://www.google.com/maps/',
                                          // article['title']
                                          //     as String, // Ensure that it's cast to String
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Time: ',
                                        // '${article['publishedAt']}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      Text(
                                        '09:30 AM',
                                        // '${article['publishedAt']}',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                      color: Colors.blue,
                    ),
                itemCount: 10),
          ),

          ///////////////////////////////
        ],
      ),
    );
  }
}
