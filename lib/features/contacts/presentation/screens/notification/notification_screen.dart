import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/notification/cubit/cubit/notification_cubit.dart';
import 'package:halla/features/contacts/presentation/screens/notification/notication_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({
    super.key,
  });

  @override
  NotificationsScreenState createState() => NotificationsScreenState();
}

class NotificationsScreenState extends State<NotificationsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context
          .read<NotificationCubit>()
          .fetchMoreNotifications(context.read<UserCubit>().user!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              context.read<NotificationCubit>().fetchInitialNotifications(
                    context.read<UserCubit>().user!.id,
                  );
              return Center(child: CircularProgressIndicator());
            },
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (notifications, hasMore) {
              return ListView.builder(
                controller: _scrollController,
                itemCount: notifications.length + (hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < notifications.length) {
                    final notification = notifications[index];
                    return NotificationCard(notification: notification);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            },
            error: (message) => Center(child: Text(message)),
            success: (data) => Center(child: Text('data.to')),
          );
        },
      ),
    );
  }
}
