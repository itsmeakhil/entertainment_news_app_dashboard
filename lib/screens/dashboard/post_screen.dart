import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../widgets/button_field.dart';
import '../widgets/search_field.dart';
import 'add_post_form.dart';

class PostScreen extends StatelessWidget {
   PostScreen({Key? key}) : super(key: key);
  var tableRow =   TableRow();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        //padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        color: adSecondary,
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Row(
                  children: [
                    const Text('Post',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                    const Spacer(),
                    const Expanded(child: SearchTextField(hintText: 'Search By',)),
                    const SizedBox(width: 10,),
                    const SizedBox(width: 10,),
                    ButtonField(text: 'Add',
                      onPressed: (){
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return const Dialog(
                                  elevation: 10.0, child: AddPostForm());
                            });
                      },
                      iconData: Icons.add_circle_outline_outlined,
                      color: adSecondary,)
                  ],
                ),
              ),
              const Divider(),

      Theme(
        data: ThemeData(cardColor: adSecondary, textTheme: TextTheme(caption: TextStyle(color: Colors.black))),
        child: SizedBox(
          width:size.width ,
          child: PaginatedDataTable(
            primary: true,
              onRowsPerPageChanged: (perPage) {},
              rowsPerPage: 10,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Id'),

                ),
                DataColumn(
                  label: Text('Tittle'),
                ),
                DataColumn(
                  label: Text('Category'),
                ),
                DataColumn(
                  label: Text('Post Type'),
                ),
                DataColumn(
                  label: Text('Tags'),
                ),
                DataColumn(
                  label: Text('Rich text'),
                ),
                DataColumn(
                  label: Text('Actions'),
                ),
              ],
              source: tableRow,
          ),
        ),
      ),


            ],
          ),
        ),
      ),
    );
  }
}
class TableRow extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      const DataCell(Text("67665768685768786")),
      const DataCell(Text("News")),
      const DataCell(Text("Entertainment")),
      const DataCell(Text("Type")),
      const DataCell(Text("Tags")),
      const DataCell(Text("Rich")),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline,color: Colors.red,size: 17,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.edit_outlined,color: Colors.grey,size: 17))
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 50;

  @override
  int get selectedRowCount => 0;
}