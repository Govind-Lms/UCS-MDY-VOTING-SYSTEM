import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VoteCount extends StatefulWidget {
  const VoteCount({ Key? key,required this.kingOrQueen, required this.fresherOrWhole, required this.no }) : super(key: key);
  final String kingOrQueen;
  final String fresherOrWhole;
  final String no;
  @override
  State<VoteCount> createState() => _VoteCountState();
}

class _VoteCountState extends State<VoteCount> {

  int length = 0;
  fetchVotes () async{
    var votesTotal = await FirebaseFirestore.instance.collection('candidates').doc(widget.kingOrQueen).collection(widget.fresherOrWhole).doc(widget.no).collection('votes').get();
    setState(() {
      length = votesTotal.docs.length;
    });
  }
  
  @override
  void initState() {
    super.initState();
    fetchVotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Object>>(
        builder: ((context, snapshot) {
          return Center(
            child: Text(length.toString()),
          );
        }),
      )
    );
  }
}