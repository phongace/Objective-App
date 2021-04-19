import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    loadTargetsInfo();
  }

  void loadTargetsInfo() {
    List<Target> targets = Provider.of<TargetProvider>(context, listen: false).targets;
    if (targets.isEmpty && this.mounted) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<TargetProvider>(context, listen: false).getTarget().then((value) {
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
                color: Theme.of(context).scaffoldBackgroundColor,
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
                                color: Colors.white,
                                child: Text('Ngày'),
                              ),
                              Container(
                                height: 40,
                                width: 50,
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: Text('Tuần'),
                              ),
                              Container(
                                height: 40,
                                width: 50,
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: Text('Tháng'),
                              ),
                              Container(
                                height: 40,
                                width: 50,
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: Text('Năm'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                _isLoading
                                    ? LoadingWidget()
                                    : Consumer<TargetProvider>(
                                        builder: (context, targetProvider, child) {
                                          List<Target> targets = targetProvider.targets;
                                          return Column(
                                            children: targets.map((target) {
                                              return Text(target.title);
                                            }).toList(),
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
}
