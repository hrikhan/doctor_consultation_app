import 'package:doctor_consultation/core/common/style/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math';

class AnimatedFAB extends StatefulWidget {
  final VoidCallback onTap;

  const AnimatedFAB({super.key, required this.onTap});

  @override
  State<AnimatedFAB> createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<AnimatedFAB>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Slide from bottom
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    // Fade in
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Fire gradient for text
  Shader get _fireShader => LinearGradient(
    colors: const [Colors.yellow, Colors.orange, Colors.red, Colors.deepOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    tileMode: TileMode.mirror,
  ).createShader(Rect.fromLTWH(0, 0, 50, 50));

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: FloatingActionButton(
          elevation: 8,
          backgroundColor: Colors.black,
          onPressed: widget.onTap,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Slight flicker animation
              double flicker =
                  sin(DateTime.now().millisecond * pi / 180) * 0.02;
              return Transform.scale(
                scale: 1 + flicker,
                child: Text(
                  "AI",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    foreground: Paint()..shader = _fireShader, // <-- Important
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
