import 'package:flutter/material.dart';

import 'package:libraryapp_withapi/recources/constants.dart';
import 'package:libraryapp_withapi/screens/book_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Индекс текущей страницы

  // Список страниц
  static final List<Widget> _pages = <Widget>[
    BookScreen(),
    const Center(child: Text('Мои книги', style: TextStyle(fontSize: 24))),
    //RentedBooksScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Изменяем индекс при нажати
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      /*  body: SafeArea(
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
      ), */
      body: _pages[_selectedIndex], // Отображаем текущую страницу
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Книги',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Мои книги',
          ),
        ],
        currentIndex: _selectedIndex, // Указываем текущий индекс
        selectedItemColor: Colors.blue, // Цвет выбранного элемента
        unselectedItemColor: Colors.grey, // Цвет невыбранных элементов
        onTap: _onItemTapped, // Обработчик нажатий
      ),
    );
  }
}
