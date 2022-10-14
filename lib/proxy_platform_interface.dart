import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:proxy/models/proxy_dto.dart';

import 'proxy_method_channel.dart';

abstract class ProxyPlatform extends PlatformInterface {

  /// Constructs a ProxyPlatform.
  ProxyPlatform() : super(token: _token);

  static final Object _token = Object();

  static ProxyPlatform _instance = MethodChannelProxy();

  /// The default instance of [ProxyPlatform] to use.
  ///
  /// Defaults to [MethodChannelProxy].
  static ProxyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ProxyPlatform] when
  /// they register themselves.
  static set instance(ProxyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Iterable<ProxyDto>?> getSystemProxyForUrl(String url) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Iterable<ProxyDto>?> getSystemProxyForUri(Uri uri) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
