import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/student_add_page.dart';
import '../pages/student_edit_page.dart';

import '../data/home_state.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeState.getListStudentsInitialize();
    return Scaffold(
      appBar: AppBar(
        title:

        const Text(
         'Quản lý sinh viên' ,
          style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade600,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: Colors.blue.shade50),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const StudentAddPage(),
                          ),
                        );
                        homeState.getListStudents();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),

                  const Text(
                    'Thêm sinh viên mới' ,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              indent: 80,
              thickness: .2,
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<HomeState>(builder: ((context, value, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: homeState.studentList.length,
                  itemBuilder: (context, index) {
                    var studentItem = homeState.studentList[index];
                    return InkWell(
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => StudentEditPage(
                              id: studentItem.id!,
                              name: studentItem.name,
                              address: studentItem.address,
                              phone: studentItem.phone,
                            ),
                          ),
                        );
                        homeState.getListStudents();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                            )
                          ],
                        ),
                        margin: const EdgeInsets.all(10),
                        height: 100,
                        width: 50,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                 Container(
                                  width: 50,
                                  height: 50,
                                  child: const CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'assets/images/anh.jpeg',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      studentItem.name ,
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    const SizedBox(
                                      height: 5,
                                    ),


                                    Text(
                                        'Địa chỉ: ${studentItem.address}' ,
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),

                                    Text(
                                      'Phone: ${studentItem.phone}' ,
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  await homeState.sqLiteController
                                      .deleteStudent(studentItem.id!);
                                  homeState.getListStudents();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }))
          ],
        ),
      ),
    );
  }
}