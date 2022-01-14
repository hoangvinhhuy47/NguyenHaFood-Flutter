import 'package:flutter/material.dart';
class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 66.0 + 16.0 * 12,
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          margin: EdgeInsets.only(top: 66.0),
          decoration: new BoxDecoration(
            color: Colors.black, //Colors.black.withOpacity(0.3),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  color: Colors.amber,
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          child: CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 150,
            backgroundImage: NetworkImage(
              '<https://upload.wikimedia.org/wikipedia/commons/1/1d/Rotating_Konarka_chaka.gif>',
            ),
          ),
        ),
      ],
    );
  }
}