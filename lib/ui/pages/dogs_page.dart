import 'package:dogs/bloc/get_dogs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

class DogsPage extends StatefulWidget {
  const DogsPage({super.key});

  @override
  State<DogsPage> createState() => _DogsPageState();
}

class _DogsPageState extends State<DogsPage> {
  int _currentVal = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              NumberPicker(
                  minValue: 1,
                  maxValue: 50,
                  value: _currentVal,
                  onChanged: (val) {
                    _currentVal = val;
                    setState(() {});
                  }),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<GetDogsBloc>(context).add(
                    GetDataEvent(count: _currentVal),
                  );
                },
                child: const Text('get image'),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Expanded(
            child: BlocBuilder<GetDogsBloc, GetDogsState>(
              builder: (context, state) {
                if (state is GetDogsSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.model.message?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Image.network(
                          state.model.message?[index] ?? '',
                          fit: BoxFit.fill,
                        ),
                      ),
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
