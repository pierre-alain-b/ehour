package net.rrm.ehour.ui.report.panel.aggregate

import net.rrm.ehour.report.criteria.ReportCriteria
import net.rrm.ehour.ui.common.report.AggregatedReportConfig
import net.rrm.ehour.ui.report.TreeReportModel
import net.rrm.ehour.ui.report.excel.CustomerReportExcel
import org.apache.wicket.model.PropertyModel

class CustomerReportPanel(id: String, reportModel: TreeReportModel) extends AggregateReportPanel(id, reportModel,
                AggregatedReportConfig.AGGREGATE_CUSTOMER,
                AggregateReportChartGenerator.generateCustomerReportChart,
                new CustomerReportExcel(new PropertyModel[ReportCriteria](reportModel, "reportCriteria")))
