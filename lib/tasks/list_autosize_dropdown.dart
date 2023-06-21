class ListAutoSizeDropdown extends StatefulWidget {
  const ListAutoSizeDropdown({Key? key}) : super(key: key);

  @override
  State<ListAutoSizeDropdown> createState() => _MyAppState();
}

class _MyAppState extends State<ListAutoSizeDropdown> {

  String initial = "Test";
  List<String> list = [
    'Test', 'Lorem Ipsum', "It's a very good approach", "Nice to see you again clever boy",

    """Lorem ipsum dolor sit amet. Sit atque dolorum aut dignissimos quaerat ut eligendi facere et dolores minus qui deserunt molestias. Sit ipsum optio est eveniet repellendus 33 excepturi ullam et quia accusamus est voluptatem cupiditate.""",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 15,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: initial.length * 14.0,
                    child: DropdownButton<String>(
                      value: initial,
                      onChanged: (String? newValue) {
                        setState(() {
                          initial = newValue!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      isExpanded: true,
                      isDense: false,
                      underline: SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            );

          },
        ),
      ),
    );
  }
}