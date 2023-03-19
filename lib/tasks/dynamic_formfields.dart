import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/widgets/custom_text.dart';

class DynamicFormFields extends StatefulWidget {
  const DynamicFormFields({Key? key}) : super(key: key);

  @override
  _DynamicFormFieldsState createState() => _DynamicFormFieldsState();
}

class _DynamicFormFieldsState extends State<DynamicFormFields> {

  int formFieldCount = 0;
  List<Widget> widgetList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Dynamic Fields",),
      ),

      body: formFieldCount == 0 ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: CustomText(
            text: "No Courses added",
            fontSize: 30,
            color: const Color(0xff000000),
          ),
        ),
      ) : ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        itemCount: widgetList.length,
        itemBuilder: (context, i) => buildFormField(i)
      ),

      // body: ListView(
      //   shrinkWrap: true,
      //   padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      //   children: [
      //     CustomText(
      //       text: "No Courses added",
      //       fontSize: 30,
      //       color: Color(0xff000000),
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        child: CustomText(text: "ADD NEW",),
        onPressed: () {
          setState(() {
            formFieldCount++;
            widgetList.add(buildFormField(formFieldCount));
          });
        },
      ),
    );
  }

  Widget buildFormField(int count) {
    return ListTile(
      leading: CircleAvatar(
        child: CustomText(
          text: (count + 1).toString(),
        ),
      ),
      title: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: "Course ${count+1}"
        ),
      ),
      trailing: const Icon(Icons.delete, color: Colors.red,),
    );
  }
}
