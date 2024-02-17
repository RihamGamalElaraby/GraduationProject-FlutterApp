import 'package:flutter/material.dart';

class LostAndFound extends StatelessWidget {
  LostAndFound({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Write HERE',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: searchController,
            keyboardType: TextInputType.emailAddress,
            // validator: (value) {
            //   if (value == null) {
            //     return 'please enter your email address';
            //   }
            // },
            decoration: InputDecoration(
              label: Text('Search'),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 5.0),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(30, 136, 229, 1), width: 2.0),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Center(
            child: Text(
              'Results',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                  height: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Row(
                                        children: [
                                          Text(
                                            'Open Google Maps: ',
                                            // '${article['publishedAt']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.gps_fixed))
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
        ],
      ),
    );
  }
}