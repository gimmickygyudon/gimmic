import 'package:flutter/material.dart';

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
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),                
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
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                );
              })
            ),
          ),
        ),
        const Center(
          child: CircularProgressIndicator()
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
                color: Colors.grey,
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
                        color: Colors.grey.shade700,
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
              color: Colors.grey,
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
                                        color: Colors.grey.shade700,
                                        borderRadius: BorderRadius.circular(25.7),
                                      ),
                                    ),
                                  );
                                })    
                              ),
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ) 
                            ]
                          ),
                        ),
                        const SizedBox(height: 32),
                        Container(
                          height: 38,
                          width: 220,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade700,
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
                              color: Colors.grey.shade700,
                              borderRadius: BorderRadius.circular(25.7),
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
                                  color: Colors.grey.shade700,
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            );
                          })  
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Divider(color: Colors.grey.shade600, thickness: 2),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(3, (index) {
                              return Container(
                                height: 52,
                                width: 52,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  shape: BoxShape.circle,
                                ),
                              );
                            })
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Divider(color: Colors.grey.shade600, thickness: 2),
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
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(25.7),
                ),
                child: const Center(
                  child: Icon(Icons.download_for_offline_rounded, color: Colors.grey)
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
