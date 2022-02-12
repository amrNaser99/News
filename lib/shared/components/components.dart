import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:news/modules/web_view/web_view.dart';
import 'package:news/shared/styles/colors.dart';

Widget buildArticlesItem(article,context){
  return InkWell(
    onTap: (){
      NavigateTo(context, WebViewScreen(article['url']),);
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0,),
                // color: Colors.deepOrange
              image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${article['urlToImage']}'),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),

                  ),
                  Text(
                    '${DateFormat.yMMMMEEEEd(article['publishedAt'])}',
                    // '${ article['publishedAt']}',

                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    ),
  );
}

Widget myDivider() => Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget articlesBuilder(list,context,{isSearch = false}) => ConditionalBuilder(
  condition: list.length >0, //state is! NewsLoading //list.length >0
  builder:(context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index) => buildArticlesItem(list[0][index],context),
      separatorBuilder: (context,index) => myDivider(),
      itemCount: list[0].length),
  fallback: (context) => isSearch ? Container() : const Center(child: CircularProgressIndicator()),
);

void NavigateTo(context,widget) =>
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget)
);


Widget defaultButton({
  double width = double.infinity,
  required Color color,
  required String text,
  required void Function() function,
  bool isUpperCase = true,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: function,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
    );

Widget defaultTextFormField({
  required BuildContext context,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String labelText,
  required IconData prefixIcon,
  required FormFieldValidator<String> validate,
  IconData? suffixIcon,
  void Function(String)? onSubmitted,
  void Function(String)? onChanged,
  TextStyle? labelStyle,
  void Function()? onTap,
  bool isPassword = false,
  double radius = 10.0,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        fillColor: primaryColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
      onChanged: onChanged,
      onTap: onTap,
      validator: validate,
      onFieldSubmitted: onSubmitted,
    );
