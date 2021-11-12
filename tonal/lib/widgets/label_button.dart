import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tonal/bloc/bubble_bloc.dart';
import 'package:tonal/bloc/bubble_provider.dart';
import 'package:tonal/global/bubble_options.dart';
import 'package:tonal/global/styles.dart';

class LabelButton extends StatefulWidget {
  const LabelButton({Key? key}) : super(key: key);

  @override
  State<LabelButton> createState() => _LabelButtonState();
}

class _LabelButtonState extends State<LabelButton> {
  late BubbleBloc _bubbleBloc;
  late FixedExtentScrollController _labelScrollController;

  @override
  void dispose() {
    _bubbleBloc.dispose();
    _labelScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bubbleBloc = Provider.of<BubbleProvider>(context).bloc;

    return StreamBuilder<Object>(
      stream: _bubbleBloc.labelObservable,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: () async {
            _labelScrollController = FixedExtentScrollController(initialItem: labelList.indexOf("${snapshot.data}"));

            await showModalBottomSheet(
              backgroundColor: Colors.transparent,
              elevation: 0,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 370,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(12, 13, 12, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 220,
                          child: CupertinoPicker(
                            scrollController: _labelScrollController,
                            itemExtent: 40,
                            onSelectedItemChanged: (int index) {},
                            children: labelList.map((e) {
                              return Text(e, style: scrollItemTextStyle);
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _bubbleBloc.setLabel(labelList[_labelScrollController.selectedItem]);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff53a99a)),
                          ),
                          child: const Text(
                            'Set',
                            style: labelTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff53a99a)),
          ),
          child: const Text(
            'Label',
            style: labelTextStyle,
          ),
        );
      },
    );
  }
}
