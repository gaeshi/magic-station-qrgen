import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DotBlockWithQrCode extends StatelessWidget {
  const DotBlockWithQrCode({Key key, @required String code})
      : _code = code,
        super(key: key);

  final String _code;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          DotBlock(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow.shade300),
            ),
            child: FractionallySizedBox(
              widthFactor: 0.33,
              child: QrImage(
                backgroundColor: Colors.yellow,
                data: _code ?? 'Magic Station QR',
                errorCorrectionLevel: QrErrorCorrectLevel.H,
              ),
            ),
          ),
          Dot(),
        ],
      ),
    );
  }
}

class DotBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow.shade600,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[...List.filled(5, DotRow())],
      ),
    );
  }
}

class DotRow extends StatelessWidget {
  const DotRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[...List.filled(5, Dot())],
    );
  }
}

class Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: screenWidth * 0.08,
          height: screenWidth * 0.08,
          decoration: BoxDecoration(
            color: Colors.yellow.shade600,
          ),
        ),
        Container(
          width: screenWidth * 0.07,
          height: screenWidth * 0.07,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.yellow.shade200,
                Colors.yellow.shade700,
              ],
            ),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: screenWidth * 0.045,
          height: screenWidth * 0.045,
          decoration: BoxDecoration(
            color: Colors.yellow.shade500,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
