import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

const INPUT_BG_COLOR = Color(0xFFFBFBFB);

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  List<dynamic> _searchResults = [];
  final List<String> _recentSearches = ["젠사이야"]; // 최근 검색어 목록에 "젠사이야" 추가

  Future<void> _searchRestaurants(String keyword) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.example.com/restaurants',
        queryParameters: {'search': keyword},
      );

      setState(() {
        _searchResults = response.data;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              height:
                  MediaQuery.of(context).padding.top + 8), // 노치 부분 고려하여 패딩 추가
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: '검색어를 입력해 주세요',
                filled: true,
                fillColor: const Color.fromARGB(
                    255, 234, 234, 234), // TextField의 배경색을 회색으로 설정
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0), // 모서리 더 둥글게 설정
                  borderSide: BorderSide.none, // 테두리 없애기
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _searchRestaurants(_controller.text);
                  },
                ),
              ),
              onSubmitted: (value) {
                _searchRestaurants(value);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  '최근 검색어',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _recentSearches.length,
              itemBuilder: (context, index) {
                final search = _recentSearches[index];
                return InkWell(
                  onTap: () {
                    _controller.text = search;
                    _searchRestaurants(search);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.history, size: 24),
                        const SizedBox(width: 16),
                        Text(
                          search,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final restaurant = _searchResults[index];
                      return ListTile(
                        leading: Image.network(restaurant['image']),
                        title: Text(restaurant['name']),
                        subtitle: Text(restaurant['address']),
                        onTap: () {
                          // 가게 상세 화면으로 이동
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
