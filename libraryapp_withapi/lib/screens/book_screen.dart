import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libraryapp_withapi/recources/constants.dart';
import 'package:libraryapp_withapi/widgets/book_card.dart';
import 'package:libraryapp_withapi/widgets/search_box.dart';

import '../bloc/book_cubit.dart';
import '../bloc/book_state.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final cubit = context.read<BookCubit>();
      cubit.fetchNewBook();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Column(
          children: [
            const SearchBox(),
            BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                if (state is LoadingBookState || state is InitBookState) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColor.accent),
                      ),
                    ),
                  );
                } else if (state is ResponseBookState) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.64,
                        crossAxisCount: 2,
                      ),
                      itemCount: state.books.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BookCard(
                          imgUrl: state.books[index].imageUrl,
                          title: state.books[index].title,
                          price: state.books[index].price, 
                         
                        
                           
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: Text((state as ErrorBookState).error));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
