import 'package:flutter_base/src/data/model/data_model.dart';
import 'package:flutter_base/src/domain/models/domain_model.dart';

abstract class DataMapper<T extends DataModel, R extends DomainModel> {
  R map(T? data);

  List<R> mapList(List<T> dataList) => dataList.map((e) => map(e)).toList();

  List<R>? mapNullableList(List<T>? dataList) =>
      dataList?.map((e) => map(e)).toList();
}
