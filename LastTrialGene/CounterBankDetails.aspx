<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="CounterBankDetails.aspx.cs" Inherits="LastTrialGene.CounterBankDetails" %>
<%@ Register Src="~/Controls/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <link rel="stylesheet" type="text/css" href='<%# ResolveUrl("~/Content/GridView.css") %>' />
    <script type="text/javascript" src='<%# ResolveUrl("~/Content/GridView.js") %>'></script>
</asp:Content>

<asp:Content  runat="server" ContentPlaceHolderID="PageToolbar">
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
                    <h1>BANKS DETAILS</h1>
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

<asp:Content style="max-width:100% !important;padding-left:0px !important" ID="Content" ContentPlaceHolderID="PageContent" runat="server">

    <dx:ASPxGridView runat="server" ID="GridView" ClientInstanceName="gridView"
        KeyFieldName="ID" EnablePagingGestures="False" SeparatorWidth="0"
        CssClass="grid-view" Width="100%"
        DataSourceID="GridViewDataSource"
        OnCustomCallback="GridView_CustomCallback"
        OnInitNewRow="GridView_InitNewRow" OnRowInserted="ASPxGridView1_RowInserted" onrowupdated="GridView_RowUpdated" OnCellEditorInitialize="grid_CellEditorInitialize"  OnRowValidating="grid_RowValidating" >
                   <clientsideevents
        EndCallback="function(s, e) {
                        if (s.cpUpdatedMessage) {
                            alert(s.cpUpdatedMessage);
                            delete s.cpUpdatedMessage;
                        }
                      if (s.cpInsertNote) {
                            alert(s.cpInsertNote);
                            delete s.cpInsertNote;
                        }
                    }"
    />
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="AllPages" VisibleIndex="0" Width="52"></dx:GridViewCommandColumn>


           <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="AccountType" Visible="false">
                <PropertiesComboBox  ValueField="AccountType" TextField="AccountTypeName"  DataSourceID="BankAccountType">   
                     <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Account Type" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />  
            </dx:GridViewDataComboBoxColumn>
            

           <%--<dx:GridViewDataComboBoxColumn  VisibleIndex="1" FieldName="BankName" Visible="false">
                <PropertiesComboBox  ValueField="BankID" TextField="BankName" ValueType="System.Int64"  DataSourceID="BanksDataProvider">
                                    
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"></ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />  
            </dx:GridViewDataComboBoxColumn>--%>

             <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="BankID" Visible="false">
                <PropertiesComboBox  ValueField="BankID" TextField="BankName"   DataSourceID="BranchDataSource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Bank" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />  
            </dx:GridViewDataComboBoxColumn>

           
       

            <dx:GridViewDataColumn Visible="false" FieldName="ID" />
            <dx:GridViewDataColumn Visible="false" FieldName="ClientID"/>
            <dx:GridViewDataColumn FieldName="AccountName" Width="25%"/>
            <dx:GridViewDataColumn FieldName="AccountNo" Width="25%"/>
            <dx:GridViewDataColumn FieldName="AccountTypeName" Width="20%"/>
            <dx:GridViewDataColumn FieldName="BankName" Width="20%"/>
            <dx:GridViewDataColumn ReadOnly="true" FieldName="BranchName" Width="20%"/>

       <%-- <dx:GridViewDataColumn  FieldName="EmailAddress"/>
        

    
            <dx:GridViewDataColumn FieldName="EmailAddress2" />
            <dx:GridViewDataColumn FieldName="PhoneNo" />
             <dx:GridViewDataColumn FieldName="PhoneNo2" />--%>
         
             
       
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
                <dx:GridViewLayoutGroup ColCount="2" GroupBoxDecoration="None">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="AccountName" />
                        <dx:GridViewColumnLayoutItem ColumnName="AccountNo"  />

                       <dx:GridViewColumnLayoutItem ColumnName="AccountType" Caption="AccountType" />
                       <%-- <dx:GridViewColumnLayoutItem ColumnName="BankName" Caption="Bank" />--%>
                      <dx:GridViewColumnLayoutItem ColumnName="BankID" Caption="Bank" />

                        <dx:GridViewColumnLayoutItem  ColumnName="BranchName" Caption="BranchName" />
            

                       
                     <%--   <dx:GridViewColumnLayoutItem ColumnName="IsArchived" CaptionSettings-AllowWrapCaption="False" />
                        <dx:GridViewColumnLayoutItem ColumnName="Kind"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Priority" />
                        <dx:GridViewColumnLayoutItem ColumnName="Status" />--%>
                        <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />
                    </Items>
                </dx:GridViewLayoutGroup>
            </Items>
        </EditFormLayoutProperties>
        <Styles>
            <Cell Wrap="false" />
            <PagerBottomPanel CssClass="pager" />
            <FocusedRow CssClass="focused" />
        </Styles>
        <ClientSideEvents Init="onGridViewInit" SelectionChanged="onGridViewSelectionChanged" />
         <ClientSideEvents SelectionChanged="function(s, e) { SelChanged(s, e); }" />
     
    </dx:ASPxGridView>

    <asp:ObjectDataSource ID="GridViewDataSource" runat="server" DataObjectTypeName="LastTrialGene.Models.BankDetailsData2"
        TypeName=" LastTrialGene.Code.BanksDataProvider"
        SelectMethod="GetCounterBank" InsertMethod="AddNewCounterBank" UpdateMethod="UpdateCounterBank" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>

   <asp:ObjectDataSource ID="BankAccountType" runat="server" DataObjectTypeName=" LastTrialGene.Model.BankAccountType"
        TypeName=" LastTrialGene.Code.BanksDataProvider"
        SelectMethod="GetBankAccountType"></asp:ObjectDataSource>

      <asp:ObjectDataSource ID="BanksDataProvider" runat="server" DataObjectTypeName=" LastTrialGene.Model.Bank"
        TypeName=" LastTrialGene.Code.BanksDataProvider"
        SelectMethod="GetBanks"></asp:ObjectDataSource>

          <asp:ObjectDataSource ID="BranchDataSource" runat="server" DataObjectTypeName=" LastTrialGene.Models.Branch"
        TypeName=" LastTrialGene.Code.BanksDataProvider"
        SelectMethod="GetBranch"></asp:ObjectDataSource>

