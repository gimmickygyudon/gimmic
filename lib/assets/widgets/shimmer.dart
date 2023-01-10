import 'package:flutter/material.dart';

class ShimmerLoading extends StatefulWidget {
  static ShimmerLoadingState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerLoadingState>();
  }

  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.ease,
    required this.border,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    required this.builder
  });

  final bool isLoading;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final BorderRadius border;
  final EdgeInsets margin, padding;
  final Widget builder;

  @override
  State<ShimmerLoading> createState() => ShimmerLoadingState();
}

class ShimmerLoadingState extends State<ShimmerLoading> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  Listenable get shimmerChanges => _shimmerController;
  Listenable? _shimmerChanges;
  LinearGradient? shimmerGradient;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = ShimmerLoading.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }

  }

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController.unbounded(
      vsync: this, 
    )..repeat(min: -0.5, max: 1.5, period: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }

  Future<void> _onShimmerStop() async {
    if(!widget.isLoading) {
        _shimmerController.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      switchInCurve: widget.curve,
      switchOutCurve: widget.curve,
      child: (() {
        _onShimmerStop();
        return widget.isLoading 
          ? AnimatedBuilder(
              animation: _shimmerController,
              child: widget.builder,
              builder: (context, child) {
                return ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.grey.shade300.withOpacity(0.6),
                          Colors.grey.shade200.withOpacity(0.9),
                          Colors.grey.shade300.withOpacity(0.6),
                        ],
                        stops: const [
                          0.1,
                          0.3,
                          0.4,
                        ],
                        begin: const Alignment(-1.0, -0.3),
                        end: const Alignment(1.0, 0.3),
                        transform: _SlidingGradientTransform(slidePercent: _shimmerController.value),
                      ).createShader(bounds);
                    },
                    child: widget.builder 
                );
              }
            )
          : widget.child;
      }())
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}



class ShimmerImageMain extends StatelessWidget {
  const ShimmerImageMain({super.key, required this.useVerticalLayout});

  final bool useVerticalLayout;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: useVerticalLayout
              ? BorderRadius.circular(20)
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)
            ),            
          ),
          padding: useVerticalLayout
            ? EdgeInsets.zero
            : const EdgeInsets.only(top: 8),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                );
              })
            ),
          ),
        ),
        Center(
          child: Icon(
            Icons.image, 
            color: Colors.grey.shade600,
            size: 60,
          )
        )
      ],
    );
  }
}

class ShimmerImageThumbnails extends StatelessWidget {
  const ShimmerImageThumbnails({
    super.key, 
    required this.useVerticalLayout, 
    required this.constraints
  });

  final bool useVerticalLayout;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              height: useVerticalLayout ? 110 : 110,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: useVerticalLayout
                ? const EdgeInsets.fromLTRB(4, 8, 4, 8)
                : const EdgeInsets.fromLTRB(0, 6, 4, 6),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(2, (index) {
                    return Container(
                      height: 90,
                      width: 90,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  })
                ),
              ),
            )
          ],
        ),
        useVerticalLayout 
          ? const SizedBox()
          : Expanded(child: ShimmerDetailCard(useVerticalLayout: useVerticalLayout))
      ]
    );
  }
}

class ShimmerResourceGrid extends StatelessWidget {
  const ShimmerResourceGrid({
    super.key, 
    required this.useVerticalLayout, 
    required this.gridRowCount, 
    required this.isWebMobile, 
    required this.layouts
  });

  final bool useVerticalLayout;
  final int gridRowCount;
  final bool isWebMobile;
  final List<bool> layouts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: useVerticalLayout
          ? const EdgeInsets.only(bottom: 0, top: 6, left: 40, right: 40)
          : const EdgeInsets.only(bottom: 0, top: 6, left: 24, right: 24),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: useVerticalLayout
              ? MediaQuery.of(context).size.width / 3.25
              : 390,
          crossAxisCount: gridRowCount,
          crossAxisSpacing: isWebMobile ? 10 : 0,
          mainAxisSpacing: 0
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: gridRowCount == 1 
              ? const EdgeInsets.fromLTRB(4, 4, 4, 20)
              : const EdgeInsets.fromLTRB(14, 14, 14, 34),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12), 
                  ),
                  padding: const EdgeInsets.all(4),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                    height: gridRowCount == 1 
                      ? layouts[0] ? 0 : 70 
                      : layouts[0] ? 0 : 58,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12), 
                          bottomRight: Radius.circular(12)
                        ), 
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 4, bottom: gridRowCount == 1 ? 14 : 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 14,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade700,
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  height: 14,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade700,
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              ]
                            ),
                          ),
                          Row(
                            children : List.generate(2, (index) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 8, gridRowCount == 1 ? 24 : 16),
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade700,
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              );
                            })
                          )
                        ]
                      ),
                    ),    
                  ),  
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

