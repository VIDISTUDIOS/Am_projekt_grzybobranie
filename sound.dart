import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

String formatTime(Duration duration){
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return [
if(duration.inHours > 0) hours,
minutes,
seconds,
  ].join(':');
}

class SoundPage extends StatefulWidget {
  const SoundPage({Key? key}) : super(key: key);
  @override
  State<SoundPage> createState() => _SoundPageState();
}
class _SoundPageState extends State<SoundPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
     setState(() {
       isPlaying = state == PlayerState.PLAYING;
     });
     });

     audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
      });

      audioPlayer.onAudioPositionChanged.listen((newPosition) {
        setState(() {
          position = newPosition;
        });
       });
  }

Future setAudio() async{
  audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  final player = AudioCache(prefix: 'lib/images/');
  final url = await player.load('audio.mp3');
  audioPlayer.setUrl(url.path, isLocal: true);
}


  @override
  void dispose(){
    audioPlayer.dispose();

  }
   @override
   Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding:const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const  SizedBox(height: 32),
          const Text(
           'Forrest song',
           style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
           ) 
          ),
          const  SizedBox(height: 4),
          const Text(
           'Forrest',
           style: TextStyle(
            fontSize: 20,
           ) 
          ),
          Slider (
            min:0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);

              await audioPlayer.resume();
            }, 
          
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position)),
              ],
            ),
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              iconSize: 50,
              onPressed: () async {
                if(isPlaying){
                  await audioPlayer.pause();
                }else{
                  await audioPlayer.resume();
                }
              },
            ),
          ),
        ],
      ),
      
      ),
    );

} 
