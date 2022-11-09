import 'dart:async';

import 'package:flutter_clean_architecture_rx/core/data/models/base/resource.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class SyncStream<T> {
  final BehaviorSubject<Resource<T>> _syncStream =
      BehaviorSubject<Resource<T>>();

  ValueStream<Resource<T>> get stream => _syncStream.stream;

  StreamSink<Resource<T>> get streamSink => _syncStream.sink;

  ValueStream<Resource<T>> push(Stream<T> localStream) {
    localStream.doOnListen(() {
      streamSink.add(Loading());
    });

    localStream.listen((event) {
      streamSink.add(SuccessResponse<T>(content: event));
    });

    localStream.doOnError((error, stacktrace) {
      return streamSink.addError(FailureResponse<T>(messages: error));
    });

    return stream;
  }


  void close(){
    _syncStream.close();
  }
}
