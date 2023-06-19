import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:math';

List<String> youtubeVideoUrls = [
  'https://www.youtube.com/watch?v=_MTd1opMBk0',
  'https://youtu.be/XXb-Kp31BQw',
  'https://youtu.be/D31h0iz6Gt0',
  'https://youtu.be/83nwteWchUA',
  'https://youtu.be/iHCCwk3CV70',
];

class ResearchPage extends StatefulWidget {
  @override
  _ResearchPageState createState() => _ResearchPageState();
}

class _ResearchPageState extends State<ResearchPage> {
  List<String> youtubeVideoUrls = [
    'https://www.youtube.com/watch?v=_MTd1opMBk0',
    'https://youtu.be/XXb-Kp31BQw',
    'https://youtu.be/D31h0iz6Gt0',
    'https://youtu.be/83nwteWchUA',
    'https://youtu.be/iHCCwk3CV70',
  ];

  void openYoutubeVideo(String videoUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubePlayerScreen(
          videoUrl: videoUrl,
        ),
      ),
    );
  }

  void playTimeBasedVideo(int minutes) {
    int index = minutes ~/ 5; // 5분 단위로 인덱스 계산
    if (index < youtubeVideoUrls.length) {
      openYoutubeVideo(youtubeVideoUrls[index]);
    } else {
      // 임의의 영상 재생
      openYoutubeVideo(youtubeVideoUrls[Random().nextInt(youtubeVideoUrls.length)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 16.0),
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.5),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: '검색',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '오늘의 명상',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                openYoutubeVideo(youtubeVideoUrls[0]);
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/meditation.jpg'),
                    fit: BoxFit.cover,
                  ),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 270.0, 8.0),
                    child: Text(
                      '목표별 명상',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          openYoutubeVideo(youtubeVideoUrls[1]);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 2.0,
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/sleep.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '수면',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          openYoutubeVideo(youtubeVideoUrls[2]);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 2.0,
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/stress.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '스트레스 및 불안 완화',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          openYoutubeVideo(youtubeVideoUrls[3]);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 2.0,
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/calm.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '몸 진정시키기',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          openYoutubeVideo(youtubeVideoUrls[4]);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 2.0,
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/impor.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '집중력 향상',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          openYoutubeVideo(youtubeVideoUrls[0]);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 2.0,
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/grow.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '자기 성장',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          openYoutubeVideo(youtubeVideoUrls[1]);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 2.0,
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/happy.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '행복 증진',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 2,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '시간별 명상',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      playTimeBasedVideo(3);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 45,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '3분',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      playTimeBasedVideo(5);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 45,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '5분',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      playTimeBasedVideo(10);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 45,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '10분',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      playTimeBasedVideo(20);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 45,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '20분',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      playTimeBasedVideo(30);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 45,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '30분',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      playTimeBasedVideo(35);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 45,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '30분+',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 2,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubePlayerScreen extends StatefulWidget {
  final String videoUrl;

  YoutubePlayerScreen({required this.videoUrl});

  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;
  late bool _isPlayerReady;

  @override
  void initState() {
    super.initState();
    _isPlayerReady = false;
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: false,
        enableCaption: true,
        forceHD: false,
        hideControls: false,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          topActions: <Widget>[
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {
                // TODO: Implement settings
              },
            ),
          ],
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {
            _controller.load(
              YoutubePlayer.convertUrlToId(youtubeVideoUrls[Random().nextInt(youtubeVideoUrls.length)])!,
            );
          },
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
            ],
          );
        },
      ),
    );
  }
}
