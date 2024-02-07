
import '../../../../exports.dart';

class CustomTextField extends StatefulWidget {
  Function   function;
   CustomTextField({Key? key,required this.function}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 400,
        decoration: BoxDecoration(
          color: KColor.greyColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          onChanged: (value)=>widget.function,
          cursorColor: KColor.primaryColor,
          decoration: InputDecoration(
            isDense: true,
            hintText: KString.searchCity,
            suffixIcon: Icon(
              Icons.search,
              color: KColor.greyColor,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: KColor.primaryColor,
                    width: 2.0)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: KColor.transparentColor,
                    width: 2.0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: KColor.transparentColor,
                    width: 2.0)),
          ),
        ),
      ),
    );
  }
}
