import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_iteam_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItems extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onSelectItem;

  const MealItems({super.key, required this.meal, required this.onSelectItem});

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {onSelectItem(meal);},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Column(
                  children: [
                    Text(meal.title, maxLines: 2, textAlign: TextAlign.center, softWrap: true, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealIteamTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                        const SizedBox(width: 12),
                        MealIteamTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(width: 12),
                        MealIteamTrait(icon: Icons.attach_money, label: affordabilityText),
                        const SizedBox(width: 12),
                      ],
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

}