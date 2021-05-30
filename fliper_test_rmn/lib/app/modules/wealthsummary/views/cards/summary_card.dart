import 'package:fliper_test_rmn/app/modules/wealthsummary/models/wealthsummary_model.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/views/cards/summary_row_card.dart';
import 'package:fliper_test_rmn/app/shared/colors/app_colors.dart';
import 'package:fliper_test_rmn/app/shared/utils/formatter_utils.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final WealthSummaryModel wealthSummaryModel;
  final Function? loadData;

  const SummaryCard(this.wealthSummaryModel, this.loadData);

  @override
  Widget build(BuildContext context) {
    final _formatterUtils = FormatterUtils();

    return Container(
      child: Card(
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 24, 24, 14),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Seu resumo',
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 24,
                      width: 24,
                      child: Transform.translate(
                        offset: const Offset(5, 0),
                        child: PopupMenuButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.more_vert,
                            color: AppColors.popupMenu,
                          ),
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                value: 1,
                                child: Text("Recarregar"),
                              ),
                            ];
                          },
                          onSelected: (value) {
                            loadData!();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 34),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: Text(
                        'Valor investido',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                    Text(
                      _formatterUtils.formatDoubleToReal(
                          wealthSummaryModel.total.toDouble()),
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: SummaryRowCard(
                  textTitle: 'Rentabilidade/mês',
                  textValue: _formatterUtils.formatDoubleToPercent(
                      wealthSummaryModel.profitability, 3),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: SummaryRowCard(
                  textTitle: 'CDI',
                  textValue: _formatterUtils.formatDoubleToPercent(
                      wealthSummaryModel.cdi, 2),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: SummaryRowCard(
                  textTitle: 'Ganho/mês',
                  textValue: _formatterUtils
                      .formatDoubleToReal(wealthSummaryModel.gain),
                ),
              ),
              Visibility(
                visible: wealthSummaryModel.hasHistory,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Divider(
                      height: 0.5,
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.27,
                        child: OutlinedButton(
                          child: Text(
                            'VER MAIS',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            side: BorderSide(
                              width: 1,
                              color: AppColors.darkBlue,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
