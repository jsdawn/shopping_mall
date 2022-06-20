import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class RefreshLoadMoreView extends StatefulWidget {
  const RefreshLoadMoreView(
      {Key? key,
      this.onRefresh,
      this.onLoadMore,
      required this.isFinished,
      required this.child,
      this.noMoreText})
      : super(key: key);

  final Future<void> Function()? onRefresh;

  final Future<void> Function()? onLoadMore;

  final bool isFinished;

  // auto height widget
  final Widget child;

  final String? noMoreText;

  @override
  State<RefreshLoadMoreView> createState() => _RefreshLoadMoreViewState();
}

class _RefreshLoadMoreViewState extends State<RefreshLoadMoreView> {
  late ScrollController _scrollController;
  bool _isLoading = false;

  void _updateLoading(bool _bool) {
    if (mounted) {
      setState(() {
        _isLoading = _bool;
      });
    }
  }

  void _loadAction() {
    if (!widget.isFinished && widget.onLoadMore != null) {
      _updateLoading(true);
      widget.onLoadMore!().then((value) {
        _updateLoading(false);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _loadAction();

    // 监听滚动操作
    _scrollController.addListener(() {
      if (_scrollController.hasClients &&
          (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent)) {
        // 滑动到底部
        if (_isLoading) return;
        _loadAction();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _mainContent = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          widget.child,
          _footerBlock(),
        ]),
      ),
    );

    if (widget.onRefresh == null) {
      return Scrollbar(child: _mainContent);
    }

    return RefreshIndicator(
      onRefresh: () async {
        if (_isLoading) return;
        await widget.onRefresh!();
      },
      child: _mainContent,
    );
  }

  Widget _footerBlock() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: AppTheme.chipBackground,
      child: Center(
        child: Text(
          widget.isFinished
              ? (widget.noMoreText ?? '已经到底啦')
              : _isLoading
                  ? '加载中...'
                  : '加载完成',
          style: AppTheme.caption.copyWith(letterSpacing: 1.8),
        ),
      ),
    );
  }
}
