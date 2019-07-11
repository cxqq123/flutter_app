import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());


class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords>{

  //所有英文单词的集合
  final _suggestions = <WordPair>[];
  //设置的字体风格
  final biggerFont = const TextStyle(fontSize: 18.0);

  final _saved = new Set<WordPair>();


  //构建每一行
  Widget buildRow(WordPair pair){

    //是否已经保存
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget buildSuggestions(){
    return new ListView.builder(
      // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
      // 在偶数行，该函数会为单词对添加一个ListTile row.
      // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
      // 注意，在小屏幕上，分割线看起来可能比较吃力。
        padding: const EdgeInsets.all(16.0),
        itemBuilder:(context , i){
          // 在每一列之前，添加一个1像素高的分隔线widget
          if(i.isOdd)
            //判断数值是不是奇数
            return new Divider();
          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          if(index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(1));
//            _suggestions.addAll(generateWordPairs().take(10));
          }
          return buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }


}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
//        body: new Center(
////          child: new Text('Hello World'),
//          child: new RandomWords(),
//        ),
        body: new RandomWordsState().buildSuggestions(),
      ),
    );
  }
}