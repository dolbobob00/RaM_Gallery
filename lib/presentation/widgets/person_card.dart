import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'animated_favorite_icon.dart';

class CharacterCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String status;
  final String species;
  final String location;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const CharacterCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.status,
    required this.species,
    required this.location,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Theme.of(context).colorScheme.error,
                    child: const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: AnimatedFavoriteIcon(
                  isFavorite: widget.isFavorite,
                  onPressed: widget.onFavoritePressed,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                _buildInfoRow(Icons.radio_button_checked, widget.status),
                const SizedBox(height: 4),
                _buildInfoRow(Icons.person_outline, widget.species),
                const SizedBox(height: 4),
                _buildInfoRow(Icons.location_on_outlined, widget.location),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}