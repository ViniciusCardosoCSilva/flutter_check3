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

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<Item> items = [
    Item(
      title: 'Borussia x Real Madrid',
      description: 'Final da Liga dos Campeões',
      imageUrl: 'https://cdn.espn.com.br/image/wide/622_e0908730-c7db-34e8-ac4b-2a1b13a65437.jpg',
      additionalInfo: 'Borussia Dortmund e Real Madrid vão se enfrentar pela grande final da UEFA Champions League. No próximo dia 1º de junho de 2024, alemães e espanhóis medem forças no lendário Estádio Wembley, em Londres, na Inglaterra, para ver quem é o grande campeão europeu da temporada 2023/24.',
    ),
    Item(
      title: 'Corinthians x Palmeiras',
      description: 'Derby Paulista',
      imageUrl: 'https://s2-ge.glbimg.com/rZ3gaZHsK2nA45f4hvwY5SaVxLw=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2020/O/e/SMf2sySomIAgYIn7UG4Q/derbi.jpg',
      additionalInfo: 'Derby Paulista é o duelo centenário entre os clubes de futebol brasileiros Corinthians e Palmeiras, ambos do estado de São Paulo.',
    ),
    Item(
      title: 'Bayer 04 Leverkusen',
      description: 'Novo Campeão da Bundesliga',
      imageUrl: 'https://theanalyst.com/wp-content/uploads/2024/04/bayer-leverkusen-and-the-bundesliga-title.jpg',
      additionalInfo: 'Acabou a hegemonia no Campeonato Alemão. O Bayer Leverkusen goleou o Werder Bremen e conquistou seu primeiro título da Bundesliga na história. O caneco, que veio com cinco rodadas de antecipação (a equipe rubro-negra está invicta na temporada), acabou com a sequência de 11 títulos seguidos do Bayern de Munique.',
    ),
    Item(
      title: 'Saída do goleiro Cássio',
      description: 'Idolo do Timão se despede',
      imageUrl: 'https://s2-ge.glbimg.com/pEm6PqjgOt6-5Y5SNRbX-hf0YFE=/0x0:3000x2595/1000x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2024/B/0/EyCNlBTrABOEO0mF70CQ/agenciacorinthians-foto-211337.jpg',
      additionalInfo: 'A era Cássio chegou ao fim no Corinthians. Em nota oficial, o clube anunciou a rescisão de contrato com o goleiro, que em breve será anunciado como jogador do Cruzeiro. Encerra-se, assim, uma história de 12 anos e meio, 712 partidas e nove títulos do camisa 12 pelo Timão.',
    ),
  ];

  void _updateFavoriteCount() {
    final count = items.where((item) => item.isFavorite).length;
    setState(() {
      _favoriteCount = count;
    });
  }

  int _favoriteCount = 0;

  @override
  void initState() {
    super.initState();
    _updateFavoriteCount(); // Initialize favorite count
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Itens - Favoritos: $_favoriteCount',
          style: TextStyle(color: Colors.white), // Define o texto como branco
        ),
        backgroundColor: Colors.black,
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
            trailing: Icon(
              item.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: item.isFavorite ? Colors.red : null,
            ),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item),
                ),
              );

              if (result != null && result is bool) {
                setState(() {
                  item.isFavorite = result;
                  _updateFavoriteCount();
                });
              }
            },
          );
        },
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'item.dart';
// import 'detail_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Lista e Detalhes',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ListScreen(),
//     );
//   }
// }

// class ListScreen extends StatefulWidget {
//   @override
//   _ListScreenState createState() => _ListScreenState();
// }

// class _ListScreenState extends State<ListScreen> {
//   final List<Item> items = [
//     Item(
//       title: 'Borussia vs Real Madrid',
//       description: 'Final da Liga dos Campeões',
//       imageUrl: 'https://cdn.espn.com.br/image/wide/622_e0908730-c7db-34e8-ac4b-2a1b13a65437.jpg',
//     ),
//     Item(
//       title: 'Corinthias x Palmeiras',
//       description: 'Derby Paulista',
//       imageUrl: 'https://s2-ge.glbimg.com/rZ3gaZHsK2nA45f4hvwY5SaVxLw=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2020/O/e/SMf2sySomIAgYIn7UG4Q/derbi.jpg',
//     ),
//     Item(
//       title: 'Bayer 04 Leverkusen',
//       description: 'Novo Campeão - Bundesliga',
//       imageUrl: 'https://theanalyst.com/wp-content/uploads/2024/04/bayer-leverkusen-and-the-bundesliga-title.jpg',
//     ),
//     Item(
//       title: 'Saída do goleiro Cássio',
//       description: 'Idolo do Timão se despede.',
//       imageUrl: '',
//     ),
//   ];

//   void _updateFavoriteCount() {
//     final count = items.where((item) => item.isFavorite).length;
//     setState(() {
//       _favoriteCount = count;
//     });
//   }

//   int _favoriteCount = 0;

//   @override
//   void initState() {
//     super.initState();
//     _updateFavoriteCount(); // Initialize favorite count
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lista de Itens - Favoritos: $_favoriteCount', style: TextStyle(color: Colors.white),),
//         backgroundColor: Colors.black,
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index];
//           return ListTile(
//             leading: ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.network(
//                 item.imageUrl,
//                 width: 150,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             title: Text(item.title),
//             subtitle: Text(item.description),
//             trailing: Icon(
//               item.isFavorite ? Icons.favorite : Icons.favorite_border,
//               color: item.isFavorite ? Colors.red : null,
//             ),
//             onTap: () async {
//               final result = await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailScreen(item: item),
//                 ),
//               );

//               if (result != null && result is bool) {
//                 setState(() {
//                   item.isFavorite = result;
//                   _updateFavoriteCount();
//                 });
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
