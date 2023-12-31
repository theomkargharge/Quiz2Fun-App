import 'package:flutter/material.dart';
import 'package:quiz2fun/view_models/custom_url_view_model.dart';
import 'package:quiz2fun/widgets/common_button.dart';
import 'package:quiz2fun/widgets/common_text_field.dart';
import 'package:provider/provider.dart';

class CustomURLView extends StatefulWidget {
  CustomURLView({Key? key}) : super(key: key);

  static const String TAG = "/CustomURLView";

  @override
  _CustomURLViewState createState() => _CustomURLViewState();
}

class _CustomURLViewState extends State<CustomURLView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CustomURLViewModel>(context, listen: false).checkIfURLSetPreviously();
  }

  @override
  Widget build(BuildContext context) {
    CustomURLViewModel _customURLViewModel = Provider.of<CustomURLViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Custom URL Page"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              "URL Format \n http://192.168.1.2:8080 \n https://hostingserver.com \n ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
          ),
          CommonTextField(
            label: "Custom URL",
            hint: "Enter URL here",
            controller: _customURLViewModel.urlTextFieldController,
          ),
          CommonButton(
            title: "Set",
            function: () {
              _customURLViewModel.setURL(context: context);
            },
          ),
          CommonButton(
            title: "Staging",
            function: () {
              _customURLViewModel.setStaging(context: context);
            },
          ),
        ],
      ),
    );
  }
}
