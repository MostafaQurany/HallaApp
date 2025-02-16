import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/native%20contact/cubit/native_contacts_cubit.dart';
import 'package:halla/core/utils/routting.dart';

class NativeContactsScreen extends StatefulWidget {
  const NativeContactsScreen({super.key});

  @override
  State<NativeContactsScreen> createState() => _NativeContactsScreenState();
}

class _NativeContactsScreenState extends State<NativeContactsScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    context.read<NativeContactsCubit>().getContactList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Native Contacts'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => AppNavigator.navigatePop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NativeContactsCubit>().getContactList();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<NativeContactsCubit, NativeContactsState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Error) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is Loaded<List<Contact>>) {
            if (contacts.isEmpty) {
              contacts = state.data;
            }
            if (contacts.isEmpty) {
              return Center(
                child: Text("Empty"),
              );
            } else {
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ListTile(
                    title: Text(contact.fullName),
                    subtitle: Text(contact.primePhone),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<NativeContactsCubit>()
                              .addLocalContactToServer(contact);
                        },
                        icon: Icon(Icons.upload)),
                  );
                },
              );
            }
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
