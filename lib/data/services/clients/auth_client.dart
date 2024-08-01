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
  Future<void> postViolation(@Body() dynamic violation);
  @POST('/file')
  Future<dynamic> postFile(@Body() FormData image);
  @GET('/commission/analysis')
  Future<dynamic> commissionAnalysis();
  @GET('/mobile/plate-characters')
  Future<dynamic> plateCharacter(
      @Query('name') String? name,
      @Query('governorateId') String? govId,
      @Query("pageNumber") int? currentPage);
  @GET('/mobile/governorates')
  Future<DataModel> governorate(@Query('name') String? name);
  @GET('/commission/vehicle-fees')
  Future<DataModel> vichleFeeGet();
  @GET('/mobile/plate-types')
  Future<DataModel> platyTypeGet();
  @GET('/fee-fines')
  Future<DataModel> feeFines();

  @GET('/vehicle-receipts/last-number')
  Future<dynamic> lastNumberGet(
      @Query("garageId") String? garageId, @Query("type") int type);
}
