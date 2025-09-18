/*
 * Copyright (c) 2020 - 2021 : William Todt
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:intl/intl.dart';
import 'package:receipt_manager/app/pages/stats/stats_notifier.dart';
import 'package:receipt_manager/app/pages/stats/stat_view.dart';
import 'package:receipt_manager/app/widgets/stats/stats_card.dart';
import 'package:receipt_manager/data/helpers/category_chart.dart';
import 'package:receipt_manager/data/helpers/month_chart.dart';
import 'package:receipt_manager/data/helpers/weekly_chart.dart';
import 'package:receipt_manager/data/storage/scheme/holder_table.dart';
import 'package:receipt_manager/generated/l10n.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsPageRiverpod extends ConsumerWidget {
  const StatsPageRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsState = ref.watch(statsNotifierProvider);
    final statsNotifier = ref.read(statsNotifierProvider.notifier);

    final TooltipBehavior monthToolTip = TooltipBehavior(enable: true);
    final TooltipBehavior weekToolTip = TooltipBehavior(enable: true);
    final TooltipBehavior categoryToolTip = TooltipBehavior(enable: true);

    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: NeumorphicAppBar(
          title: Text(S.of(context).analytics),
        ),
        body: statsState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : _buildStatsContent(context, statsState.receipts, monthToolTip, weekToolTip, categoryToolTip),
      ),
    );
  }

  Widget _buildStatsContent(
    BuildContext context,
    List<ReceiptHolder> receipts,
    TooltipBehavior monthToolTip,
    TooltipBehavior weekToolTip,
    TooltipBehavior categoryToolTip,
  ) {
    List<Widget> widgets = [
      _getYearOverview(context, receipts, monthToolTip),
      _getWeeklyOverview(context, receipts, weekToolTip),
      _getCategoryOverview(context, receipts, categoryToolTip),
    ];

    return Swiper(
      index: 0,
      itemBuilder: (BuildContext context, int index) {
        return widgets[index];
      },
      itemCount: widgets.length,
      scrollDirection: Axis.vertical,
      pagination: SwiperPagination(builder: SwiperPagination.dots),
    );
  }

  Widget _getMonthChart(BuildContext context, List<ReceiptHolder> receipts, TooltipBehavior monthToolTip) {
    MonthlyOverview overview = MonthlyOverview(receipts);
    List<ReceiptMonthData> data = overview.getData();

    int year = DateTime.now().year;
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      tooltipBehavior: monthToolTip,
      series: <CartesianSeries<ReceiptMonthData, String>>[
        LineSeries<ReceiptMonthData, String>(
          name: S.of(context).monthlyTotal,
          color: Colors.red,
          dataSource: data,
          xValueMapper: (ReceiptMonthData data, _) =>
              DateFormat.MMM().format((DateTime.utc(year, data.month, 0))),
          yValueMapper: (ReceiptMonthData data, _) => data.total,
        ),
      ],
    );
  }

  Widget _getWeeklyChart(BuildContext context, List<ReceiptHolder> receipts, TooltipBehavior weekToolTip) {
    WeeklyOverview overview = WeeklyOverview(receipts);
    List<WeeklyChartData> data = overview.getData();
    int year = DateTime.now().year;

    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      tooltipBehavior: weekToolTip,
      series: <CartesianSeries<WeeklyChartData, String>>[
        ColumnSeries<WeeklyChartData, String>(
          color: Colors.red,
          name: S.of(context).weeklyTotal,
          dataSource: data,
          xValueMapper: (WeeklyChartData data, _) => DateFormat.E()
              .format((DateTime.utc(year, data.date.month, data.date.day))),
          yValueMapper: (WeeklyChartData data, _) => data.total,
          enableTooltip: true,
          width: 0.75,
        ),
      ],
    );
  }

  Widget _getCategoryChart(BuildContext context, List<ReceiptHolder> receipts, TooltipBehavior categoryToolTip) {
    CategoryOverview overview = CategoryOverview(receipts);
    List<CategoryData> data = overview.getData();

    if (data.isEmpty) return Container();
    return SfCircularChart(
      legend: const Legend(isVisible: true),
      tooltipBehavior: categoryToolTip,
      series: <CircularSeries>[
        PieSeries<CategoryData, String>(
          enableTooltip: true,
          dataSource: data,
          xValueMapper: (CategoryData data, _) => data.label,
          yValueMapper: (CategoryData data, _) => data.total,
          name: S.of(context).category,
        ),
      ],
    );
  }

  Widget _getYearOverview(BuildContext context, List<ReceiptHolder> receipts, TooltipBehavior monthToolTip) {
    return StatsCard(
      S.of(context).annualOverview,
      S.of(context).expensesOverview,
      _getMonthChart(context, receipts, monthToolTip),
    );
  }

  Widget _getWeeklyOverview(BuildContext context, List<ReceiptHolder> receipts, TooltipBehavior weekToolTip) {
    return StatsCard(
      S.of(context).weeklyOverview,
      S.of(context).expensesOverview,
      _getWeeklyChart(context, receipts, weekToolTip),
    );
  }

  Widget _getCategoryOverview(BuildContext context, List<ReceiptHolder> receipts, TooltipBehavior categoryToolTip) {
    return StatsCard(
      S.of(context).categoryOverview,
      S.of(context).expensesOverview,
      _getCategoryChart(context, receipts, categoryToolTip),
    );
  }
}