import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String? errorText;
  final Function onChanged;
  final bool needSuffixIcon;
  final TextEditingController myController;

  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.needSuffixIcon,
    required this.errorText,
    required this.onChanged,
    required this.myController,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.needSuffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: _isObscure,
          controller: widget.myController,
          onChanged: (value) => widget.onChanged(value),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: const TextStyle(
              fontSize: 12,
            ),
            errorText: widget.errorText,
            suffixIcon: widget.needSuffixIcon
                ? IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : const SizedBox(),
          ),
        ),
        const SizedBox(height: 15.0)
      ],
    );
  }
}
