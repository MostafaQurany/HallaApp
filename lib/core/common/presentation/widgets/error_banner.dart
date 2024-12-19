import 'package:flutter/material.dart';

class OfflineBanner extends StatelessWidget {
  final bool isOffline;

  const OfflineBanner({Key? key, required this.isOffline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 450),
      offset: isOffline ? const Offset(-1, 0) : Offset.zero, // Slide in/out
      child: !isOffline
          ? Material(
              elevation: 4,
              color: Colors.red,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.wifi_off, color: Colors.white),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "You are offline. Check your connection.",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
