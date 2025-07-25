import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/data/models/main.dart';
import 'package:edu_financas/domain/main.dart';

class ProfessorRepository {
  Future<Professor> getProfessorData(String id) async {
    final res = await RequestService()
        .get('https://finances-edu.free.beeceptor.com/professor');

    return ProfessorModel.fromJson(res).toEntity();
  }
}
