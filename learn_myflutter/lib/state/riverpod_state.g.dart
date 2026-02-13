// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$greetHash() => r'0f0e2a58e626350bac904ce05dbdd0b7df4fff78';

/// See also [greet].
@ProviderFor(greet)
final greetProvider = AutoDisposeProvider<String>.internal(
  greet,
  name: r'greetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$greetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GreetRef = AutoDisposeProviderRef<String>;
String _$counterNotifierHash() => r'7abaa01ed380d6f9730f1235872cfd1930df1405';

/// See also [CounterNotifier].
@ProviderFor(CounterNotifier)
final counterNotifierProvider =
    AutoDisposeNotifierProvider<CounterNotifier, int>.internal(
      CounterNotifier.new,
      name: r'counterNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$counterNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CounterNotifier = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
