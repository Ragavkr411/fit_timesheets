import 'package:flutter/material.dart';

const Color Color1 = Color.fromRGBO(146, 132, 110, 1);
const Color Color2 = Color.fromRGBO(194, 183, 168, 0.6);
const Color Color3 = Color.fromRGBO(226, 221, 212, 0.3);

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 60,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 80),
                //You can Replace this with your desired WIDTH and HEIGHT
                painter: RPSCustomPainter_4(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('©FuturaInsTech2021',style: TextStyle(
                  fontFamily: "DancingScript-VariableFont_wght",color: Colors.white, fontWeight: FontWeight.bold),),
            )
          ],
        ));
  }
}



class RPSCustomPainter_1 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color1
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path_0 = Path();
    path_0.moveTo(0,0);
    path_0.quadraticBezierTo(size.width*0.17,size.height*0.49,size.width*0.38,size.height*0.50);
    path_0.cubicTo(size.width*0.44,size.height*0.50,size.width*0.56,size.height*0.50,size.width*0.63,size.height*0.50);
    path_0.quadraticBezierTo(size.width*0.83,size.height*0.49,size.width,0);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.lineTo(0,0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class RPSCustomPainter_2 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Colors.purple[900]
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path_0 = Path();
    path_0.moveTo(0,size.height);
    path_0.quadraticBezierTo(size.width*0.17,size.height*-0.01,size.width*0.50,0);
    path_0.quadraticBezierTo(size.width*0.83,size.height*0.00,size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class RPSCustomPainter_3 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color =  Colors.purple[900]
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path_0 = Path();
    path_0.moveTo(0,size.height);
    path_0.lineTo(0,size.height*0.50);
    path_0.quadraticBezierTo(size.width*0.29,size.height*0.01,size.width*0.50,0);
    path_0.quadraticBezierTo(size.width*0.71,size.height*0.01,size.width,size.height*0.50);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(0,size.height);

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class RPSCustomPainter_4 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Colors.purple[900]
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.50);
    path_0.quadraticBezierTo(size.width*0.38,size.height*0.51,size.width*0.50,size.height*0.50);
    path_0.quadraticBezierTo(size.width*0.83,size.height*0.51,size.width,0);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.lineTo(0,size.height*0.50);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}



