
import 'package:clear/model/page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  PageModel pageModel;
  Function onPressed;

  PageTile({required this.pageModel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var local_image = pageModel.image ?? '';
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: pageModel.desc == null ? 40 : 20,
              child: Center(child: pageModel.title),
            ),
            Visibility(
              visible: pageModel.desc == null ? false : true,
              child: Expanded(
                flex: 10,
                child: Center(
                  child: pageModel.desc,
                ),
              ),
            ),
            Visibility(
              visible: local_image.isNotEmpty ? true : false,
              child: Expanded(
                flex: 70,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(local_image)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
