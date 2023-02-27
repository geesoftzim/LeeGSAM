<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="CounterTradingAcc.aspx.cs" Inherits="LastTrialGene.CounterTradingAcc" %>

<%@ Register Src="~/Controls/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <link rel="stylesheet" type="text/css" href='<%# ResolveUrl("~/Content/GridView.css") %>' />
    <script type="text/javascript" src='<%# ResolveUrl("~/Content/GridView.js") %>'></script>




    <script type="text/javascript"> 


        function CountriesCombo_SelectedIndexChanged(s, e) {
            console.log('physical city fired');

            gridView.GetEditor("City").PerformCallback(s.GetValue());
        }




    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="PageToolbar">
    <dx:ASPxMenu runat="server" ID="PageToolbar" ClientInstanceName="pageToolbar"
        ItemAutoWidth="false" ApplyItemStyleToTemplates="true" ItemWrap="false"
        AllowSelectItem="false" SeparatorWidth="0"
        Width="100%" CssClass="page-toolbar">
        <ClientSideEvents ItemClick="onPageToolbarItemClick" />
        <SettingsAdaptivity Enabled="true" EnableAutoHideRootItems="true"
            EnableCollapseRootItemsToIcons="true" CollapseRootItemsToIconsAtWindowInnerWidth="600" />
        <ItemStyle CssClass="item" VerticalAlign="Middle" />
        <ItemImage Width="16px" Height="16px" />
        <Items>
            <dx:MenuItem Enabled="false">
                <Template>
                    <h1>EMPLOYMENT  DETAILS</h1>
                </Template>
            </dx:MenuItem>
            <dx:MenuItem Name="New" Text="New" Alignment="Right" AdaptivePriority="2">
                <Image Url="Content/Images/add.svg" />
            </dx:MenuItem>
            <dx:MenuItem Name="Edit" Text="Edit" Alignment="Right" AdaptivePriority="2">
                <Image Url="Content/Images/edit.svg" />
            </dx:MenuItem>
            <dx:MenuItem Name="Delete" Text="Delete" Alignment="Right" AdaptivePriority="2">
                <Image Url="Content/Images/delete.svg" />
            </dx:MenuItem>
            <dx:MenuItem Name="Export" Text="Export" Alignment="Right" AdaptivePriority="2">
                <Image Url="Content/Images/export.svg" />
            </dx:MenuItem>
            <dx:MenuItem Name="ToggleFilterPanel" Text="" GroupName="Filter" Alignment="Right" AdaptivePriority="1">
                <Image Url="Content/Images/search.svg" UrlChecked="Content/Images/search-selected.svg" />
            </dx:MenuItem>
        </Items>
    </dx:ASPxMenu>
    <dx:ASPxPanel runat="server" ID="FilterPanel" ClientInstanceName="filterPanel"
        Collapsible="true" CssClass="filter-panel">
        <SettingsCollapsing ExpandEffect="Slide" AnimationType="Slide" ExpandButton-Visible="false" />
        <PanelCollection>
            <dx:PanelContent>
                <dx:ASPxButtonEdit runat="server" ID="SearchButtonEdit" ClientInstanceName="searchButtonEdit" ClearButton-DisplayMode="Always" Caption="Search" Width="100%" />
            </dx:PanelContent>
        </PanelCollection>
        <ClientSideEvents Expanded="onFilterPanelExpanded" Collapsed="adjustPageControls" />
    </dx:ASPxPanel>
</asp:Content>

