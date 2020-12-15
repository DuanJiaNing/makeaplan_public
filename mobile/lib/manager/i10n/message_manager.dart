import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:makeaplan/api/common.pb.dart' as pb;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/api/statistics.pb.dart' as pb;
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/font_size.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/pages/main/plan_statis_card.dart';
import 'package:makeaplan/utils/grpc_error.dart';
import 'package:makeaplan/utils/utils.dart';

import 'i10n_manager.dart';

class MessageManager {
  int _local;

  MessageManager(BuildContext context) {
    _local = zh_CN;
  }

  get thisIsTheLastPlan => "这是最后一个计划";

  get youHaveOnlyOnePlan => "只有一个计划";

  get thisIsTheFirstPlan => "这是第一个计划";

  get inLoading => "加载中...";

  get goAndStartAPlan => "还没有任何计划，快创建一个吧";

  get serverUnavailable => "服务不可用";

  get updateSuccess => "更新成功";

  get noData => "没有数据";

  get noTask => "没有任务";

  get recover => "恢复";

  get noPhase => "没有阶段";

  get archivedPlan => "归档计划";

  get theme => "主题";

  get fontSize => "字体大小";

  get darkMode => "夜间模式";

  get updateUsername => "修改用户名";

  get username => "用户名";

  get inputUsername => "输入用户名";

  get recoverData => "恢复数据";

  get enterApp => "进入应用";

  get startToUseApp => "开始使用";

  get inputDataIDForDataRecover => "输入数据识别码";

  get goOn => "继续";

  get inputDataIDWithNumberAndLetters => "请输入包含字母和数字的 6 位数据识别码。";

  get inRecoving => "恢复中...";

  get recoverSuccess => "数据已恢复";

  get invalidDataID => "数据识别码无效";

  get selectTheme => "选择主题";

  get applied => "已生效";

  get fontSizeSmall => "小";

  get fontSizeLarge => "大";

  get fontSizeMiddle => "中";

  get fontSizeStd => "标准";

  get preview => "预览";

  get previewTitle => "预览字体大小";

  get previewNote => "预览字体大小预览字体大小预览字体大小";

  get inSaving => "保存中...";

  get saveSuccess => "保存成功";

  get inputTitlePlease => "请输入标题";

  get warning => "警告";

  get warningPlanTimeRangeChange =>
      "检测到计划开始/结束时间被修改，计划内现有阶段的时间可能与新的计划时间不匹配，请修改后手动进行调整";

  get leanAndGoOn => "了解，继续";

  get chooseStartDatePlease => "请选择开始日期";

  get totalIndexCanNotBeZero => "目标值不能为 0";

  get warningPhaseTimeRangeChange =>
      "检测到阶段开始/结束时间被修改，阶段内现有任务的时间可能与新的阶段时间不匹配，请修改后手动进行调整";

  get chooseEndDatePlease => "请选择结束日期";

  get account => "账户";

  get alertForAccountContent =>
      "您的数据与当前使用设备绑定，更换设备后需要使用下面的数据识别码通过\"恢复数据\"功能进行数据恢复。";

  get goBackToStartPage => "退到开始界面";

  get clickToCheck => "点击查看";

  get copied => "已复制到剪贴板";

  get copy => "复制";

  get keepYouDataIDSecret => "数据识别码具有唯一性，请注意保存和保密。";

  get chooseAction => "选择操作";

  get updateCompletedIndex => "更新当前完成目标值";

  get delete => "删除";

  get inProcessing => "处理中...";

  get warningDelete => "删除后不可恢复，点击确认进行删除";

  get deleteSuccess => "删除成功";

  get alert => "提示";

  get alertForArchive => "将来可以在 [我的]->[归档] 中找到并恢复该计划。";

  get archiveSuccess => "已归档";

  get alertForRecoveryPlan => "确认恢复该计划";

  get noNote => "没有备注";

  get inputNumberPlease => "请输入数值";

  get aboutApp => "关于应用";

  get helpFeedback => "帮助与反馈";

  get appTitle => "制定一个计划";

