import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/services/target-service.dart';
import 'package:objective/styles/component.dart';
import 'package:objective/widgets/add-button.dart';
import 'package:objective/widgets/base-input-add.dart';
import 'package:objective/widgets/loading.dart';

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

class AddTargetScreen extends StatefulWidget {
  @override
  _AddTargetScreenState createState() => _AddTargetScreenState();
}

class _AddTargetScreenState extends State<AddTargetScreen> {
  var _titleCtlr = TextEditingController();
  var _desCtlr = TextEditingController();
  bool isLoading = false;

  List _times = ['Ngày', 'Tuần', 'Tháng', 'Năm'];
  String _timeVal;

  List _isPriority = ['Yes', 'No'];
  String _bolVal;

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      backgroundColor: CommonStyle.whiteColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  Text(
                    'Create a target to achieve',
                    style: CommonStyle.boldText(context, textSize: 20),
                  ),
                  const SizedBox(height: 15),
                  TextInputAdd(
                    hint: 'Title',
                    textCtrl: _titleCtlr,
                    validator: (val) => val.isEmpty ? 'Title can not be empty!' : null,
                  ),
                  const SizedBox(height: 20),
                  TextInputAdd(
                    hint: 'Description',
                    textCtrl: _desCtlr,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: CommonStyle.primaryColor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(Constant.borderRadius)),
                          color: Colors.grey[200].withOpacity(0.5),
                        ),
                        child: DropdownButton(
                          hint: Text('Select time'),
                          underline: const Text(''),
                          value: _timeVal,
                          style: TextStyle(
                            color: CommonStyle.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: CommonStyle.primaryColor,
                            size: 30,
                          ),
                          onChanged: (val) {
                            setState(() {
                              _timeVal = val;
                            });
                          },
                          items: _times.map((val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(val),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: CommonStyle.primaryColor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(Constant.borderRadius)),
                          color: Colors.grey[200].withOpacity(0.5),
                        ),
                        child: DropdownButton(
                          hint: Text('Priority'),
                          value: _bolVal,
                          underline: const Text(''),
                          style: TextStyle(
                            color: CommonStyle.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: CommonStyle.primaryColor,
                            size: 30,
                          ),
                          onChanged: (val) {
                            setState(() {
                              _bolVal = val;
                            });
                          },
                          items: _isPriority.map((val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(val),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  _addSubtask(context),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddButton(
                        color: Color(0XFFF1F5FC),
                        colorText: Color(0XFF808080),
                        text: 'Cancel',
                        onPress: () => Navigator.of(context).pop(),
                      ),
                      AddButton(
                        onPress: () {
                          _addTarget().then((value) {
                            if (value) {
                              _titleCtlr.clear();
                              _desCtlr.clear();
                            }
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          isLoading
              ? Padding(
                  padding: EdgeInsets.only(bottom: height),
                  child: LoadingWidget(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Future<bool> _addTarget() async {
    if (!_formKey.currentState.validate()) {
      return false;
    }
    setState(() {
      isLoading = true;
    });
    Map map = new Map();
    map['title'] = capitalize(_titleCtlr.text);
    map['description'] = capitalize(_desCtlr.text);
    map['time'] = _timeVal;
    map['isPriority'] = _bolVal == 'Yes' ? true : false;
    final response = await TargetService.addTarget(map);
    if (response.data == null) {
      return false;
    }
    setState(() {
      isLoading = false;
    });
    return true;
  }

  DottedBorder _addSubtask(BuildContext context) {
    return DottedBorder(
      color: CommonStyle.primaryColor,
      strokeWidth: 1,
      dashPattern: [6, 6],
      radius: Radius.circular(Constant.borderRadius),
      borderType: BorderType.RRect,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(Constant.borderRadius)),
        child: Container(
          height: 46,
          child: TextFormField(
            // controller: textCtrl,
            style: TextStyle(
              fontSize: 15,
              color: CommonStyle.primaryColor,
              fontWeight: FontWeight.w400,
            ),
            decoration: new InputDecoration(
              hintText: 'Create sub-task',
              fillColor: Colors.grey[200].withOpacity(0.5),
              filled: true,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 11, left: 12),
              suffixIcon: new Icon(
                Icons.add_circle_outline,
                color: CommonStyle.primaryColor,
                size: 35,
              ),
              hintStyle: CommonStyle.defaultText(context, color: CommonStyle.primaryColor),
            ),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
