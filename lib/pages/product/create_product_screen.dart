import 'package:shuvo_shop_test/models/product_model.dart';
import 'package:shuvo_shop_test/widgets/custom_message.dart';

import '../../widgets/import_all_files.dart';

class CreateProductScreen extends StatelessWidget {
  static const route = '/createProduct';

  CreateProductScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, authProvider, child) => Scaffold(
              appBar: AppBar(
                title: Text('Create Product'),
              ),
              body: ListView(
                children: [
                  InkWell(
                    onTap: () {
                      authProvider.pickImage();
                    },
                    child: Container(
                      height: 200,
                      width: getScreenWidth(),
                      alignment: Alignment.center,
                      child: authProvider.productImage == null
                          ? Text('No Image Selected')
                          : Image.file(authProvider.productImage!, height: 200, width: getScreenWidth(), fit: BoxFit.fill),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Select Category: ')),
                      Expanded(
                        child: DropdownButton(
                          value: authProvider.selectedCategory,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: authProvider.categoryLists.map((String items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            authProvider.changeCategory(newValue!);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomTextField(controller: nameController, hintText: StringsUtils.enterProductName, inputType: TextInputType.text),
                  SizedBox(height: 10),
                  CustomTextField(controller: priceController, hintText: StringsUtils.enterProductPrice, inputType: TextInputType.number),
                  SizedBox(height: 10),
                  authProvider.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () {
                            ProductModel productModel = ProductModel(
                                id: DateTime.now().microsecondsSinceEpoch,
                                name: nameController.text,
                                category: authProvider.selectedCategory,
                                price: int.parse(priceController.text),
                                imageUrl: authProvider.imageUrl);

                            authProvider.uploadProduct(productModel, (int value) {
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