  get readyToMakeAPlan => "准备好制定一个计划了吗 ？";

  get plan => "计划";

  get archive => "归档";

  get archived => "已归档";

  get createPlan => "创建计划";

  get save => "保存";

  get enterTitle => "输入标题";

  get chooseStartDate => "选择开始日期";

  get chooseEndDate => "选择结束日期";

  get oneDayPlan => "一日计划";

  get aboutPlanIndex => "关于目标值 ？";

  get choosePlanType => "选择计划类型";

  get addNote => "添加备注";

  get enterNoteHint => "输入备注";

  get cancel => "取消";

  get addPhase => "新增阶段";

  get createPhase => "创建阶段";

  get task => "任务";

  get addTask => "新增任务";

  get createTask => "创建任务";

  get enterNote => "输入描述";

  get chooseStartTime => "选择开始时间";

  get chooseEndTime => "选择结束时间";

  get pending => "待开始";

  get inProgress => "进行中";

  get setupGoalIndex => "设置目标值";

  get goalIndex => "目标值";

  get lowestValue => "最低值";

  get inputNumber => "输入数值";

  get finished => "已结束";

  get confirm => "确认";

  get updateTask => "编辑任务";

  get updatePhase => "编辑阶段";

  get updatePlan => "编辑计划";

  get phase => "阶段";

  get time => "时间";

  get clickToSetup => "点击进行设置";

  get clickToSetupUsername => "点击设置用户名";

  get archivedPlanNotEditable => "归档计划不支持操作";

  get phasedPlan => '分阶段计划';

  get taskList => '任务清单';

  get sendFeedbackThroughEmail => "通过邮件进行反馈";

  get feedbackEmailSubject => "[制定一个计划]用户反馈";

  get creatingPreSetPlan => "创建示例计划...";

  get alertForPlanIndex =>
      "目标值用于为计划设定一个数字化的指标，在计划进行过程中不断修改当前的完成值，可对计划进度有更清晰的判断。";

  get appName => "制定一个计划";

  get rateForUs => "给我们评分";

  get shareWithFriendForUs => "分享给朋友";

  get onBoardingPage => "引导页";

  get shareContent =>
      '我发现一个很好用的时间规划 APP，你也来试试吧。https://itunes.apple.com/app/id1541785145';

  get appVersion => "版本 2020.12.01(1.0.0)";

  get privacyPolicy => "隐私政策";

  get positiveNumberOnly => "数值不能小于 0";

  get errorOccurred => "出错了";

  String resendCaptchaAfter(sec) {
    return _local == zh_CN ? "${sec}s 后重试" : "Resend after $sec seconds";
  }

  String displayDate(DateTime date) {
    final now = DateTime.now();
    final thisYear = now.year == date.year;

    // 6月12日 2018
    DateFormat f1 = DateFormat('yyyy年M月d日', "zh_CN");
    DateFormat f2 = DateFormat('M月d日', "zh_CN");
    return thisYear ? f2.format(date) : f1.format(date);
  }

  String displayTime(DateTime date) {
    final now = DateTime.now();
    final thisYear = now.year == date.year;
    // 6月12日 2018
    DateFormat f1 = DateFormat('yyyy年M月d日 HH:mm', "zh_CN");
    DateFormat f2 = DateFormat('M月d日 HH:mm', "zh_CN");
    return thisYear ? f2.format(date) : f1.format(date);
  }

  String commonStatus(pb.CommonStatus status) {
    if (status == pb.CommonStatus.NOT_STARTED_YET) {
      return pending;
    }

    if (status == pb.CommonStatus.IN_PROGRESS) {
      return inProgress;
    }

    if (status == pb.CommonStatus.FINISHED) {
      return finished;
    }

    return "";
  }

  String startAfter(DateTime startTime) {
    var dur = DateTime.now().difference(startTime).inDays;
    if (dur == 0) {
      return "明天开始";
    }

    if (dur == -1) {
      return "后天开始";
    }

    return "${-dur} 天后开始";
  }

