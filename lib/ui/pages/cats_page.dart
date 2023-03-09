import 'package:dogs/bloc/get_dogs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../bloc/get_cats_bloc.dart';

class CatsPage extends StatefulWidget {
  const CatsPage({Key? key}) : super(key: key);

  @override
  _CatsPageState createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  late final ValueNotifier<int> _currentVal = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              // NumberPicker(
              //   minValue: 1,
              //   maxValue: 50,
              //   value: _currentVal.value,
              //   onChanged: (val) {
              //     _currentVal.value = val;
              //     setState(() {});
              //   },
              // ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<GetCatsBloc>(context).add(GetCatsDataEvent());
                },
                child: const Text('get image'),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Expanded(
            child: BlocBuilder<GetCatsBloc, GetCatsState>(
              builder: (context, state) {
                if (state is GetCatsSuccess) {
                  return Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Image.network(
                      state.model.file ?? '',
                      fit: BoxFit.fill,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
