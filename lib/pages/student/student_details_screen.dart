import 'package:shuvo_shop_test/models/student_model.dart';
import 'package:shuvo_shop_test/widgets/import_all_files.dart';

class StudentDetailsScreen extends StatelessWidget {
  final StudentModel studentModel;
  const StudentDetailsScreen(this.studentModel,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(studentModel.id!),
          Text(studentModel.name!),
          Text(studentModel.department!),
          Text(studentModel.phone!),
        ],
      ),
    );
  }
}
