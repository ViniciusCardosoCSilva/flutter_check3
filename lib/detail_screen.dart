import 'package:flutter/material.dart';
import 'item.dart';
class DetailScreen extends StatefulWidget {
 final Item item;
 DetailScreen({required this.item});
 @override
 _DetailScreenState createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {
 bool _favorite = false;
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(widget.item.title),
     ),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(8.0),
             child: Image.network(
               widget.item.imageUrl,
               width: 2000,
               height: 150,
               fit: BoxFit.cover,
             ),
           ),
           SizedBox(height: 16.0),
           Text(
             widget.item.title,
             style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
           ),
           SizedBox(height: 16.0),
           Text(widget.item.description),
           SizedBox(height: 16.0),
           Row(
             children: [
               IconButton(
                 icon: Icon(
                   _favorite ? Icons.favorite : Icons.favorite_border,
                   color: _favorite ? Colors.red : null,
                 ),
                 onPressed: () {
                   setState(() {
                     _favorite = !_favorite;
                   });
                 },
               ),
               Text(_favorite ? 'Item favoritado' : 'Favoritar item'),
             ],
           ),
         ],
       ),
     ),
   );
 }
}