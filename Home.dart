import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMood = '';
  Map<String, IconData> moodIcons = {
    '평온함': Icons.sentiment_satisfied,
    '행복': Icons.sentiment_very_satisfied,
    '피곤함': Icons.sentiment_neutral,
    '불안함': Icons.sentiment_dissatisfied,
    '화남': Icons.sentiment_very_dissatisfied,
    '패닉': Icons.sentiment_very_dissatisfied,
  };

  List<String> youtubeVideoUrls = [
    'https://www.youtube.com/watch?v=_MTd1opMBk0',
    'https://youtu.be/XXb-Kp31BQw',
    'https://youtu.be/D31h0iz6Gt0',
    'https://youtu.be/83nwteWchUA',
    'https://youtu.be/iHCCwk3CV70',
  ];

  List<String> youtubeVideoTitles = [
    '유튜브 제목 0',
    '유튜브 제목 1',
    '유튜브 제목 2',
    '유튜브 제목 3',
    '유튜브 제목 4',
  ];

  List<String> youtubeVideoAuthors = [
    '작성자 이름 0',
    '작성자 이름 1',
    '작성자 이름 2',
    '작성자 이름 3',
    '작성자 이름 4',
  ];

  List<String> youtubeThumbnailUrls = [
    'https://img.youtube.com/vi/_MTd1opMBk0/mqdefault.jpg',
    'https://img.youtube.com/vi/XXb-Kp31BQw/mqdefault.jpg',
    'https://img.youtube.com/vi/D31h0iz6Gt0/mqdefault.jpg',
    'https://img.youtube.com/vi/83nwteWchUA/mqdefault.jpg',
    'https://img.youtube.com/vi/iHCCwk3CV70/mqdefault.jpg',
  ];

  List<String> recentPlaylist = []; // 최근 재생 목록
  Set<String> favoriteVideos = {}; // 즐겨찾기한 비디오 URL 집합

  @override
  void initState() {
    super.initState();
    shuffleYoutubeVideos();
  }

  void shuffleYoutubeVideos() {
    final random = Random();
    for (var i = youtubeVideoUrls.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);

      // Swap URLs
      final tempUrl = youtubeVideoUrls[i];
      youtubeVideoUrls[i] = youtubeVideoUrls[j];
      youtubeVideoUrls[j] = tempUrl;

      // Swap titles
      final tempTitle = youtubeVideoTitles[i];
      youtubeVideoTitles[i] = youtubeVideoTitles[j];
      youtubeVideoTitles[j] = tempTitle;

      // Swap authors
      final tempAuthor = youtubeVideoAuthors[i];
      youtubeVideoAuthors[i] = youtubeVideoAuthors[j];
      youtubeVideoAuthors[j] = tempAuthor;

      // Swap thumbnail URLs
      final tempThumbnailUrl = youtubeThumbnailUrls[i];
      youtubeThumbnailUrls[i] = youtubeThumbnailUrls[j];
      youtubeThumbnailUrls[j] = tempThumbnailUrl;
    }
  }

  bool isVideoFavorite(String videoUrl) {
    return favoriteVideos.contains(videoUrl);
  }

  void toggleFavoriteVideo(String videoUrl) {
    setState(() {
      if (favoriteVideos.contains(videoUrl)) {
        favoriteVideos.remove(videoUrl);
      } else {
        favoriteVideos.add(videoUrl);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background0.jpg'), // 배경 이미지 경로
            fit: BoxFit.cover, // 이미지를 화면에 꽉 채우도록 설정
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.circle, size: 40),
                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  // 동그라미 버튼을 눌렀을 때의 기능을 여기에 작성
                },
              ),
            ),
            SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 2,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                '안녕하세요',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue.shade900.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    side: BorderSide(width: 2, color: Colors.white.withOpacity(0.5)),
                  ),
                  child: Text(selectedMood.isEmpty ? '오늘의 기분 선택하기' : '오늘의 기분: $selectedMood',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          color: Colors.grey.shade100,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.close, color: Colors.black),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(width: 48),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                '오늘의 기분',
                                style: TextStyle(color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(height: 8),
                              GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                padding: const EdgeInsets.all(32.0),
                                children: moodIcons.keys.map((mood) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      padding: const EdgeInsets.all(8),
                                      side: BorderSide(width: 1, color: Colors.grey),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        selectedMood = mood;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(moodIcons[mood], size: 30, color: Colors.black),
                                        SizedBox(height: 8),
                                        Text(mood, style: TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 2,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                '추천하는 명상',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ...List.generate(5, (index) {
              final videoUrl = youtubeVideoUrls[index];
              final isFavorite = isVideoFavorite(videoUrl);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YoutubePlayerScreen(
                          videoUrl: videoUrl,
                          recentPlaylist: recentPlaylist,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 120,
                      color: Colors.lightBlue.shade900.withOpacity(0.5),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Container(
                                  width: 150,
                                  child: Image.network(
                                    youtubeThumbnailUrls[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 32),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        youtubeVideoTitles[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        youtubeVideoAuthors[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 50,
                            right: 16,
                            child: GestureDetector(
                              onTap: () {
                                toggleFavoriteVideo(videoUrl);
                              },
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue.shade900.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  side: BorderSide(width: 2, color: Colors.white.withOpacity(0.5)),
                ),
                child: Text('새로 고침',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    shuffleYoutubeVideos();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 2,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Container(
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue.shade900.withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          side: BorderSide(width: 2, color: Colors.white.withOpacity(0.5)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite),
                            SizedBox(height: 4),
                            Text('즐겨찾기',
                                style:
                                TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavoriteVideosScreen(
                                favoriteVideos: favoriteVideos,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue.shade900.withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          side: BorderSide(width: 2, color: Colors.white.withOpacity(0.5)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(height: 4),
                            Text('최근 재생 목록',
                                style:
                                TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecentPlaylistScreen(
                                recentPlaylist: recentPlaylist,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubePlayerScreen extends StatefulWidget {
  final String videoUrl;
  final List<String> recentPlaylist;

  const YoutubePlayerScreen({required this.videoUrl, required this.recentPlaylist});

  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        hideControls: true,
        controlsVisibleAtStart: false,
        mute: true,
      ),
    );
    SystemChrome.setEnabledSystemUIOverlays([]); // 상태 표시줄 숨기기
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]); // 가로 방향으로 설정
    widget.recentPlaylist.add(widget.videoUrl); // 최근 재생 목록에 추가
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values); // 상태 표시줄 보이기
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); // 세로 방향으로 설정
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 배경색을 검정색으로 설정
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width, // 화면 너비를 사용
          height: MediaQuery.of(context).size.height, // 화면 높이를 사용
          child: Transform.rotate(
            angle: 0,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                print('Player is ready.');
              },
            ),
          ),
        ),
      ),
    );
  }
}

class RecentPlaylistScreen extends StatelessWidget {
  final List<String> recentPlaylist;

  const RecentPlaylistScreen({required this.recentPlaylist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900, // 네비게이션 바 색상 변경
        title: Text('최근 재생 목록'),
      ),
      body: ListView.builder(
        itemCount: recentPlaylist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recentPlaylist[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YoutubePlayerScreen(
                    videoUrl: recentPlaylist[index],
                    recentPlaylist: recentPlaylist,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FavoriteVideosScreen extends StatelessWidget {
  final Set<String> favoriteVideos;

  const FavoriteVideosScreen({required this.favoriteVideos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900, // 네비게이션 바 색상 변경
        title: Text('즐겨찾기한 비디오'),
      ),
      body: ListView.builder(
        itemCount: favoriteVideos.length,
        itemBuilder: (context, index) {
          final videoUrl = favoriteVideos.elementAt(index);

          return ListTile(
            title: Text(videoUrl),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YoutubePlayerScreen(
                    videoUrl: videoUrl,
                    recentPlaylist: [],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
