import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget body;
  final String? titleText;
  final Color? appBarColor;
  final Color? color;
  final bool resizeToAvoidBottomInset;
  final WillPopCallback? onBackCallback;
  final List<Widget> actions;
  final EdgeInsets padding;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? leading;
  final PreferredSizeWidget? bottomWidget;
  final double elevation;
  final bool automaticallyImplyiLeading;
  final Widget? floatingActionButton;

  const BaseView({
    Key? key,
    this.automaticallyImplyiLeading = true,
    this.titleText,
    required this.body,
    this.appBarColor,
    this.color,
    this.resizeToAvoidBottomInset = true,
    this.onBackCallback,
    this.bottomSheet,
    this.padding = const EdgeInsets.all(16.0),
    this.actions = const [],
    this.bottomNavigationBar,
    this.bottomWidget,
    this.elevation = 2,
    this.leading,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onBackCallback,
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 8, bottom: 0),
          child: Scaffold(
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            appBar: toolbar(context),
            body: Padding(padding: padding, child: body),
            floatingActionButton: floatingActionButton,
          ),
        ));
  }

  PreferredSize toolbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(bottomWidget != null
          ? 140.0
          : titleText != null
              ? 56.0
              : 0.0),
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyiLeading,
        centerTitle: true,
        leading: leading,
        actions: actions,
        elevation: elevation,
        title: Text(
          titleText ?? '',
        ),
        bottom: bottomWidget,
      ),
    );
  }
}
