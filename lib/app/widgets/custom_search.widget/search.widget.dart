import 'package:flutter/material.dart';

class SearchFilterWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controllerSearch;

  const SearchFilterWidget(this.controllerSearch,
      {Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controllerSearch,
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: Colors.black),
          suffixIcon: controllerSearch.text.isNotEmpty
              ? GestureDetector(
                  child: const Icon(Icons.close, color: Colors.black),
                  onTap: () {
                    controllerSearch.clear();
                    onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: 'Buscar',
          hintStyle: const TextStyle(color: Colors.black54),
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.black),
        onChanged: onChanged,
      ),
    );
  }
}
