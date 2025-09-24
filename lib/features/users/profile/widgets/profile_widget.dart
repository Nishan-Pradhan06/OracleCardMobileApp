import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imagePath;
  final String userName;
  final VoidCallback onCameraTap;

  const ProfileAvatar({
    super.key,
    this.imagePath,
    required this.userName,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF6B48FF), Color(0xFF40C4FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 6,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: imagePath != null && imagePath!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: imagePath!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 4, 
                child: GestureDetector(
                  onTap: onCameraTap,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 6,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt,
                        size: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            userName,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