  String displayTimeDuration(DateTime startTime, DateTime endTime) {
    final st = DateTime(startTime.year, startTime.month, startTime.day,
        startTime.hour, startTime.minute, 0, 0, 0);
    final et = DateTime(endTime.year, endTime.month, endTime.day, endTime.hour,
        endTime.minute, 0, 0, 0);

    final ms = et.difference(st).inMinutes;
    int hour = (ms / 60).floor();
    int min = ms % 60;
    final h = hour > 0 ? "$hour小时" : "";
    final m = min > 0 ? "$min分钟" : "";
    return h + m;
  }

  String planOrPhaseDayStatis(
      DateTime startTime, DateTime endTime, pb.CommonStatus status) {
    final ds = Utils.daysStatis(startTime, endTime);
    var passed = ds.passed;
    final total = ds.total;
    passed = passed < 0 ? 0 : passed;
    final finished = status == pb.CommonStatus.FINISHED;
    final d = passed > total ? "$total" : "$passed";
    return finished ? "共计 $total 天" : "$d/$total 天";
  }

  String planPhaseStatis(pb.Statistics statis, pb.PlanType type) {
    final todoList = type == pb.PlanType.TASK_LIST;
    return todoList
        ? "任务清单"
        : (statis.total == 0
            ? "0 个阶段"
            : "${statis.completed}/${statis.total} 个阶段");
  }

  String planOrPhaseTaskStatis(pb.Statistics statis) {
    return statis.total == 0
        ? "0 个任务"
        : "${statis.completed}/${statis.total} 个任务";
  }

  String planGoalIndex(int totalGoalIndex, int completedGoalIndex) {
    return "目标: $completedGoalIndex/$totalGoalIndex";
  }

  String numberCanNotGreaterThan(int maxNumber) {
    return "数值不能大于 $maxNumber";
  }

  String appFontSize() {
    final fm = ThemManager().fontSizeMode;
    if (fm == font_size_small) {
      return "小";
    }

    if (fm == font_size_middle) {
      return "中";
    }

    if (fm == font_size_large) {
      return "大";
    }

    return "标准";
  }

  String timeRange(
    DateTime startTime,
    DateTime endTime, {
    bool displayAsTime = false,
    bool showOneDayPlanHit = false,
  }) {
    final startTimeNull = Utils.zeroDateTime(startTime);
    final endTimeNull = Utils.zeroDateTime(endTime);
    if (startTimeNull && endTimeNull) {
      return "";
    }

    if (!Utils.zeroDateTime(startTime) && !Utils.zeroDateTime(endTime)) {
      var text = displayDate(startTime);
      if (displayAsTime) {
        text = displayTime(startTime);
      }

      final iod = Utils.inOneDay(startTime, endTime);
      if (showOneDayPlanHit && iod) {
        text += "(一日计划)";
        return text;
      }

      var str = " - " + displayDate(endTime);
      if (displayAsTime) {
        str = " - " + displayTime(endTime);
      }
      return text + str;
    }

    final suf = startTimeNull ? " 结束" : " 开始";
    final ut = startTimeNull ? endTime : startTime;
    var text = displayDate(ut);
    if (displayAsTime) {
      text = displayTime(ut);
    }
    return text + suf;
  }

  String maxPlanCountReached() {
    return "最多创建 $max_active_plan_count 个计划，请耐心完成现有计划。";
  }

  String maxTaskCountReached() {
    return "最多创建 $max_task_count 个任务";
  }

  String maxPhaseCountReached() {
    return "最多创建 $max_phase_count 个阶段";
  }

  String leftPlanToCreate(int count) {
    return "还可以创建 $count 个计划";
  }

  String phaseStatis(pb.Statistics ps) {
    return "共有 ${ps.total} 个阶段，已完成 ${ps.completed} 个。";
  }

  String taskStatis(pb.Statistics ts) {
    return "共有 ${ts.total} 个任务，已完成 ${ts.completed} 个。";
  }

