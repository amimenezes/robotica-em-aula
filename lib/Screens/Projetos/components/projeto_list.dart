import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:robotica/Screens/Projetos/components/projeto_view.dart';
import 'package:robotica/Screens/Projetos/components/projeto_cadastrar.dart';
import 'package:robotica/Screens/Projetos/components/projeto_update.dart';

class BodyProjetos extends StatefulWidget {
  const BodyProjetos({Key? key}) : super(key: key);
  @override
  _GroupListViewPageState createState() => _GroupListViewPageState();
}

class _GroupListViewPageState extends State<BodyProjetos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('Lista de Projetos'),
        ),
        backgroundColor: Colors.black54,
      ),
      body: GroupedListView<dynamic, String>(
        elements: _dadosListaProjetos,
        groupBy: (item) => item['group'],
        groupSeparatorBuilder: (String groupValue) => Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(
                    child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        groupValue,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ))
              ],
            )),
        itemBuilder: (context, dynamic item) {
          return Card(
            elevation: 10,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProjetoView();
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
                        child: Image.asset(
                          '${item['image']}',
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Text(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.account_circle_sharp,
                                    color: Colors.black54,
                                    size: 16,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text('${item['author']}'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.black54,
                                    size: 16,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text('${item['date']}'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RatingBarIndicator(
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 25,
                                    //rating: userRat,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.favorite,
                                      color: Colors.amber,
                                    ),
                                    rating: 4.5,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
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
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {},
                        child: IconButton(
                          onPressed: () {
                            showDialogBox(context);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 194, 26, 14),
                          ),
                        ),
                      );
                    }),
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {},
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProjetoUpdate()));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          );
        },
        groupComparator: (group1, group2) => group1.compareTo(group2),
        itemComparator: (item1, item2) =>
            item1['title'].compareTo(item2['title']),
        useStickyGroupSeparators: true,
        floatingHeader: true,
        order: GroupedListOrder.ASC,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const ProjetoCadastrar();
            }),
          ),
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.white,
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
            child: Text("Excluir Projeto",
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
                "Tem certeza que deseja deletar esse Projeto?",
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

List _dadosListaProjetos = [
  {
    'id': 1,
    'title': 'Mini Drone',
    'image': 'assets/imgs/robo_drone.png',
    'author': 'Luluzinha',
    'date': '01/06/2022',
    'group': 'Drone',
    'rating': 5.0,
  },
  {
    'id': 2,
    'title': 'Luminaria de Mesa',
    'image': 'assets/imgs/robo_light_fixture.png',
    'author': 'Joãozinho',
    'date': '02/06/2022',
    'group': 'Luminaria',
    'rating': 4.0,
  },
  {
    'id': 3,
    'title': 'Robo Wheels',
    'image': 'assets/imgs/robo_wheels.png',
    'author': 'Marshmallow',
    'date': '03/06/2022',
    'group': 'Robô',
    'rating': 3.0,
  },
  {
    'id': 4,
    'title': 'Braço Robótico',
    'image': 'assets/imgs/robo_arm.png',
    'author': 'Liza Simpson',
    'date': '04/06/2022',
    'group': 'Braço',
    'rating': 2.0,
  },
  {
    'id': 5,
    'title': 'Ventilador',
    'image': 'assets/imgs/robo_fan.png',
    'author': 'Lady Gaga',
    'date': '05/06/2022',
    'group': 'Hélice',
    'rating': 1.0,
  },
  {
    'id': 6,
    'title': 'Cultivador de Plantas',
    'image': 'assets/imgs/robo_cultivador_de_plantas.png',
    'author': 'Rosa Maria',
    'date': '06/06/2022',
    'group': 'Planta',
    'rating': 0.0
  }
];