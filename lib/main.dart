import 'package:flutter/material.dart';
import 'item.dart';
import 'detail_screen.dart';
void main() {
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Lista e Detalhes',
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: ListScreen(),
   );
 }
}
class ListScreen extends StatelessWidget {
 final List<Item> items = [
   Item(
     title: 'Borussia vs Real Madrid',
     description: 'Final da Liga dos Campeões',
     imageUrl: 'https://cdn.espn.com.br/image/wide/622_e0908730-c7db-34e8-ac4b-2a1b13a65437.jpg',
   ),
   Item(
     title: 'Corinthians x Palmeiras',
     description: 'Derby Paulista',
     imageUrl: 'https://s2-ge.glbimg.com/KQRqe0RabqmTKYrhjniHRdBZONA=/0x0:1080x608/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2020/O/e/SMf2sySomIAgYIn7UG4Q/derbi.jpg',
   ),
   Item(
     title: 'Item 3',
     description: 'Descrição do Item 3',
     imageUrl: 'https://via.placeholder.com/150',
   ),
 ];
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Lista de Itens'),
     ),
     body: ListView.builder(
       itemCount: items.length,
       itemBuilder: (context, index) {
         final item = items[index];
         return ListTile(
           leading: ClipRRect(
             borderRadius: BorderRadius.circular(8.0),
             child: Image.network(
               item.imageUrl,
               width: 150,
               height: 150,
               fit: BoxFit.cover,
             ),
           ),
           title: Text(item.title),
           subtitle: Text(item.description),
           onTap: () {
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => DetailScreen(item: item),
               ),
             );
           },
         );
       },
     ),
   );
 }
}