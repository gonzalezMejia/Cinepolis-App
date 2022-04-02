import 'package:Cinepolis/data/models/entities/quizzer/quizz_branch_visited.model.dart';
import 'package:intl/intl.dart';
import 'package:Cinepolis/app/utils/card_status.utils.dart';
import 'package:flutter/material.dart';

class BranchesList extends StatelessWidget {
  final BranchesVisited visited;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  BranchesList(this.visited, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        trailing: visited.isMenuQuizzCompleted!
            ? StatusIcons.custom(Icons.check_outlined,
                color: Colors.greenAccent)
            : StatusIcons.custom(Icons.dangerous_outlined,
                color: Colors.redAccent),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${visited.branchId} - ${visited.branchName}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      Divider(
          thickness: 2, indent: 10, endIndent: 10, color: Colors.grey[600]!),
    ]);
  }
}
