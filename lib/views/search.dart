import 'package:chat_application/services/database.dart';
import 'package:chat_application/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();

  QuerySnapshot? searchSnapshot;

  initiateSearch() {
    databaseMethods
        .getUserByUsername(searchTextEditingController.text)
        .then((val) {
      searchSnapshot = val;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget searchList() {
    return ListView.builder(
        itemCount: searchSnapshot!.docs.length,
        itemBuilder: (context, index) {
          return SearchTile(username: "", userEmail: "");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: AppBarMain()),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(223, 236, 232, 232),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: searchTextEditingController,
                    decoration: const InputDecoration(
                        hintText: "Search Username.", border: InputBorder.none),
                  )),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
                    child: const Icon(
                      Icons.search,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  const SearchTile({Key? key, required this.username, required this.userEmail})
      : super(key: key);
  final String username;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Column(
          children: [
            Text(
              username,
              style: whiteColor(),
            ),
            Text(
              userEmail,
              style: whiteColor(),
            ),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(240, 253, 231, 28),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Text("Message"),
        )
      ]),
    );
  }
}
