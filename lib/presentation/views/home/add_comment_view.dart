import 'package:flutter/material.dart';

class AddCommentView extends StatelessWidget {
  const AddCommentView({
    super.key,
    required this.isFullExpandedNotifier,
    required this.isExpandedNotifier,
  });

  final ValueNotifier<bool> isFullExpandedNotifier;
  final ValueNotifier<bool> isExpandedNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isFullExpandedNotifier,
        builder: (context, isFullExpandedNotifierValue, child) {
          return ValueListenableBuilder(
            valueListenable: isExpandedNotifier,
            builder: (context, isExpandedNotifierValue, child) {
              return isExpandedNotifierValue
                  ? Container()
                  : Container(
                      color: Colors.grey.shade900,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isFullExpandedNotifierValue)
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                left: 10,
                                bottom: 5,
                              ),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Please follow ",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: "community rules ",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "when commenting.",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 60,
                            child: Focus(
                              onFocusChange: (val) {
                                isFullExpandedNotifier.value = val;
                              },
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.image_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade900,
                                  hintText: "Add a comment",
                                  hintStyle: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade800),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade800),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade800),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade800),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade800),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (isFullExpandedNotifierValue)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          //TODO
                                        },
                                        child: const Icon(
                                          Icons.attachment,
                                          color: Colors.white60,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          //TODO
                                        },
                                        child: const Icon(
                                          Icons.image_outlined,
                                          color: Colors.white60,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Material(
                                    color: Colors.blue.shade300,
                                    borderRadius: BorderRadius.circular(15),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: InkWell(
                                      onTap: () {
                                        //TODO
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Text(
                                          "Reply",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
            },
          );
        });
  }
}
