import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:makeaplan/api/blog.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/service/blog_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/common.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpFeedbackPage extends StatefulWidget {
  @override
  _HelpFeedbackPageState createState() => _HelpFeedbackPageState();
}

class _HelpFeedbackPageState extends State<HelpFeedbackPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  List<pb.Blog> _blogs;

  @override
  void initState() {
    super.initState();

    _doLoadBlogs();
  }

  _doLoadBlogs() {
    setState(() {
      _blogs = null;
    });

    startProgress(
      context,
      MessageManager(context).inLoading,
      () => BlogService().queryAllBlog(),
      onSuccess: (value) {
        _loadBlogs(value);
      },
    );
  }

  _loadBlogs(List<pb.Blog> bs) async {
    if (_blogs == null) {
      setState(() {
        _blogs = List();
      });
    }
    await Future.delayed(Duration(milliseconds: 100)); // wait for _listKey
    for (var item in bs) {
      var insertIndex = _blogs.length;
      _blogs.add(item);
      _listKey.currentState.insertItem(insertIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSavableAppBar(MessageManager(context).helpFeedback),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: padding_2x, bottom: padding_10x),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: padding_2x, right: padding_2x),
                  child: buildSegment([
                    buildItem(MessageManager(context).sendFeedbackThroughEmail,
                        onPressed: _launchEmailURL),
                  ]),
                ),
                Expanded(
                  child: Scrollbar(
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 3,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: padding_2x, vertical: padding_4x),
                      child: SingleChildScrollView(
                        child: _blogs == null
                            ? buildStubText(MessageManager(context).inLoading)
                            : AnimatedList(
                                key: _listKey,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                initialItemCount: _blogs.length,
                                itemBuilder: (context, index, animation) {
                                  return _buildItem(animation, index);
                                },
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: padding_2x),
                child: Linkify(
                  onOpen: (link) => _launchEmailURL(),
                  text: MessageManager(context).sendEmailToAdminToGetHelp(),
                  style: TextStyle(
                    color: ThemManager().themColors().basic.text2,
                    fontSize: ThemManager().fontSize().small,
                  ),
                  linkStyle: TextStyle(
                    color: ThemManager().themColors().basic.text,
                    fontSize: ThemManager().fontSize().middle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildItem(Animation<double> animation, int index) {
    final b = _blogs[index];
    return Column(
      children: [
        buildItem(b.title, onPressed: () => _launchWebURL(b.url)),
        Container(
          child: index == _blogs.length - 1 ? null : buildItemDivder(),
        ),
      ],
    );
  }

  _launchEmailURL() async {
    final fm = MessageManager(context).feedbackEmailSubject;
    var url = 'mailto:$admin_email?subject=$fm}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      FlutterClipboard.copy(admin_email).then((value) {
        showNoticeDialog(
            context, MessageManager(context).launchEmailAppFailed());
      });
    }
  }

  _launchWebURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      FlutterClipboard.copy(url).then((value) {
        showNoticeDialog(
            context, MessageManager(context).launchWebBrowserAppFailed(url));
      });
    }
  }
}
