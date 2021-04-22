import 'package:flutter/material.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/models/target/target.dart';
import 'package:objective/providers/target-provider.dart';
import 'package:objective/styles/component.dart';
import 'package:objective/widgets/back-arrow.dart';
import 'package:objective/widgets/loading.dart';
import 'package:provider/provider.dart';

class TargetScreen extends StatefulWidget {
  @override
  _TargetScreenState createState() => _TargetScreenState();
}

class _TargetScreenState extends State<TargetScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _isLoading = false;

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    loadTargetsDone();
    loadTargetsNotDone();
    Provider.of<TargetProvider>(context, listen: false).getTarget();
  }

  void loadTargetsDone() {
    List<Target> listDone = Provider.of<TargetProvider>(context, listen: false).listDone;
    if (listDone.isEmpty && this.mounted) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<TargetProvider>(context, listen: false).getTargetDone().then((value) {
        if (!this.mounted) return;
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  void loadTargetsNotDone() {
    List<Target> listNotDone = Provider.of<TargetProvider>(context, listen: false).listNotDone;
    if (listNotDone.isEmpty && this.mounted) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<TargetProvider>(context, listen: false).getTargetNotDone().then((value) {
        if (!this.mounted) return;
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackArrow(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Image.asset('images/target_bg.png'),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.66,
                color: Color(0XFFF4F4F5),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40.0, 12.0, 40.0, 0.0),
                          child: TabBar(
                            controller: _tabController,
                            labelColor: CommonStyle.primaryColor,
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            unselectedLabelColor: Colors.grey,
                            indicatorWeight: 6.0,
                            indicatorPadding: const EdgeInsets.only(top: 1.0),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: ShapeDecoration(
                              shape: RoundedRectangleBorder(),
                              gradient: LinearGradient(
                                colors: [
                                  CommonStyle.primaryColor,
                                  Colors.purple,
                                ],
                              ),
                            ),
                            tabs: [
                              Container(
                                height: 40,
                                width: 50,
                                alignment: Alignment.center,
                                color: Color(0XFFF4F4F5),
                                child: Text('Ngày'),
                              ),
                              Container(
                                height: 40,
                                width: 50,
                                alignment: Alignment.center,
                                color: Color(0XFFF4F4F5),
                                child: Text('Tuần'),
                              ),
                              Container(
                                height: 40,
                                width: 50,
                                alignment: Alignment.center,
                                color: Color(0XFFF4F4F5),
                                child: Text('Tháng'),
                              ),
                              Container(
                                height: 40,
                                width: 50,
                                alignment: Alignment.center,
                                color: Color(0XFFF4F4F5),
                                child: Text('Năm'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 22.0),
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                _isLoading
                                    ? LoadingWidget(padding: 140)
                                    : Consumer<TargetProvider>(
                                        builder: (context, targetProvider, child) {
                                          List<Target> targets = targetProvider.targets;
                                          List<Target> listNotDone = targetProvider.listNotDone;
                                          List<Target> listDone = targetProvider.listDone;
                                          return Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: targets.length.toString(),
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 18,
                                                            color: CommonStyle.primaryColor,
                                                            decoration: TextDecoration.underline,
                                                          ),
                                                        ),
                                                        TextSpan(text: targets.length == 1 ? ' target' : ' targets', style: CommonStyle.defaultText(context)),
                                                      ],
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(text: '1', style: CommonStyle.boldText(context)),
                                                        TextSpan(text: ' trong ', style: CommonStyle.boldText(context, color: Colors.grey)),
                                                        TextSpan(text: targets.length.toString(), style: CommonStyle.boldText(context, color: Colors.grey)),
                                                        TextSpan(text: ' đã xong', style: CommonStyle.boldText(context, color: Colors.grey)),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  _buildItem(listNotDone, context),
                                                  listDone.length > 0
                                                      ? Padding(
                                                          padding: const EdgeInsets.only(top: 24.0),
                                                          child: Divider(
                                                            color: Colors.grey.withOpacity(0.3),
                                                            thickness: 2.0,
                                                            indent: 8.0,
                                                            endIndent: 8.0,
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                  _buildItem(listDone, context),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                Container(
                                  color: Colors.blue,
                                ),
                                Container(
                                  color: Colors.black,
                                ),
                                Container(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _buildItem(List<Target> targets, BuildContext context) {
    return Column(
      children: targets.map((target) {
        return Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constant.borderRadius),
              color: CommonStyle.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Constant.borderRadius),
                        bottomLeft: Radius.circular(Constant.borderRadius),
                      ),
                    ),
                  ),
                  Text(
                    capitalize(target.title),
                    style: CommonStyle.boldText(
                      context,
                      textSize: 19,
                    ),
                  ),
                  Checkbox(
                    value: target.isDone,
                    onChanged: (val) {
                      setState(() {
                        target.isDone = val;
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
