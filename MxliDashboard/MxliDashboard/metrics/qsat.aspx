﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qsat.aspx.cs" Inherits="MxliDashboard.n3_Quality.qsat" %>

<%@ Register Assembly="DevExpress.XtraCharts.v20.1.Web, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>
<%@ Register Assembly="DevExpress.XtraCharts.v20.1.Web, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p></p>
    <h3>QSAT.</h3>
    <p></p>
        <asp:Label ID="Label1" runat="server" Text="labelUpdate"></asp:Label>
    <p></p>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" HeaderText="Views" ForeColor="Black" AllowCollapsingByHeaderClick="True">
        <HeaderStyle ForeColor="White" />
        <HeaderContent BackColor="#666666">
        </HeaderContent>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
                <table style="table-layout: fixed">
                    <tr>
                        <th>
                            <dx:ASPxLabel ID="ASPxLabelV" runat="server" Text="Select Metric View:" Font-Names="Honeywell Sans Web" Font-Size="Medium">
                            </dx:ASPxLabel>
                            <dx:ASPxComboBox ID="ASPxComboBoxV" runat="server" ValueType="System.String" AutoPostBack="True"
                                OnSelectedIndexChanged="ASPxComboBoxV_SelectedIndexChanged" Theme="Office365">
                                <Items>
                                    <dx:ListEditItem Selected="True" Text="Default" Value="0" />
                                    <dx:ListEditItem Text="Monthly" Value="1" />
                                    <dx:ListEditItem Text="Quarterly" Value="2" />
                                    <dx:ListEditItem Text="Yearly" Value="3" />
                                </Items>
                                <ClientSideEvents Validation="function(s, e) {
                                                    if (s.GetSelectedIndex()==0) {
                                                    e.isValid = false;
                                                    e.errorText = &quot;You should Select One View&quot;;
                                                    }}" />
                                <ValidationSettings ValidateOnLeave="False">
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </th>
                        <th>
                            <dx:ASPxLabel ID="ASPxLabelGV" runat="server" Text="Select Chart view:" Font-Names="Honeywell Sans Web" Font-Size="Medium">
                            </dx:ASPxLabel>
                            <dx:ASPxComboBox ID="ASPxComboBoxGV" runat="server" ValueType="System.String" AutoPostBack="True"
                                OnSelectedIndexChanged="ASPxComboBoxGV_SelectedIndexChanged" Theme="Office365">
                                <Items>
                                    <dx:ListEditItem Selected="True" Text="Default" Value="0" />
                                    <dx:ListEditItem Text="Trend" Value="1" />
                                    <dx:ListEditItem Text="Pareto" Value="2" />
                                    <dx:ListEditItem Text="Forecast" Value="3" />
                                </Items>
                                <ClientSideEvents Validation="function(s, e) {
                                            if (s.GetSelectedIndex()==0) {
                                            e.isValid = false;
                                            e.errorText = &quot;You should Select One Graph View&quot;;
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
    <p></p>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Width="100%" HeaderText="Filters" ForeColor="Black" AllowCollapsingByHeaderClick="True" >
        <HeaderStyle ForeColor="White" />
        <HeaderContent BackColor="#666666">
        </HeaderContent>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent2" runat="server">
                <table style="table-layout: fixed">
                    <tr>                       
                        <th>
                            <dx:ASPxLabel ID="ASPxLabelCaption1" runat="server" Text="Select Category" Font-Names="Honeywell Sans Web" Font-Size="Medium">
                            </dx:ASPxLabel>
                            <dx:ASPxComboBox ID="ASPxComboBoxCatInContent" runat="server" ValueField="categoryName"
                                TextField="categoryName" ValueType="System.String" DataSourceID="SqlDataSourceCat"
                                AutoPostBack="True" OnDataBound="cmbox_DataBoundCat" 
                                OnSelectedIndexChanged="ASPxComboBoxCatInContent_SelectedIndexChanged" Theme="Office365">
                                <ClientSideEvents Validation="function(s, e) {
                                            if (s.GetSelectedIndex()==0) {
                                            e.isValid = false;
                                            e.errorText = &quot;You should Select One Category&quot;;
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
    <p></p>
    <hr />
    <p></p>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" Width="100%" HeaderText="Data chart" ForeColor="Black" AllowCollapsingByHeaderClick="True">
        <HeaderStyle ForeColor="White" />
        <HeaderContent BackColor="#666666">
        </HeaderContent>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent3" runat="server">
                <dx:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="" CrosshairEnabled="True" Height="200px" Width="1100px"
                    ClientInstanceName="chart" AutoLayout="True">
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX VisibleInPanesSerializable="-1" MinorCount="1" Visibility="True">
                                <QualitativeScaleOptions AutoGrid="False" />
                                <Tickmarks MinorVisible="False" />
                                <Label Angle="270" Alignment="Center">
                                    <ResolveOverlappingOptions AllowHide="False" />
                                </Label>
                                <NumericScaleOptions AutoGrid="False" ScaleMode="Automatic" />
                            </AxisX>
                            <AxisY VisibleInPanesSerializable="-1">
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend Name="Default Legend" Font="Honeywell Sans Web Medium, 8pt"></Legend>
                    <SeriesSerializable>
                        <dx:Series Name="Total" LabelsVisibility="True" >
                            <ViewSerializable>
                                <dx:SideBySideBarSeriesView BarWidth="0.8" Color="0, 102, 153">
                                    <Border Color="79, 129, 189" Visibility="False" />
                                    <FillStyle FillMode="Solid">
                                    </FillStyle>
                                </dx:SideBySideBarSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                        <dx:Series LabelsVisibility="True" Name="Goal" >
                            <ViewSerializable>
                                <dx:LineSeriesView Color="192, 80, 77">
                                </dx:LineSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                </dx:WebChartControl>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <p></p>
    <hr />
    <p></p>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" Width="100%" HeaderText="Source data" ForeColor="Black" AllowCollapsingByHeaderClick="True">
        <HeaderStyle ForeColor="White" />
        <HeaderContent BackColor="#666666">
        </HeaderContent>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent4" runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ds_pros" Theme="Default" Width="1024px">
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
                        <dx:GridViewDataTextColumn FieldName="categoryName" VisibleIndex="1" Caption="CATEGORY">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="questionCount" VisibleIndex="2" Caption="QUESTIONS">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="answerCount" VisibleIndex="3" Caption="ANSWERED">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="naCount" VisibleIndex="4" Caption="NOT_ANSWERED">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="score" VisibleIndex="5" Caption="SCORE">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="maxScore" VisibleIndex="6" Caption="MAX_SCORE">
                        </dx:GridViewDataTextColumn>                        
                        <dx:GridViewDataTextColumn FieldName="satScore" VisibleIndex="7" Caption="SAT%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="compScore" VisibleIndex="8" Caption="COMPLETE%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="sMonth" VisibleIndex="9" Caption="MONTH">
                        </dx:GridViewDataTextColumn>                       
                        <dx:GridViewDataTextColumn FieldName="sQuarter" VisibleIndex="10" Caption="QUARTER">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="nYear" VisibleIndex="11" Caption="YEAR">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <GroupSummary>
                        <dx:ASPxSummaryItem FieldName="id" ShowInColumn="categoryName" SummaryType="Count" />
                    </GroupSummary>
                    <Styles>
                        <Header BackColor="IndianRed" ForeColor="White">
                        </Header>
                    </Styles>
                </dx:ASPxGridView>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <asp:SqlDataSource ID="ds_pros" runat="server" ConnectionString="Data Source=MX29W1009;Initial Catalog=DB_1033_Dashboard;Persist Security Info=True;User ID=OPEX_Users;Password=Gqb%Pjo7XZ"
        SelectCommand="SELECT * FROM [tbl_qsat] where categoryName like @pCat order by id">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxRoundPanel2$ASPxComboBoxCatInContent"
                Name="pCat" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCat" runat="server" ConnectionString="Data Source=MX29W1009;Initial Catalog=DB_1033_Dashboard;Persist Security Info=True;User ID=OPEX_Users;Password=Gqb%Pjo7XZ"
        SelectCommand="SELECT distinct [categoryName] FROM [tbl_qsat] order by categoryName"></asp:SqlDataSource>
    <p />
    <hr />
    <p />
    <dx:ASPxRoundPanel ID="ASPxRoundPanel5" runat="server" Width="100%" HeaderText="Actions" ForeColor="Black" AllowCollapsingByHeaderClick="True">
        <HeaderStyle ForeColor="White" />
        <HeaderContent BackColor="#666666">
        </HeaderContent>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent5" runat="server">
                <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceActions" KeyFieldName="tbl_actions_id" Width="100%" Theme="Metropolis">
                    <SettingsPager Visible="False">
                    </SettingsPager>
                    <Settings ShowGroupPanel="True" />
                    <SettingsDataSecurity AllowDelete="False" />
                    <Columns>
                        <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="#" FieldName="tbl_actions_id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="area" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vsm" ShowInCustomizationForm="True" VisibleIndex="3" Caption="VSM" Width="7%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="mrp" ShowInCustomizationForm="True" VisibleIndex="4" Caption="MRP" Width="7%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="report" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="material" ShowInCustomizationForm="True" VisibleIndex="6" Width="7%" Caption="Material">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="issue" ShowInCustomizationForm="True" VisibleIndex="7" Width="25%" Caption="Issue">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="action" ShowInCustomizationForm="True" VisibleIndex="8" Width="25%" Caption="Action">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="responsible" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Responsible" Width="7%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="creation_date" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Created on" Width="7%">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="creation_user" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Created by" Width="7%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="due_date" ShowInCustomizationForm="True" VisibleIndex="13" Caption="Due date" Width="7%">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Status" FieldName="open_close" ShowInCustomizationForm="True" VisibleIndex="10" Width="7%" Visible="False">
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>
                    <Styles>
                        <Header BackColor="#006699" ForeColor="White">
                        </Header>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSourceActions" runat="server" ConnectionString="<%$ ConnectionStrings:DB_1033_DashboardConnectionString %>" SelectCommand="SELECT [tbl_actions_id], [area], [vsm], [mrp], [report], [material], [issue], [action], [responsible], [open_close], [creation_date], [creation_user], [due_date] FROM [tbl_actions] WHERE ([report] = @report)" DeleteCommand="DELETE FROM [tbl_actions] WHERE [tbl_actions_id] = @tbl_actions_id" InsertCommand="INSERT INTO [tbl_actions] ([area], [vsm], [mrp], [report], [material], [issue], [action], [responsible], [open_close], [creation_date], [creation_user], [due_date]) VALUES (@area, @vsm, @mrp, @report, @material, @issue, @action, @responsible, @open_close, @creation_date, @creation_user, @due_date)" UpdateCommand="UPDATE [tbl_actions] SET [area] = @area, [vsm] = @vsm, [mrp] = @mrp, [report] = @report, [material] = @material, [issue] = @issue, [action] = @action, [responsible] = @responsible, [open_close] = @open_close, [creation_date] = @creation_date, [creation_user] = @creation_user, [due_date] = @due_date WHERE [tbl_actions_id] = @tbl_actions_id">
                    <DeleteParameters>
                        <asp:Parameter Name="tbl_actions_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="area" Type="String" DefaultValue="QUALITY" />
                        <asp:Parameter Name="vsm" Type="String" />
                        <asp:Parameter Name="mrp" Type="String" />
                        <asp:Parameter Name="report" Type="String" DefaultValue="QSAT" />
                        <asp:Parameter Name="material" Type="String" />
                        <asp:Parameter Name="issue" Type="String" />
                        <asp:Parameter Name="action" Type="String" />
                        <asp:Parameter Name="responsible" Type="String" />
                        <asp:Parameter Name="open_close" Type="String" DefaultValue="OPEN" />
                        <asp:Parameter Name="creation_date" Type="DateTime" />
                        <asp:Parameter Name="creation_user" Type="String" />
                        <asp:Parameter Name="due_date" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="qsat" Name="report" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="area" Type="String" />
                        <asp:Parameter Name="vsm" Type="String" />
                        <asp:Parameter Name="mrp" Type="String" />
                        <asp:Parameter Name="report" Type="String" />
                        <asp:Parameter Name="material" Type="String" />
                        <asp:Parameter Name="issue" Type="String" />
                        <asp:Parameter Name="action" Type="String" />
                        <asp:Parameter Name="responsible" Type="String" />
                        <asp:Parameter Name="open_close" Type="String" />
                        <asp:Parameter Name="creation_date" Type="DateTime" />
                        <asp:Parameter Name="creation_user" Type="String" />
                        <asp:Parameter Name="due_date" Type="DateTime" />
                        <asp:Parameter Name="tbl_actions_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
