abstract class Storage {
  Future<void> setString({required String key, required String value});

  Future<void> delete({required String key});

  Future<void> clear();

  Future<bool> containsKey({required String key});
}
