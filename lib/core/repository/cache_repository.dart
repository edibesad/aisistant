abstract class CacheRepository {
  Future<Object?> get(String key);
  Future<bool> put(String key, dynamic value);
  Future<bool> delete(String key);
  Future<bool> clear();
}
