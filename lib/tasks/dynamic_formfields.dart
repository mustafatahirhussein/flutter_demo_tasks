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

  List<Map<String, dynamic>> data = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      ) : Form(
        key: _formKey,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              itemCount: widgetList.length,
              itemBuilder: (context, i) => buildFormField(i)
            ),

            ElevatedButton(onPressed: () {

              showModalBottomSheet(context: context, builder: (context) {
                return ListView(
                  shrinkWrap: true,
                  children: data.map((e) => ListTile(
                    title: CustomText(
                      text: e['course'].toString().trim(),
                      color: const Color(0xff000000),
                      align: TextAlign.start,
                    ),
                  )).toList(),
                );
              });

            }, child: CustomText(text: "Show",),),

            ElevatedButton(onPressed: () {

              if(_formKey.currentState!.validate()) {
                debugPrint('done');
              }
            }, child: CustomText(text: "Validate",),),
          ],
        ),
      ),

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
        onChanged: (val) => saveValue(count + 1, val),
        validator: (val) => val!.isEmpty ? 'Required' : null,
      ),
      trailing: InkWell(child: const Icon(Icons.delete, color: Colors.red,), onTap: () {
        setState(() {
          widgetList.removeAt(count);
          formFieldCount--;

          /// Remove data from list<map>
          data.removeAt(count);
        });
      },),
    );
  }

  dynamic saveValue(int index, String value) {
    bool valueFound = false;

    for (int j = 0; j < data.length; j++) {
      if (data[j].containsKey("course_id")) {
        if (data[j]["course_id"] == index) {
          valueFound = !valueFound;
          break;
        }
      }
    }

    /// If value is found
    if (valueFound) {
      data.removeWhere((e) => e["course_id"] == index);
    }
    data.add({
      'course_id': index,
      'course': value,
    });
  }
}
