import 'package:flutter/material.dart';
import 'meditation.dart';


class MedicationScreen extends StatefulWidget {
  const MedicationScreen({Key? key, this.mor_eve = "Goood Morning"}) : super(key: key);
  final mor_eve;
  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text('${widget.mor_eve}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('A moment of overwhelm can be beaten with just a simple breathe in & breathe out.', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Today\'s Picks', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          ),
          MedicationList()
        ],
      ),
    );
  }
}
