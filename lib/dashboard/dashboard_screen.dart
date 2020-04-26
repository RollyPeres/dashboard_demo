import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/dashboard_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (_) => DashboardBloc()..add(const LoadDashboardsRequested()),
      child: const Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          DashboardCard(index: 0),
          DashboardCard(index: 1),
          DashboardCard(index: 2),
          DashboardCard(index: 3),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key key,
    this.index,
  })  : assert(index != null),
        super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: DashboardCardContent(index: index),
      ),
    );
  }
}

class DashboardCardContent extends StatelessWidget {
  const DashboardCardContent({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (_, state) {
        if (state is DashboardLoading) {
          return const CircularProgressIndicator();
        }

        if (state is DashboardLoaded) {
          return Text(state.data[index]);
        }

        return const SizedBox(height: 0, width: 0);
      },
    );
  }
}
