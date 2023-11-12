import 'package:shuvo_shop_test/models/product_model.dart';
import 'package:shuvo_shop_test/widgets/custom_message.dart';

import '../../models/student_model.dart';
import '../../widgets/import_all_files.dart';

class AddStudentScreen extends StatelessWidget {
  static const route = '/addProduct';

  AddStudentScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, authProvider, child) => Scaffold(
          appBar: AppBar(
            title: Text('Create Student'),
          ),
          body: ListView(
            children: [

              Row(
                children: [
                  Expanded(child: Text('Select Series: ')),
                  Expanded(
                    child: DropdownButton(
                      value: authProvider.selectSeries,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: authProvider.seriesLists.map((String items) {
                        return DropdownMenuItem(value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String? newValue) {
                        authProvider.changeSeries(newValue!);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomTextField(controller: idController, hintText: 'Student ID', inputType: TextInputType.number),
              SizedBox(height: 10),
              CustomTextField(controller: nameController, hintText: 'Student Name', inputType: TextInputType.text),
              SizedBox(height: 10),
              CustomTextField(controller: phoneController, hintText: 'Phone Number', inputType: TextInputType.number),
              SizedBox(height: 10),
              CustomTextField(controller: departmentController, hintText: 'Department', inputType: TextInputType.text),
              SizedBox(height: 10),
              authProvider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                  onPressed: () {
                    StudentModel productModel = StudentModel(
                        id: idController.text,
                        name: nameController.text,
                        phone: phoneController.text,
                        department: departmentController.text);

                    authProvider.addStudentRecord(productModel, (int value) {
                      if (value == 1) {
                        showSnackBarMessage('Successfully uploaded',isError: false);
                        Navigator.of(context).pop();
                      } else {
                        showSnackBarMessage('Failed to upload product');
                      }
                    });
                  },
                  child: Text('Add'))
            ],
          ),
        ));
  }
}
