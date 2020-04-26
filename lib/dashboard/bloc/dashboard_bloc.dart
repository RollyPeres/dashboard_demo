import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  @override
  DashboardState get initialState => const DashboardInitial();

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is LoadDashboardsRequested) {
      yield* _mapLoadDashboardsRequestedToState(event);
      return;
    }
  }

  Stream<DashboardState> _mapLoadDashboardsRequestedToState(
    LoadDashboardsRequested event,
  ) async* {
    yield const DashboardLoading();
    final data = await Future.wait([
      Future.delayed(const Duration(milliseconds: 900), () => 'marketing data'),
      Future.delayed(
          const Duration(milliseconds: 800), () => 'conversion data'),
      Future.delayed(const Duration(milliseconds: 700), () => 'users data'),
      Future.delayed(const Duration(milliseconds: 600), () => 'sales data'),
    ]);
    print(data);
    yield DashboardLoaded(data);
  }
}
