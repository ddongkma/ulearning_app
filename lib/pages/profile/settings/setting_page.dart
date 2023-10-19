import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/home/settings/bloc/setting_page_bloc.dart';
import 'package:ulearning_app/pages/home/settings/bloc/setting_page_state.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<SettingPageBloc, SettingPageState>(
          builder: (context, state) => Container(
            child: Column(
              children: [
                Text("hello there")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
