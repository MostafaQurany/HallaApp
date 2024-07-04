import 'package:halla/features/home/data/data_sources/home_data_source.dart';
import 'package:halla/features/home/domain/repositories/home_repository.dart';



/// HomeRepositoryImpl is the concrete implementation of the HomeRepository
/// interface.
/// This class implements the methods defined in HomeRepository to interact
/// with data. It acts as a bridge between the domain layer
/// (use cases) and the data layer (data sources).
class HomeRepositoryImpl implements HomeRepository {
      
   final HomeDataSource  homeDataSource;
   HomeRepositoryImpl(this.homeDataSource);
}