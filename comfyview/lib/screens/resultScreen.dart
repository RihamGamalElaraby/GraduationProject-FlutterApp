import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfyview/models/resultModel.dart';
import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ResultSModel>>(
      stream: _getResultsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text('No data available.'),
          );
        } else {
          final List<ResultSModel> resultList = snapshot.data!;
          return ListView.separated(
            itemCount: resultList.length,
            itemBuilder: (context, index) {
              final ResultSModel result = resultList[index];
              String imageUrl = result.image != null
                  ? 'https://firebasestorage.googleapis.com/v0/b/graduation2-fb874.appspot.com/o/${result.image}?alt=media&token=e70013b4-482c-4495-875e-95ccdd7b5d65'
                  : 'images/faceprint.png'; // Default placeholder image
              return InkWell(
                onTap: () {
                  // Handle onTap event
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Result',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            SizedBox(height: 8),
                            if (result.result != null &&
                                result.result!.isNotEmpty) ...[
                              ...result.result!.entries.map<Widget>(
                                (entry) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${entry.key}:',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Flexible(
                                              child: Text(
                                                '${entry.value}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                    ],
                                  );
                                },
                              ),
                            ],
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.blue),
                                SizedBox(width: 4),
                                Text(
                                  'GPS Location: Add GPS location here', // Replace with actual GPS location
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.access_time, color: Colors.blue),
                                SizedBox(width: 4),
                                Text(
                                  'Time: Add time here', // Replace with actual time
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        }
      },
    );
  }

  Stream<List<ResultSModel>> _getResultsStream() {
    final CollectionReference resultsCollection =
        FirebaseFirestore.instance.collection('Results');

    return resultsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ResultSModel(
          image: data['image'],
          result: data['result'] as Map<String, dynamic>?,
        );
      }).toList();
    });
  }
}
