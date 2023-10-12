import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:statszone/presentation/app_presentation.dart';

class PlayerSearchWidget extends StatelessWidget {
  final String? playerImage;
  final String name;
  final String? teamLogo;
  final String? teamName;
  final String? position;

  const PlayerSearchWidget({
    super.key, 
    required this.playerImage, 
    required this.name, 
    required this.teamLogo, 
    required this.teamName, 
    required this.position
    });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        extentRatio: 0.85,
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: (){}),
        children:  [
          SlidableAction(
            onPressed: ((context) {}),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            ),
          SlidableAction(
            onPressed: ((context) {}),
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.5,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: ((context) {}),
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.archive,
                label: 'Archive',
              ),
              SlidableAction(
                onPressed: ((context) {}),
                backgroundColor: Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.save,
                label: 'Save',
              ),
            ],
  ),      
  child: ShadowCard(
        contentPadding: 0,
        child: ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
          leading: SizedBox(
              height: 35,
              width: 35,
              child: CachedNetworkImage(
                imageUrl: playerImage!,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
              title: Text(name, style: context.theme.textTheme.bodyLarge?.copyWith(color: kBlack),),
              subtitle: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CachedNetworkImage(
                      imageUrl: teamLogo!,
                      errorWidget: ((context, url, error) => const Icon(Icons.error)),
                    ),
                  ),
                  const SizedBox(width: 4,),
                  Text(teamName!),
                  const SizedBox(width: 4,),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kGrey
                    ),
                  ),
                  const SizedBox(width: 4,),
                  Text(position ?? "Footballer"),
                ],
              ),
        ),
      ),
    );
  }
}
