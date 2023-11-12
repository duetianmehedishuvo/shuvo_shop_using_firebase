import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shuvo_shop_test/models/student_model.dart';
import 'package:shuvo_shop_test/pages/student/student_details_screen.dart';
import 'package:shuvo_shop_test/widgets/import_all_files.dart';

class SeriesHomeScreen extends StatelessWidget {
  final int id;

  const SeriesHomeScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection(AppConstraints.series)
            .doc('data')
            .collection('$id Series').get(),
        builder: (context, snapshot) {
          print(snapshot.data!.docs[0].id);

          if (snapshot.data!.docs.isEmpty) {
            return SizedBox(
              width: 80,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasData) {
            // print(snapshot);
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  // String id = snapshot.data!.docs[index].id;
                  // var name = (snapshot.data!.docs[index].data() as Map)['name'];
                  // var department = (snapshot.data!.docs[index].data() as Map)['department'];

                  StudentModel studentModel=StudentModel.fromJson((snapshot.data!.docs[index].data() as Map));
                  // print((sss as Map)['series']);
                  return ListTile(
                    title: Text(studentModel.name!),
                    trailing: Text(studentModel.department!),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>StudentDetailsScreen(studentModel)));
                    },
                  );
                });
          }
          // print(snapshot.data!.docs[0]['downloadURL']);
          return const SizedBox(
            width: 80,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
