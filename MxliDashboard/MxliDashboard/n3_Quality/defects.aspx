﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="defects.aspx.cs" Inherits="MxliDashboard.n3_Quality.defects" %>

<%@ Register Assembly="DevExpress.XtraCharts.v20.1.Web, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>
<%@ Register Assembly="DevExpress.XtraCharts.v20.1.Web, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p></p>
    <h3>Defects.</h3>
    <p></p>
        <a class="btn btn-danger" href="../Reports/ReportViewer1.aspx">Print</a>
    <p></p>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" HeaderText="Views and Filters" ForeColor="Black" AllowCollapsingByHeaderClick="True">
        <HeaderStyle ForeColor="White" />
        <HeaderContent BackColor="#666666">
        </HeaderContent>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
                <table style="table-layout: fixed">
                    <tr>
                        <th>
                            <dx:ASPxLabel ID="ASPxLabelCaption1" runat="server" Text="Select VSM">
                            </dx:ASPxLabel>
                            <dx:ASPxComboBox ID="ASPxComboBoxVsmInContent" runat="server" ValueField="vsm"
                                TextField="vsm" ValueType="System.String" DataSourceID="SqlDataSourceVsm"
                                AutoPostBack="True" OnDataBound="cmbox_DataBoundVsm">
                                <ClientSideEvents Validation="function(s, e) {
                                            if (s.GetSelectedIndex()==0) {
                                            e.isValid = false;
                                            e.errorText = &quot;You should Select One VSM&quot;;
                                            }}" />
                                <ValidationSettings ValidateOnLeave="False">
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </th>
                        <th>
                            <dx:ASPxLabel ID="ASPxLabelCaption2" runat="server" Text="Select MRP">
                            </dx:ASPxLabel>
                            <dx:ASPxComboBox ID="ASPxComboBoxMrpInContent" runat="server" ValueField="mrp"
                                TextField="mrp" ValueType="System.String" DataSourceID="SqlDataSourceMrp"
                                AutoPostBack="True" OnDataBound="cmbox_DataBoundMrp">
                                <ClientSideEvents Validation="function(s, e) {
                                            if (s.GetSelectedIndex()==0) {
                                            e.isValid = false;
                                            e.errorText = &quot;You should Select One MRP&quot;;
                                            }}" />
                                <ValidationSettings ValidateOnLeave="False">
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </th>
                        <th>
                            <dx:ASPxLabel ID="ASPxLabelCaption3" runat="server" Text="Select Cell">
                            </dx:ASPxLabel>
                            <dx:ASPxComboBox ID="ASPxComboBoxCellInContent" runat="server" ValueField="cell"
                                TextField="cell" ValueType="System.String" DataSourceID="SqlDataSourceCell"
                                AutoPostBack="True" OnDataBound="cmbox_DataBoundCell">
                                <ClientSideEvents Validation="function(s, e) {
                                            if (s.GetSelectedIndex()==0) {
                                            e.isValid = false;
                                            e.errorText = &quot;You should Select One Cell&quot;;
                                            }}" />
                                <ValidationSettings ValidateOnLeave="False">
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </th>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <p />
    <hr />
    <p />
    <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Width="100%" HeaderText="Data chart" ForeColor="Black" AllowCollapsingByHeaderClick="True">
        <HeaderStyle ForeColor="White" />
        <HeaderContent BackColor="#666666">
        </HeaderContent>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent2" runat="server">
                <dx:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="SqlDataSource1" CrosshairEnabled="True" Height="200px" Width="1024px"
                    ClientInstanceName="chart" AutoLayout="True">
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX VisibleInPanesSerializable="-1" MinorCount="1">
                                <QualitativeScaleOptions AutoGrid="False" />
                                <Label Angle="270" Alignment="Center">
                                    <ResolveOverlappingOptions AllowHide="False" />
                                </Label>
                            </AxisX>
                            <AxisY VisibleInPanesSerializable="-1">
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend Name="Default Legend"></Legend>
                    <SeriesSerializable>
                        <dx:Series Name="Total" LabelsVisibility="True" ArgumentDataMember="sdesc" ValueDataMembersSerializable="fActual">
                            <ViewSerializable>
                                <dx:SideBySideBarSeriesView>
                                    <Border Color="49, 133, 155" />
                                </dx:SideBySideBarSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                        <dx:Series LabelsVisibility="False" Name="Goal" ArgumentDataMember="sdesc" ValueDataMembersSerializable="fGoal">
                            <ViewSerializable>
                                <dx:LineSeriesView Color="IndianRed">
                                </dx:LineSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                </dx:WebChartControl>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=MX29W1009;Initial Catalog=DB_1033_Dashboard;Persist Security Info=True;User ID=OPEX_Users;Password=Gqb%Pjo7XZ" SelectCommand="SELECT sdesc, fActual, fGoal FROM sta_nivel2 WHERE smetric = 'defectos' and sFilter = 'SITE' and sclass = 'All' and stype = 'weekly'">
    </asp:SqlDataSource>
    <p />
    <hr />
    <p />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ds_defects" Theme="Default" Width="1024px">
        <SettingsPager Mode="ShowPager" PageSize="20">
        </SettingsPager>
        <Settings ShowGroupPanel="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <SettingsSearchPanel Visible="True" />
        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
        <Toolbars>
            <dx:GridViewToolbar>
                <SettingsAdaptivity Enabled="true" EnableCollapseRootItemsToIcons="true" />
                <Items>
                    <dx:GridViewToolbarItem Command="ExportToPdf" />
                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                    <dx:GridViewToolbarItem Command="ExportToDocx" />                    
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="0" Caption="ID">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="qn" VisibleIndex="1" Caption="QN">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="partNumber" VisibleIndex="2" Caption="NAME">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="program" VisibleIndex="3" Caption="PROGRAM">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="notificationdate" VisibleIndex="4" Caption="N.DATE">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="mrp" VisibleIndex="5" Caption="MRP">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Responsability" VisibleIndex="6" Caption="RESPONSABILITY">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="cell" VisibleIndex="7" Caption="CELL">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="vsm" VisibleIndex="8" Caption="VSM">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="week" VisibleIndex="9" Caption="WEEK">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="dYear" VisibleIndex="10" Caption="YEAR">
            </dx:GridViewDataTextColumn>
        </Columns>
        <GroupSummary>
            <dx:ASPxSummaryItem FieldName="vsm" ShowInColumn="VSM" SummaryType="Count" />
        </GroupSummary>
        <GroupSummary>
            <dx:ASPxSummaryItem FieldName="cell" ShowInColumn="CELL" SummaryType="Count" />
        </GroupSummary>
        <GroupSummary>
            <dx:ASPxSummaryItem FieldName="week" ShowInColumn="WEEK" SummaryType="Count" />
        </GroupSummary>
        <GroupSummary>
            <dx:ASPxSummaryItem FieldName="program" ShowInColumn="PROGRAM" SummaryType="Count" />
        </GroupSummary>
        <Styles>
            <Header BackColor="IndianRed" ForeColor="White">
            </Header>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="ds_defects" runat="server" ConnectionString="Data Source=MX29W1009;Initial Catalog=DB_1033_Dashboard;Persist Security Info=True;User ID=OPEX_Users;Password=Gqb%Pjo7XZ"
        SelectCommand="SELECT [id], [qn], [partNumber], [program], [notificationdate], [mrp], [Responsability], [cell], [vsm], [week], [dYear] FROM [sap_defects] where mrp like @pMrp and vsm like @pVsm order by id">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxComboBoxMrpInContent"
                Name="pMrp" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxComboBoxVsmInContent"
                Name="pVsm" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceMrp" runat="server" ConnectionString="Data Source=MX29W1009;Initial Catalog=DB_1033_Dashboard;Persist Security Info=True;User ID=OPEX_Users;Password=Gqb%Pjo7XZ"
        SelectCommand="SELECT distinct [mrp] FROM [sap_defects] order by mrp"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceVsm" runat="server" ConnectionString="Data Source=MX29W1009;Initial Catalog=DB_1033_Dashboard;Persist Security Info=True;User ID=OPEX_Users;Password=Gqb%Pjo7XZ"
        SelectCommand="SELECT distinct [vsm] FROM [sap_defects] order by vsm"></asp:SqlDataSource>
    <p />
    <hr />
    <p />
</asp:Content>