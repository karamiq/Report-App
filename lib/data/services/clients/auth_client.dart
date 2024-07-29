import '../../models/ViechleFee.dart';
import '../../models/commission_analysis_model.dart';
import '../../models/data_model.dart';
import '../../models/user_model.dart';
import '_clients.dart';

part "auth_client.g.dart";

@riverpod
AuthClient authClient(AuthClientRef ref) => AuthClient(ref.dio);

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  //@POST('/login')
  //FutureApiResponse<AuthenticationModel> login(@Body() dynamic data);
  @POST('/login')
  Future<UserModel> login(@Body() dynamic data);
  @POST("/commission/vehicle-fees")
  Future<void> postViolation(@Body() ViechleFee violation);
  @POST('/file')
  Future<dynamic> postFile(@Body() FormData image);
  @GET('/commission/analysis')
  Future<CommissionAnalysisModel> commissionAnalysis();
  @GET('/mobile/plate-characters')
  Future<DataModel> plateCharacter();
  @GET('/mobile/governorates')
  Future<DataModel> governorate();
  @GET('/commission/vehicle-fees')
  Future<DataModel> vichleFeeGet();
  @GET('/fee-fines')
  Future<DataModel> feeFines();
}
