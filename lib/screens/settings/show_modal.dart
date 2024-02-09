import 'package:flutter/material.dart';
import 'package:islami/core/theme/MyTheme.dart';
import 'package:islami/generated/l10n.dart';
import 'package:islami/providers/provider.dart';
import 'package:provider/provider.dart';

class ShowModal extends StatefulWidget {
  @override
  State<ShowModal> createState() => _ShowModalState();
}

class _ShowModalState extends State<ShowModal> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLunguageApp>(context);
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              height: 10,
              width: 180,
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLunguage('en');
            },
            child: provider.appLunguage == 'en'
                ? getSelectedItemWidget(S.of(context).English)
                : getUnSelectedItemWidget(S.of(context).English),
          ),
          InkWell(
            onTap: () {
              provider.changeLunguage('ar');
            },
            child: provider.appLunguage == 'ar'
                ? getSelectedItemWidget(S.of(context).Arabic)
                : getUnSelectedItemWidget(S.of(context).Arabic),
          )
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Spacer(),
          Icon(
            Icons.done,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: MyTheme.yellowColor),
          ),
        ],
      ),
    );
  }
}
