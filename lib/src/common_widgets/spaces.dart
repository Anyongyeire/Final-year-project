import 'package:flutter/material.dart';

// * For Widget Spacing

class VerticalSpace extends StatelessWidget {
  ///Adds space vertically
  const VerticalSpace({super.key, required this.of});

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: of);
  }
}

class HorizontalSpace extends StatelessWidget {
  ///Adds space Horizontally
  const HorizontalSpace({super.key, required this.of});

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: of);
  }
}

class EmptySpace extends StatelessWidget {
  ///Adds Empty space
  const EmptySpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

// * For Slivers

class SliverVerticalSpace extends StatelessWidget {
  ///Adds space vertically in Sliver Widgets
  const SliverVerticalSpace({super.key, required this.of});

  final double of;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: VerticalSpace(of: of));
  }
}

class SliverEmptySpace extends StatelessWidget {
  ///Adds Empty space in Sliver Widgets
  const SliverEmptySpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(child: EmptySpace());
  }
}