  String dayStatis(DaysStatis daysStatis) {
    if (daysStatis.passed == -1) {
      return "共计 ${daysStatis.total} 天，明天开始。";
    }

    if (daysStatis.passed == -2) {
      return "共计 ${daysStatis.total} 天，后天开始。";
    }

    if (daysStatis.passed < 0) {
      return "共计 ${daysStatis.total} 天，${-daysStatis.passed - 1} 天后开始。";
    }

    if (daysStatis.passed == 0) {
      return "共计 ${daysStatis.total} 天，今天是计划开始的第一天。";
    }

    if (daysStatis.passed < daysStatis.total) {
      return "共计 ${daysStatis.total} 天，今天是第 ${daysStatis.passed} 天，剩余 ${daysStatis.total - daysStatis.passed} 天。";
    }

    if (daysStatis.passed == daysStatis.total) {
      return "共计 ${daysStatis.total} 天，今天是最后一天。";
    }

    final psd = daysStatis.passed - daysStatis.total;
    return "共计 ${daysStatis.total} 天，计划已经结束 $psd 天。";
  }

  String planIndexStatis(pb.Plan p) {
    return "目标值为 ${p.totalIndex}，最低 ${p.minIndex}，当前完成 ${p.completedIndex}。";
  }

  String progressStatis(int highlightStatis, double progress) {
    String typz;
    if (highlightStatis == statisPhaseIndex) {
      typz = phase;
    } else if (highlightStatis == statisTaskIndex) {
      typz = task;
    } else if (highlightStatis == statisDaysIndex) {
      typz = time;
    } else if (highlightStatis == statisGoalIndex) {
      typz = goalIndex;
    }

    return "$typz进度: ${(progress * 100).round()}%";
  }

  String maxTextLengthReached(int len) {
    return "请把字数控制在 $len 个字内";
  }

  String maxRetryOfRecoverDataCountReached() {
    return "一天内最多尝试 $max_update_device_id_count 次，请联系管理员。邮箱: $admin_email。";
  }

  colorTheme(int tm) {
    if (tm == them_001) {
      return "黄色";
    }

    if (tm == them_002) {
      return "深蓝色";
    }

    if (tm == them_003) {
      return "红色";
    }

    if (tm == them_004) {
      return "粉色";
    }

    return "默认";
  }

  String saveSuccessForPlanWithCode(code) {
    return "保存成功，计划代码: $code";
  }

  String maxNoteTextLengthReached(int len) {
    return "请把备注字数控制在 $len 个字内";
  }

  String maxTitleTextLengthReached(int len) {
    return "请把标题字数控制在 $len 个字内";
  }

  String recoverySuccessForPlanWithCode(v) {
    return "恢复成功，计划代码: " + v;
  }

  String planStatis(int highlightStatis, pb.PlanSummary planSummary) {
    if (highlightStatis == statisPhaseIndex) {
      return phaseStatis(planSummary.phaseStatis);
    }

    if (highlightStatis == statisTaskIndex) {
      return taskStatis(planSummary.taskStatis);
    }

    if (highlightStatis == statisDaysIndex) {
      final daysStatis = Utils.daysStatis(
        Utils.pb2DateTime(planSummary.plan.startTime),
        Utils.pb2DateTime(planSummary.plan.endTime),
      );

      return dayStatis(daysStatis);
    }

    if (highlightStatis == statisGoalIndex) {
      return planIndexStatis(planSummary.plan);
    }

    return "";
  }

  sendEmailToAdminToGetHelp() {
    return "发送邮件到 $admin_email 获取帮助";
  }

  launchEmailAppFailed() {
    return "未找到邮件服务，邮件地址 [$admin_email] 已复制到剪贴板，请手动发送邮件。";
  }

  launchWebBrowserAppFailed(url) {
    return "未找到浏览器服务，网址 [$url] 已复制到剪贴板，请手动打开。";
  }

  String archivedAt(DateTime time) {
    return "归档于 " + displayTime(time);
  }

  String error(error) {
    if (GRPCError.unavailable(error)) {
      return "请检查你的网络";
    }

    if (GRPCError.noDataFound(error)) {
      return noData;
    }

    return "抱歉，出错了";
  }
}