</asp:Content>

<%--<asp:Content runat="server" ContentPlaceHolderID="LeftPanelContent">
    <h3 class="leftpanel-section section-caption">Filters</h3>
    <dx:ASPxNavBar runat="server" ID="FiltersNavBar" ClientInstanceName="filtersNavBar"
        AllowSelectItem="true" ShowGroupHeaders="false"
        Width="100%" CssClass="filters-navbar">
        <ItemStyle CssClass="item" />
        <Groups>
            <dx:NavBarGroup>
                <Items>
                    <dx:NavBarItem Text="All" Selected="true" Name="All" />
                 
                    <dx:NavBarItem Text="Active issues" Name="Active" />
                    <dx:NavBarItem Text="Bugs" Name="Bugs" />
                    <dx:NavBarItem Text="Suggestions" Name="Suggestions" />

                    <dx:NavBarItem Text="High priority" Name="HighPriority" />
                </Items>
            </dx:NavBarGroup>
         
        </Groups>
        <ClientSideEvents ItemClick="onFiltersNavBarItemClick" />
           
    </dx:ASPxNavBar>
</asp:Content>--%>
<asp:Content runat="server" ContentPlaceHolderID="LeftPanelContent">
<uc1:SideBar runat="server" Visible="true" id="SideBar" />
    </asp:Content>







<asp:Content runat="server" ContentPlaceHolderID="RightPanelContent">
    <div class="settings-content">
        <h2>Settings</h2>
        <p>Place your content here</p>
    </div>
</asp:Content>
