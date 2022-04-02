import 'package:Cinepolis/data/models/entities/quizzer/quizz.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_available.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_branch_visited.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_finish.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_history.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_init.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_object_refs.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_summary.model.dart';

abstract class IQuizzerService {
  Future<List<QuizzAvailable>> getAvailable();
  Future<List<QuizHistory>> getHistory(int offset, int limit, String filter);
  Future<List<QuizzSummary>> getSummary(String campaingId);
  Future<List<AvailableBranches>> getAvailableBranches(int campaignId);
  Future<Quizz> getQuizzer(int campaingId);
  Future<InitQuizz> initQuizzer(ParamsInitQuizz paramsInitQuizz);
  Future sendRequest(ObjectRefs dataObject);
  Future finishQuizzer(int campaingId, FinishQuizzer finishQuizzer);
  Future incompleteQuizzer(String campaingId);
  Future<List<BranchesVisited>> getBranchesVisited();
}