class ShimmerCardResourceList extends StatelessWidget {
  const ShimmerCardResourceList({
    super.key, 
    required this.smallLayouts
  });

  final bool smallLayouts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              child: Container(
                height: smallLayouts ? 154 : 124,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: double.infinity,
                            width: smallLayouts ? 150 : 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: smallLayouts ? 18 : 16,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade500,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    SizedBox(height: smallLayouts ? 6 : 4),
                                    Container(
                                      height: smallLayouts ? 20 : 18,
                                      width: smallLayouts ? 180 : 120,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade600,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                              Row(
                                children: List.generate(smallLayouts ? 3 : 1, (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: index == 0 ? 10 : 8),
                                    child: Container(
                                      height: 20,
                                      width: 66,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(smallLayouts ? 25.7 : 8),
                                      ),
                                    ),
                                  );
                                })
                              )
                            ]
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 22,
                            width: smallLayouts ? 90 : 80,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(smallLayouts ? 2 : 1, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}

class ShimmerResourceList extends StatelessWidget {
  const ShimmerResourceList({
    super.key, 
    required this.useVerticalLayout, 
    required this.hideDetailHorizontal, 
    required this.layouts
  });

  final bool useVerticalLayout, hideDetailHorizontal;
  final List<bool> layouts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: useVerticalLayout
          ? const EdgeInsets.only(bottom: 0, top: 18, left: 24, right: 24)
          : const EdgeInsets.only(bottom: 0, top: 18, left: 0, right: 0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                height: hideDetailHorizontal ? 133 : 108,
                width: constraints.maxWidth - 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: layouts[0]
                  ? const EdgeInsets.only(bottom: 16)
                  : const EdgeInsets.only(bottom: 16, left: 25, right: 25),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [ 
                          Container(
                            height: 120,
                            width: 156,
                            margin: const EdgeInsets.fromLTRB(6, 8, 6, 8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade600,
                                        borderRadius: BorderRadius.circular(25.7),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 18,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        borderRadius: BorderRadius.circular(25.7),
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                                child: Row(
                                  children: List.generate(3, (index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: index == 0 ? 0 : 8),
                                      child: Container(
                                        height: 18,
                                        width: 69,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                      ),
                                    );
                                  })  
                                ),
                              ),
                            ],
                          ),
                        ]
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16, right: 4),
                                child: Container(
                                  height: 22,
                                  width: 82,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              )
                            ] + List.generate(2, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              );
                            })
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Container(
                            height: 22,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]
                ),
              );
            }
          );
        }
      ),
    );
  }
}

class ShimmerDetailCard extends StatelessWidget {
  const ShimmerDetailCard({
    super.key, 
    required this.useVerticalLayout
  });

  final bool useVerticalLayout;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(12),                
            ),
          padding: useVerticalLayout
            ? EdgeInsets.zero
            : const EdgeInsets.only(top: 8),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [ 
                              Row(
                                children: List.generate(2, (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: index == 1 ? 8 : 0),
                                    child: Container(
                                      height: 32,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade600,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  );
                                })    
                              ),
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade600,
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ) 
                            ]
                          ),
                        ),
                        const SizedBox(height: 32),
                        Container(
                          height: 22,
                          width: 220,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 18,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                        const SizedBox(height: 8)
                      ] + List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 18,
                            width: index == 2 ? 150 : double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      }) + [
                        const SizedBox(height: 28),
                        Row(
                          children: List.generate(3, (index) {
                            return Padding(
                              padding: EdgeInsets.only(left: index == 0 ? 0 : 8),
                              child: Container(
                                height: 24,
                                width: 69,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade600,
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            );
                          })  
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Divider(color: Colors.grey.shade500, thickness: 3),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(3, (index) {
                              return Column(
                                children: [
                                  Container(
                                    height: 18,
                                    width: 52,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade600,
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    height: 18,
                                    width: 76,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  ),
                                ],
                              );
                            })
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Divider(color: Colors.grey.shade500, thickness: 3),
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(25.7),
                ),
                child: Center(
                  child: Icon(Icons.download_for_offline_rounded, color: Colors.grey.shade400)
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
