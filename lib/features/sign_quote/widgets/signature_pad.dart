import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class SignaturePad extends StatefulWidget {
  final ValueChanged<bool> onSignatureChanged;

  const SignaturePad({super.key, required this.onSignatureChanged});

  @override
  State<SignaturePad> createState() => SignaturePadState();
}

class SignaturePadState extends State<SignaturePad> {
  final List<List<Offset>> _strokes = [];
  List<Offset> _currentStroke = [];

  bool get hasSignature => _strokes.isNotEmpty;

  void clear() {
    setState(() {
      _strokes.clear();
      _currentStroke.clear();
    });
    widget.onSignatureChanged(false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkBorder, width: 1.5),
      ),
      child: Stack(
        children: [
          // Baseline indicator
          Positioned(
            bottom: 35,
            left: 20,
            right: 20,
            child: Row(
              children: [
                const Text(
                  "✕ ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),
          // Interactive drawing area
          GestureDetector(
            onPanStart: (details) {
              final box = context.findRenderObject() as RenderBox;
              final point = box.globalToLocal(details.globalPosition);
              setState(() {
                _currentStroke = [point];
                _strokes.add(_currentStroke);
              });
              widget.onSignatureChanged(true);
            },
            onPanUpdate: (details) {
              final box = context.findRenderObject() as RenderBox;
              final point = box.globalToLocal(details.globalPosition);
              setState(() {
                _currentStroke.add(point);
              });
            },
            onPanEnd: (_) {
              setState(() {
                _currentStroke = [];
              });
            },
            child: CustomPaint(
              painter: _SignaturePainter(strokes: _strokes),
              size: Size.infinite,
            ),
          ),
          // Clear button
          Positioned(
            top: 8,
            right: 8,
            child: TextButton.icon(
              onPressed: hasSignature ? clear : null,
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text("Clear"),
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                foregroundColor: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignaturePainter extends CustomPainter {
  final List<List<Offset>> strokes;

  _SignaturePainter({required this.strokes});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff181C1E)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;

    for (final stroke in strokes) {
      for (int i = 0; i < stroke.length - 1; i++) {
        canvas.drawLine(stroke[i], stroke[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SignaturePainter oldDelegate) => true;
}
