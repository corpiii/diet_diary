import 'package:diet_diary/add_screen/diet_add_screen.dart';
import 'package:diet_diary/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';

import '../model/diet.dart';

class DietListScreen extends StatefulWidget {
  DietListScreen({super.key});

  @override
  State<DietListScreen> createState() => _DietListScreenState();
}

class _DietListScreenState extends State<DietListScreen> {
  ScrollController _controller = ScrollController();

  List<Diet> _models = [
    Diet(title: '12 24 12시', imageBase64: 'dummy', body: 'ㄹㄷ'),
    Diet(title: '12 24 08시', imageBase64: 'dummy', body: 'ㄹㄷ'),
    Diet(title: '12 23 20시', imageBase64: 'dummy', body: 'ㄹㄷ'),
    Diet(title: '12 23 12시', imageBase64: 'dummy', body: 'ㄹㄷ'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _models = load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('식단 리스트'),
          actions: [
            iconButtonWidget(onPressed: () async {
              Diet result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DietAddScreen(),
                    fullscreenDialog: true),
              );

              // save();

              setState(() {
                _models.add(result);
              });
            }),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
              controller: _controller,
              itemCount: _models.length,
              itemBuilder: (BuildContext context, int idx) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            model: _models[idx],
                          ),
                        ),
                      );
                    },
                    title: Center(
                      child: Text(
                        '${_models[idx].title}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(8.0),
                    tileColor: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                );
              }),
        ));
  }

  Widget iconButtonWidget({required void Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: const Icon(
        Icons.add,
        color: Colors.blue,
        size: 30,
      ),
    );
  }
}
