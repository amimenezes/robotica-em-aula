import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:robotica/screens/Grupos/components/grupo_update.dart';
//import 'package:robotica/screens/Grupos/components/grupo_search.dart';
import 'package:robotica/screens/Grupos/components/grupo_view.dart';
import 'package:robotica/screens/Grupos/components/grupo_cadastrar.dart';

class BodyGruposGroupedList extends StatefulWidget {
  const BodyGruposGroupedList({Key? key}) : super(key: key);
  @override
  GroupListViewPageState createState() => GroupListViewPageState();
}

class GroupListViewPageState extends State<BodyGruposGroupedList> {
  // List<GrupoModel> pesquisarGrupos = [];
  // String query = '';
  // @override
  // void initState() {
  //   super.initState();

  //   setState(() {
  //     pesquisarGrupos = dadosListaGrupos;
  //   });
  // }

  // onSearch(String query) {
  //   final pesquisarGrupos = dadosListaGrupos.where((element) {
  //     final titleLower = element.title.toLowerCase();
  //     final authorLower = element.author.toLowerCase();
  //     final groupLower = element.group.toLowerCase();

  //     return titleLower.contains(query) ||
  //         authorLower.contains(query) ||
  //         groupLower.contains(query);
  //   }).toList();

  //   setState(() {
  //     this.query = query;
  //     this.pesquisarGrupos = pesquisarGrupos;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 104, 103, 103),
        title: Container(
          alignment: Alignment.center,
          child: TextField(
            //onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
              hintText: 'Pesquisar Grupos',
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              contentPadding: const EdgeInsets.all(0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: //pesquisarGrupos.isEmpty
                _dadosListaGrupos.isEmpty
                    ? const Center(
                        child: Text(
                          'Sem resultados para a pesquisa.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : GroupedListView<dynamic, String>(
                        //semanticChildCount: _dadosListaGrupos.length,
                        //itemCount:pesquisarGrupos.length,
                        //elements: pesquisarGrupos,
                        elements: _dadosListaGrupos,
                        //semanticChildCount: pesquisarGrupos.length,
                        //groupBy: (item) => pesquisarGrupos[item].group,
                        //groupBy: (item) => item['group'],
                        //groupBy: (item) => '${item['group']}',
                        groupBy: (item) => item['group'],
                        groupSeparatorBuilder: (String groupValue) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: const [
                                  Text(
                                    '',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //Icon(Icons.ads_click),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    groupValue,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(Icons.groups),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialogBox(context);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(255, 194, 26, 14),
                                    ),
                                  ),
                                ],
                              ),
                              Column(children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const GrupoUpdate()));
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        itemBuilder: (context, item) {
                          return Card(
                            elevation: 10,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const GrupoView();
                                }));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        child: Image.asset(
                                          //pesquisarGrupos[item].image,
                                          '${item['image']}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                              ),
                                              child: Text(
                                                //pesquisarGrupos[item].title,
                                                item['title'],
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                    Icons.account_circle_sharp,
                                                    color: Colors.black54,
                                                    size: 16,
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 10,
                                                    ),
                                                    child: Text(
                                                        //pesquisarGrupos[item].author,
                                                        '${item['author']}'),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                    Icons.calendar_today,
                                                    color: Colors.black54,
                                                    size: 16,
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 10,
                                                    ),
                                                    child: Text(
                                                        //pesquisarGrupos[item].date,
                                                        '${item['date']}'),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RatingBarIndicator(
                                                    direction: Axis.horizontal,
                                                    itemCount: 5,
                                                    itemSize: 25,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            const Icon(
                                                      Icons.favorite,
                                                      color: Colors.amber,
                                                    ),
                                                    //rating: pesquisarGrupos[item].rating,
                                                    rating: 4.5,
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 10,
                                                    ),
                                                    // child: Text(
                                                    //   '${item['rating']}',
                                                    // ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Builder(builder: (context) {
                                    //   return GestureDetector(
                                    //     onTap: () {},
                                    //     child: IconButton(
                                    //       onPressed: () {
                                    //         showDialogBox(context);
                                    //       },
                                    //       icon: const Icon(
                                    //         Icons.delete,
                                    //         color: Color.fromARGB(
                                    //             255, 194, 26, 14),
                                    //       ),
                                    //     ),
                                    //   );
                                    // }),
                                    // Builder(builder: (context) {
                                    //   return GestureDetector(
                                    //     onTap: () {},
                                    //     child: IconButton(
                                    //       onPressed: () {
                                    //         Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //                 builder: (context) =>
                                    //                     const GrupoUpdate()));
                                    //       },
                                    //       icon: const Icon(
                                    //         Icons.edit,
                                    //         color: Color.fromARGB(255, 0, 0, 0),
                                    //       ),
                                    //     ),
                                    //   );
                                    // })
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        groupComparator: (group1, group2) =>
                            group1.compareTo(group2),
                        itemComparator: (item1, item2) =>
                            item1['title'].compareTo(item2['title']),
                        useStickyGroupSeparators: true,
                        floatingHeader: true,
                        order: GroupedListOrder.ASC,
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 193, 7),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const GrupoCadastrar();
            }),
          ),
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.group_add_outlined,
          color: Colors.black,
        ),
      ),
    );
  }

  showDialogBox(BuildContext context) {
    AlertDialog dialogue = AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: const Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Text("Excluir Grupo",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
      ),
      content: Expanded(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.warning_rounded,
                  color: Color.fromRGBO(173, 42, 42, 1),
                  size: 60,
                ),
              ),
              const Text(
                "Tem certeza que deseja deletar esse Grupo?",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                          },
                          child: const Text(
                            "Não",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ))),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text("Excluído com sucesso."),
                                duration: const Duration(seconds: 5),
                                action: SnackBarAction(
                                  label: 'ACTION',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.fromLTRB(35, 10, 35, 10),
                              primary: const Color.fromRGBO(173, 42, 42, 1)),
                          child: const Text("Sim",
                              style: TextStyle(fontSize: 18.0)))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialogue;
        });
  }
}

List _dadosListaGrupos = [
  {
    'id': 1,
    'title': 'Mini Drone',
    'image': 'assets/imgs/robo_drone.png',
    'author': 'Luluzinha',
    'date': '01/06/2022',
    'group': 'Power Rangers',
    'rating': 5.0,
  },
  {
    'id': 2,
    'title': 'Luminaria de Mesa',
    'image': 'assets/imgs/robo_light_fixture.png',
    'author': 'Joãozinho',
    'date': '02/06/2022',
    'group': 'Chocólatras',
    'rating': 4.0,
  },
  {
    'id': 3,
    'title': 'Robo Wheels',
    'image': 'assets/imgs/robo_wheels.png',
    'author': 'Marshmallow',
    'date': '03/06/2022',
    'group': 'Grifinória',
    'rating': 3.0,
  },
  {
    'id': 4,
    'title': 'Braço Robótico',
    'image': 'assets/imgs/robo_arm.png',
    'author': 'Liza Simpson',
    'date': '04/06/2022',
    'group': 'Lufa-Lufa',
    'rating': 2.0,
  },
  {
    'id': 5,
    'title': 'Ventilador',
    'image': 'assets/imgs/robo_fan.png',
    'author': 'Lady Gaga',
    'date': '05/06/2022',
    'group': 'Sonserina',
    'rating': 1.0,
  },
  {
    'id': 6,
    'title': 'Cultivador de Plantas',
    'image': 'assets/imgs/robo_cultivador_de_plantas.png',
    'author': 'Rosa Maria',
    'date': '06/06/2022',
    'group': 'Chocólatras',
    'rating': 0.0
  }
];
