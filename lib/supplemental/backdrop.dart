import 'package:flutter/material.dart';

import '../model/product.dart';

class Backdrop extends StatefulWidget {
  const Backdrop({
    Key? key,
    required this.currentCategory,
    required this.frontLayer,
    required this.backLayer,
    required this.frontTitle,
    required this.backTitle,
  }) : super(key: key);

  final Category currentCategory;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  @override
  State<Backdrop> createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool get _isOpen =>
      _controller.status == AnimationStatus.completed;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleBackdrop() {
    if (_isOpen) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
          ),
          onPressed: _toggleBackdrop,
        ),
        title: _isOpen
            ? widget.backTitle
            : widget.frontTitle,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: widget.backLayer,
          ),

          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final double slideAmount =
                  250.0 * _controller.value;

              return Positioned(
                top: slideAmount,
                left: 0,
                right: 0,
                bottom: -slideAmount,
                child: Material(
                  elevation: 4.0,
                  child: child,
                ),
              );
            },
            child: widget.frontLayer,
          ),
        ],
      ),
    );
  }
}