<asp:Content style="max-width: 100% !important; padding-left: 0px !important" ID="Content" ContentPlaceHolderID="PageContent" runat="server">

    <dx:ASPxGridView runat="server" ID="GridView" ClientInstanceName="gridView"
        KeyFieldName="ID" EnablePagingGestures="False" SeparatorWidth="0"
        CssClass="grid-view" Width="100%"
        DataSourceID="GridViewDataSource"
        OnCustomCallback="GridView_CustomCallback"
        OnInitNewRow="GridView_InitNewRow" OnCellEditorInitialize="grid_CellEditorInitialize" OnRowValidating="grid_RowValidating" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="GridView_RowUpdated">
        <ClientSideEvents
            EndCallback="function(s, e) {
                        if (s.cpUpdatedMessage) {
                            alert(s.cpUpdatedMessage);
                            delete s.cpUpdatedMessage;
                        }
                      if (s.cpInsertNote) {
                            alert(s.cpInsertNote);
                            delete s.cpInsertNote;
                        }
                    }" />

        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="AllPages" VisibleIndex="0" Width="52"></dx:GridViewCommandColumn>


            <dx:GridViewDataComboBoxColumn VisibleIndex="1" FieldName="CustodialGroupName" Visible="false">
                <PropertiesComboBox ValueField="CustodialGroupName" TextField="Name" ValueType="System.Int64" DataSourceID="CustodialGroupSource">
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"></ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn VisibleIndex="1" FieldName="AccountTypeName" Visible="false">
                <PropertiesComboBox ValueField="AccountTypeName" TextField="Name" ValueType="System.Int64" DataSourceID="AccountTypeSource">
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"></ValidationSettings>
                            <ClientSideEvents ValueChanged="function(s, e) {  
                                         if(s.GetText()=='Call'){
                                gridView.GetMainElement().getElementsByClassName('Callfuns')[0].style.visibility ='visible';
                                 gridView.GetMainElement().getElementsByClassName('Callfuns2')[0].style.visibility ='visible';
                                 gridView.GetMainElement().getElementsByClassName('Callfuns3')[0].style.visibility ='visible';
                                 gridView.GetMainElement().getElementsByClassName('Callfuns4')[0].style.visibility ='visible';
                                 gridView.GetMainElement().getElementsByClassName('Callfuns5')[0].style.visibility ='visible';
                                 gridView.GetMainElement().getElementsByClassName('Callfuns6')[0].style.visibility ='visible';
                                 gridView.GetMainElement().getElementsByClassName('Callfuns7')[0].style.visibility ='visible';
                                 gridView.GetMainElement().getElementsByClassName('Callfuns8')[0].style.visibility ='visible';
                                 gridView.GetMainElement().getElementsByClassName('Callfuns9')[0].style.visibility ='visible';
                                 gridView.GetMainElement().getElementsByClassName('Callfuns10')[0].style.visibility ='visible';
		                                     }else{
                                gridView.GetMainElement().getElementsByClassName('Callfuns')[0].style.visibility ='hidden';
                                  gridView.GetMainElement().getElementsByClassName('Callfuns2')[0].style.visibility ='hidden';
                                  gridView.GetMainElement().getElementsByClassName('Callfuns3')[0].style.visibility ='hidden';
                                  gridView.GetMainElement().getElementsByClassName('Callfuns4')[0].style.visibility ='hidden';
                                  gridView.GetMainElement().getElementsByClassName('Callfuns5')[0].style.visibility ='hidden';
                                  gridView.GetMainElement().getElementsByClassName('Callfuns6')[0].style.visibility ='hidden';
                                  gridView.GetMainElement().getElementsByClassName('Callfuns7')[0].style.visibility ='hidden';
                                  gridView.GetMainElement().getElementsByClassName('Callfuns8')[0].style.visibility ='hidden';
                                  gridView.GetMainElement().getElementsByClassName('Callfuns9')[0].style.visibility ='hidden';
                                 gridView.GetMainElement().getElementsByClassName('Callfuns10')[0].style.visibility ='hidden';
                                
                                } 
     
        }" />
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>


            <dx:GridViewDataComboBoxColumn VisibleIndex="1" FieldName="periodType" Visible="false">
                <PropertiesComboBox ValueField="periodType" TextField="Name" ValueType="System.Int64" DataSourceID="PeriodTypeSource">
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"></ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn VisibleIndex="1" FieldName="InterestGroupName" Visible="false">
                <PropertiesComboBox ValueField="InterestGroupName" TextField="Name" ValueType="System.Int64" DataSourceID="InterestGroupSource">
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"></ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn VisibleIndex="1" FieldName="ManagementFeeType" Visible="false">
                <PropertiesComboBox ValueField="ManagementFeeType" TextField="Name" ValueType="System.Int64" DataSourceID="ManagementFeeTypeSource">
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"></ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn VisibleIndex="1" FieldName="CurrencyID" Visible="false">
                <PropertiesComboBox ValueField="CurrencyID" TextField="CurrCode" ValueType="System.Int64" DataSourceID="CurrencySource">
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"></ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>


            <dx:GridViewDataTextColumn FieldName="AccMinimumBal" Visible="true">
                                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RegularExpression ValidationExpression="^\d+(\.\d{1,5})?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InterestRate" Visible="true">
                                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RegularExpression ValidationExpression="^\d+(\.\d{1,5})?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ID" Visible="false" />
            <dx:GridViewDataTextColumn ReadOnly="true" FieldName="ClientNO" Visible="true" />
            <dx:GridViewDataTextColumn ReadOnly="true" FieldName="ClientName" Visible="true" />
            <dx:GridViewDataTextColumn FieldName="AccountNo">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RegularExpression ErrorText="This is not a valid phone number" ValidationExpression="^[0-9]*$" />

                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Narrative">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField ErrorText="Enter Narrative" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataCheckColumn FieldName="CustGroupNotAppl" Visible="false" />
            <dx:GridViewDataCheckColumn FieldName="Active" Visible="false" />
            <dx:GridViewDataCheckColumn FieldName="Blocked" Visible="false" />
            <dx:GridViewDataCheckColumn FieldName="GlobalInterestRate" Visible="false" />
            <dx:GridViewDataCheckColumn FieldName="GlobalMinBal" Visible="false" />
            <dx:GridViewDataCheckColumn FieldName="GlobalManageFeeRate" Visible="false" />
            <dx:GridViewDataCheckColumn FieldName="GlobalManageFeeValue" Visible="false" />


            <dx:GridViewDataTextColumn FieldName="CreditLimit" Visible="true">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RegularExpression ValidationExpression="^\d+(\.\d{1,5})?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="DebitLimit" Visible="true">
                                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RegularExpression ValidationExpression="^\d+(\.\d{1,5})?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ActualCredit" Visible="true">
                                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RegularExpression ValidationExpression="^\d+(\.\d{1,5})?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ActualDebit" Visible="true">
                                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RegularExpression ValidationExpression="^\d+(\.\d{1,5})?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ManagementFeeRate" Visible="true" />


            <dx:GridViewDataCheckColumn FieldName="SetManageFeeAsflatFee" Visible="false" />

            <dx:GridViewDataCheckColumn FieldName="calcManageFeeAsPercRate" Visible="false" />











            <%-- <dx:GridViewDataColumn FieldName="IsArchived" />--%>
        </Columns>
        <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true" AllowEllipsisInText="true" AllowDragDrop="false" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2" />
        <SettingsSearchPanel CustomEditorID="SearchButtonEdit" />
        <Settings VerticalScrollBarMode="Hidden" HorizontalScrollBarMode="Auto" ShowHeaderFilterButton="true" />
        <SettingsPager PageSize="15" EnableAdaptivity="true">
            <PageSizeItemSettings Visible="true"></PageSizeItemSettings>
        </SettingsPager>
        <SettingsExport EnableClientSideExportAPI="true" ExportSelectedRowsOnly="true" />
        <SettingsPopup>
            <EditForm>
                <SettingsAdaptivity MaxWidth="800" Mode="Always" VerticalAlign="WindowCenter" />
            </EditForm>
        </SettingsPopup>
        <EditFormLayoutProperties UseDefaultPaddings="false">
            <Styles LayoutItem-Paddings-PaddingBottom="8" />
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600">
            </SettingsAdaptivity>
            <Items>


                <dx:GridViewTabbedLayoutGroup>
                    <Items>
                        <dx:GridViewLayoutGroup Caption="Account Details" ColCount="2" GroupBoxDecoration="None">
                            <Items>

                                <dx:GridViewColumnLayoutItem ColumnName="ClientNO" Caption="Client Number" />
                            
                                  <dx:GridViewColumnLayoutItem ColumnName="ManagementFeeRate" Caption="Management Fee" />
                                <dx:GridViewColumnLayoutItem ColumnName="ClientName" Caption="Client Name" />
                             <dx:GridViewColumnLayoutItem CssClass="Callfuns" ColumnName="InterestRate" Caption="Interest Rate" />
                                 <dx:GridViewColumnLayoutItem ColumnName="AccountTypeName" Caption="Account Type" />
                                  <dx:GridViewColumnLayoutItem CssClass="Callfuns2" ColumnName="GlobalInterestRate" Caption="Use Global Rate" />
                               
                                   <dx:GridViewColumnLayoutItem ColumnName="CustodialGroupName" Caption="Custodial Group" />
                               <dx:GridViewColumnLayoutItem CssClass="Callfuns3" ColumnName="AccMinimumBal" Caption="Account Minimum Balance" />

                                <dx:GridViewColumnLayoutItem ColumnName="CustGroupNotAppl" Caption="Custodial Group N/A" />
                                 <dx:GridViewColumnLayoutItem CssClass="Callfuns4" ColumnName="GlobalMinBal" Caption="Use Global Min Bal" />
                                   <dx:GridViewColumnLayoutItem ColumnName="CurrencyID" Caption="Currency" />
                      <dx:GridViewColumnLayoutItem CssClass="Callfuns5" ColumnName="ManagementFeeType" Caption="Management Fee Type" />

                                <dx:GridViewColumnLayoutItem ColumnName="AccountNo" Caption="Account Number" />
                           <dx:GridViewColumnLayoutItem CssClass="Callfuns6" ColumnName="periodType" Caption="Management Fee  Period" />
                                <dx:GridViewColumnLayoutItem ColumnName="Narrative" Caption="Narrative" />
                                
                                <dx:GridViewColumnLayoutItem CssClass="Callfuns7" ColumnName="calcManageFeeAsPercRate" Caption="Cal Management Fee As % Rate" />
                                <dx:GridViewColumnLayoutItem ColumnName="Active" Caption="Active" />
                                <dx:GridViewColumnLayoutItem CssClass="Callfuns8" ColumnName="SetManageFeeAsflatFee" Caption="Set Management Fee As flat Fee" />
                                 <dx:GridViewColumnLayoutItem ColumnName="Blocked" Caption="Blocked" />
                                          <dx:GridViewColumnLayoutItem CssClass="Callfuns9" ColumnName="GlobalManageFeeRate" Caption="Use Global Manage Fee Rate" />
                                <dx:GridViewColumnLayoutItem ColumnName="InterestGroupName" Caption="Interest Group" />
              
                                      <dx:GridViewColumnLayoutItem CssClass="Callfuns10" ColumnName="GlobalManageFeeValue" Caption="Use Global Manage Fee Value" />
                         



                                









                            
                            </Items>
                        </dx:GridViewLayoutGroup>
                        <dx:GridViewLayoutGroup Caption="Limits" ColCount="2" GroupBoxDecoration="None">
                            <Items>
                                <dx:GridViewColumnLayoutItem ColumnName="CreditLimit" Caption="Credit Limit" />
                                <dx:GridViewColumnLayoutItem ColumnName="ActualDebit" Caption="Actual Debit Limit"/>
                                <dx:GridViewColumnLayoutItem ColumnName="DebitLimit" Caption="Debit Limit" />
                                <dx:GridViewColumnLayoutItem ColumnName="ActualCredit" Caption="Actual Credit Limit"/>
                       <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />
                            </Items>
                        </dx:GridViewLayoutGroup>
                    </Items>
                </dx:GridViewTabbedLayoutGroup>



            </Items>
        </EditFormLayoutProperties>
        <Styles>
            <Cell Wrap="false" />
            <PagerBottomPanel CssClass="pager" />
            <FocusedRow CssClass="focused" />
        </Styles>
        <ClientSideEvents Init="onGridViewInit" SelectionChanged="onGridViewSelectionChanged" />
    </dx:ASPxGridView>

    <asp:ObjectDataSource ID="GridViewDataSource" runat="server" DataObjectTypeName=" LastTrialGene.TradingAccountsContext.AccountList"
        TypeName=" LastTrialGene.TradingAccountsContext.TradingAccountsContext"
        SelectMethod="GetAccounts" InsertMethod="AddNewEmployerDetails" UpdateMethod="UpdateEmployerDetails"></asp:ObjectDataSource>


    <asp:ObjectDataSource ID="AccountTypeSource" runat="server" DataObjectTypeName="LastTrialGene.TradingAccountsContext.AccountType"
        TypeName="LastTrialGene.TradingAccountsContext.TradingAccountsContext"
        SelectMethod="GetAccountType"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="CustodialGroupSource" runat="server" DataObjectTypeName="LastTrialGene.TradingAccountsContext.CustodialGroup"
        TypeName="LastTrialGene.TradingAccountsContext.TradingAccountsContext"
        SelectMethod="GetCustodialGroup"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="ManagementFeeTypeSource" runat="server" DataObjectTypeName="LastTrialGene.TradingAccountsContext.managementFeeType"
        TypeName="LastTrialGene.TradingAccountsContext.TradingAccountsContext"
        SelectMethod="GetManagementFeeType"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="PeriodTypeSource" runat="server" DataObjectTypeName="LastTrialGene.TradingAccountsContext.PeriodType"
        TypeName="LastTrialGene.TradingAccountsContext.TradingAccountsContext"
        SelectMethod="GetPeriodType"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="InterestGroupSource" runat="server" DataObjectTypeName="LastTrialGene.TradingAccountsContext.InterestGroup"
        TypeName="LastTrialGene.TradingAccountsContext.TradingAccountsContext"
        SelectMethod="GetInterestGroup"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="CurrencySource" runat="server" DataObjectTypeName="LastTrialGene.TradingAccountsContext.Currency"
        TypeName="LastTrialGene.TradingAccountsContext.TradingAccountsContext"
        SelectMethod="GetCurrency"></asp:ObjectDataSource>



</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="LeftPanelContent">
    <uc1:SideBar runat="server" Visible="true" ID="SideBar" />
</asp:Content>







<asp:Content runat="server" ContentPlaceHolderID="RightPanelContent">
    <div class="settings-content">
        <h2>Settings</h2>
        <p>Place your content here</p>
    </div>
</asp:Content>
