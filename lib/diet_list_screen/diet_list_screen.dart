import 'package:diet_diary/add_screen/diet_add_screen.dart';
import 'package:diet_diary/detail_screen/detail_screen.dart';
import 'package:diet_diary/repository/realm_repository.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import '../model/diet.dart';

class DietListScreen extends StatefulWidget {
  DietListScreen({super.key});

  @override
  State<DietListScreen> createState() => _DietListScreenState();
}

class _DietListScreenState extends State<DietListScreen> {
  ScrollController _controller = ScrollController();
  RealmRepository repository = RealmRepository.instance;

  List<Diet> _models = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _models = repository.model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('식단 기록'),
          actions: [
            iconButtonWidget(onPressed: () async {
              Diet result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DietAddScreen(),
                    fullscreenDialog: true),
              );

              setState(() {
                _models.add(result);
                repository.save(_models);
                print('???');
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
