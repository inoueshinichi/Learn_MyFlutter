// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod_async_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncGreetHash() => r'e8aac8293ac7fdadcc8514961696578bdb114e26';

/// See also [asyncGreet].
@ProviderFor(asyncGreet)
final asyncGreetProvider = AutoDisposeFutureProvider<String>.internal(
  asyncGreet,
  name: r'asyncGreetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$asyncGreetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AsyncGreetRef = AutoDisposeFutureProviderRef<String>;
String _$asyncCounterNotifierHash() =>
    r'e9e4bd106985a760d726fea9157aca3929947b65';

/// See also [AsyncCounterNotifier].
@ProviderFor(AsyncCounterNotifier)
final asyncCounterNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AsyncCounterNotifier, int>.internal(
      AsyncCounterNotifier.new,
      name: r'asyncCounterNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$asyncCounterNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AsyncCounterNotifier = AutoDisposeAsyncNotifier<int>;
String _$userNotifierHash() => r'abdd92a2d0dd5e02ac7bc5b1a475befead165a5c';

/// See also [UserNotifier].
@ProviderFor(UserNotifier)
final userNotifierProvider =
    AutoDisposeAsyncNotifierProvider<UserNotifier, String>.internal(
      UserNotifier.new,
      name: r'userNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$userNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserNotifier = AutoDisposeAsyncNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
