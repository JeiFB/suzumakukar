import 'package:flutter/material.dart';
import 'package:suzumakukar/injection.dart';
import 'package:suzumakukar/main.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/user_data.dart';
import 'package:suzumakukar/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_button.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_puntaje_user.dart';
import 'package:suzumakukar/src/presentation/pages/home/home_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/notas/get_notas_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'dart:io';

class ProfileInfoContent extends StatelessWidget {
  final UserData user;
  final HomeViewModel vm;
  final ProfileInfoViewModel vmProfile;
  final GetNotasViewmodel vmNotas;
  final bool rol;

  const ProfileInfoContent(
      this.user, this.vm, this.vmProfile, this.vmNotas, this.rol,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                color: COLOR_BLACK_LAEL,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: Card(
                    color: COLOR_WHITE,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage: user.img != ""
                                    ? NetworkImage(user.img)
                                    : null,
                                radius: 80,
                                child: user.img == ""
                                    ? const Icon(
                                        Icons.person,
                                        size: 80,
                                      )
                                    : null,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                      ),
                                      builder: (BuildContext context) {
                                        return ProfileImagePicker(vm: vm);
                                      },
                                    );
                                  },
                                  child: const CircleAvatar(
                                    radius: 23,
                                    backgroundColor: COLOR_BLACK_LAEL,
                                    child: Icon(
                                      Icons.edit,
                                      color: COLOR_WHITE,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Feather Bold',
                            ),
                          ),
                          Text(user.username),
                          Text(rol ? 'Profesor/a' : 'Estudiante'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  rol
                      ? ListTile(
                          leading:
                              const Icon(Icons.notes, color: COLOR_BLACK_LAEL),
                          title: const Text(
                            'Notas Estudiantes',
                            style: TextStyle(fontFamily: 'Feather Bold'),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, 'getnotaspage');
                          },
                        )
                      : ListTile(
                          leading:
                              const Icon(Icons.notes, color: COLOR_BLACK_LAEL),
                          title: const Text(
                            'Mis Puntajes',
                            style: TextStyle(fontFamily: 'Feather Bold'),
                          ),
                          onTap: () {
                            // Navigator.pushNamed(context, 'getnotaspage');
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return StreamBuilder(
                                    stream:
                                        vmNotas.completedChallenges(user.id),
                                    builder: (context, completedSnapshot) {
                                      if (completedSnapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      if (!completedSnapshot.hasData) {
                                        return const SizedBox();
                                        // GetNotasContent(
                                        //   // vm,
                                        //   null,
                                        //   user,
                                        //   0,
                                        // );
                                      }
                                      final completedChallenges =
                                          completedSnapshot.data ?? [];

                                      return completedChallenges.isNotEmpty
                                          ? SuzumakukarPuntajeUser(
                                              completedChallenges)
                                          : const Center(
                                              child: Text(
                                                'No haz hecho desafios',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Feather Bold',
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  // color: textColor,
                                                ),
                                              ),
                                            );
                                    });
                              },
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SuzumakukarButton(
              texto: 'Cerrar Sesión',
              onPressed: () async {
                await vmProfile.logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (currentContext) => MyApp(locator<AuthUseCases>()),
                  ),
                  (route) => false,
                );
              },
              color: COLOR_BLACK_LAEL,
              textColor: COLOR_WHITE,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ProfileImagePicker extends StatefulWidget {
  final HomeViewModel vm;
  const ProfileImagePicker({Key? key, required this.vm}) : super(key: key);

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: widget.vm.imageFile != null
                  ? FileImage(widget.vm.imageFile!)
                  : null,
              radius: 75,
              child: widget.vm.imageFile == null
                  ? const Icon(Icons.person, size: 75)
                  : null,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await widget.vm.takePhoto();
                    setState(
                        () {}); // Actualiza el estado para reflejar la imagen seleccionada
                  },
                  iconSize: 35,
                  color: COLOR_BLACK_LAEL,
                  icon: const Icon(Icons.camera_alt_rounded),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () async {
                    await widget.vm.pickerImage();
                    setState(
                        () {}); // Actualiza el estado para reflejar la imagen seleccionada
                  },
                  color: COLOR_BLACK_LAEL,
                  iconSize: 35,
                  icon: const Icon(Icons.image),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: widget.vm.imageFile != null
                      ? () {
                          widget.vm.updateImg();
                          widget.vm.resetImg();
                          Navigator.pop(
                              context); // Cierra el modal después de guardar la imagen
                        }
                      : null,
                  color: COLOR_BLACK_LAEL,
                  iconSize: 35,
                  icon: const Icon(Icons.check_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
