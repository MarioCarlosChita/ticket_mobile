part of 'index.dart';

var locator = GetIt.instance;

void dependecyInitializer() {
  _commonInitialize();
  _servicesInitialize();
  _dataSourceInitialiaze();
  _repositoryInitialize();
  _useCasesInitialize();
}

void _dataSourceInitialiaze() {
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      httpClient: locator.get<AppHttpClient>(),
      storageService: locator.get<StorageService>(),
    ),
  );
  locator.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImpl(
      httpClient: locator.get<AppHttpClient>(),
    ),
  );
}

void _repositoryInitialize() {
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: locator.get<AuthRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(
      paymentRemoteDataSource: locator.get<PaymentRemoteDataSource>(),
    ),
  );
}

void _useCasesInitialize() {
  /// Authentication UseCases Feature
  locator.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(
      authRepository: locator.get<AuthRepository>(),
    ),
  );

  locator.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(
      authRepository: locator.get<AuthRepository>(),
    ),
  );

  locator.registerLazySingleton<GetUserMemberUseCase>(
    () => GetUserMemberUseCase(
      authRepository: locator.get<AuthRepository>(),
    ),
  );

  /// Payment UseCases Feature
  locator.registerLazySingleton<AskPaymentUseCase>(
    () => AskPaymentUseCase(
      paymentRepository: locator.get<PaymentRepository>(),
    ),
  );

  locator.registerLazySingleton<GetMapSofPaymentUseCase>(
    () => GetMapSofPaymentUseCase(
      paymentRepository: locator.get<PaymentRepository>(),
    ),
  );

  locator.registerLazySingleton<GetPaymentsUseCase>(
    () => GetPaymentsUseCase(
      paymentRepository: locator.get<PaymentRepository>(),
    ),
  );
}

void _servicesInitialize() {
  locator.registerLazySingleton<StorageService>(
    () => StorageServiceImpl(
      secureStorage: locator.get<FlutterSecureStorage>(),
    ),
  );

  locator.registerLazySingleton<ShareService>(
    () => ShareServiceImpl(),
  );
}

void _commonInitialize() async {
  locator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  locator.registerLazySingleton<Dio>(
    () => Dio(),
  );

  locator.registerLazySingleton<AppHttpClient>(
    () => AppHttpClientImpl(
      dio: locator.get<Dio>(),
      storageService: locator.get<StorageService>(),
    ),
  );
}
