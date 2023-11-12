import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shuvo_shop_test/pages/student/series_home.dart';
import 'package:shuvo_shop_test/widgets/import_all_files.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection(AppConstraints.seriesName).get(),
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
                itemBuilder: (context,index){
                  String id=snapshot.data!.docs[index].id;
                  var name=(snapshot.data!.docs[index].data() as Map)['series'];
                  // print((sss as Map)['series']);
                  return ListTile(
                    title: Text(name),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SeriesHomeScreen(int.parse(id))));
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
