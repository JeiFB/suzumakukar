import 'dart:io';

import 'package:flutter/material.dart';

class SuzumakukarPickerImage extends StatelessWidget {
  final Function onTap;
  final File? image;
  const SuzumakukarPickerImage(this.onTap, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 130,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(12)),
            child: image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover, // La imagen cubrirá todo el contenedor
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                      ),
                      Text('Agregar imagen')
                    ],
                  ),
          ),
        ));
  }
}
