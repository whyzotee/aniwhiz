import 'package:aniwhiz/app/core/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Expanded(
                child: TextField(
                  autofocus: true,
                  cursorColor: Colors.white,
                  onChanged: (text) {},
                  // controller: controller.search,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    fillColor: const Color(0xFF252525),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    hintStyle: const TextStyle(color: Colors.white),
                    suffixIconConstraints: const BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 30,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(LucideIcons.x, color: AppTheme.cBlack),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
