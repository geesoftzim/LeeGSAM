<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="CounterPartyContacts.aspx.cs" Inherits="LastTrialGene.CounterPartyContacts" %>

<%@ Register Src="~/Controls/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <link rel="stylesheet" type="text/css" href='<%# ResolveUrl("~/Content/GridView.css") %>' />
    <script type="text/javascript" src='<%# ResolveUrl("~/Content/GridView.js") %>'></script>
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
                    <h1>CONTACTS DETAILS</h1>
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
    <asp:ScriptManager runat="server" ID="ClientsCreation1" EnablePageMethods="true" />
    <%--<dx:ASPxGridView ID="grid" runat="server" DataSourceID="GridViewDataSource" CssClass="grid-view"
        KeyFieldName="ID" AutoGenerateColumns="False" OnRowUpdating="grid_RowUpdating"
        Width="100%" OnRowInserting="grid_RowInserting">--%>
    <dx:ASPxGridView runat="server" ID="GridView" ClientInstanceName="gridView"
        KeyFieldName="ID" EnablePagingGestures="False" SeparatorWidth="0"
        CssClass="grid-view" Width="100%"
        DataSourceID="GridViewDataSource"
        OnCustomCallback="GridView_CustomCallback"
        OnInitNewRow="GridView_InitNewRow"
        PreviewFieldName="Name" OnRowInserted="ASPxGridView1_RowInserted" onrowupdated="GridView_RowUpdated" OnRowValidating="grid_RowValidating" OnEditFormLayoutCreated="grid_EditFormLayoutCreated" OnCellEditorInitialize="grid_CellEditorInitialize">
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


            <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="SalutationType" Visible="false">
                <PropertiesComboBox ValueField="SalutationType" TextField="Name" DataSourceID="ObjectDataSalutationType">
                     <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Salutation Type" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>


            <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="IdentificationType" Visible="false">
                <PropertiesComboBox ValueField="IdentificationType" TextField="Name" DataSourceID="IdentificationtypeSource">
                     <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Identification Type" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="SexID" Visible="false">
              <PropertiesComboBox ValueField="SexID" TextField="Name" DataSourceID="SexSource">
                </PropertiesComboBox>
                 
              
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="Nationality" Visible="false">
                <PropertiesComboBox ValueField="Nationality" TextField="Name" DataSourceID="NationalitySource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Nationality" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="Citizenship" Visible="false">
                <PropertiesComboBox ValueField="Citizenship" TextField="Name" DataSourceID="NationalitySource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Citizenship" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="Citizenship2" Visible="false">
                <PropertiesComboBox ValueField="Citizenship2" TextField="Name" DataSourceID="NationalitySource">
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

             <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="PhysicalCountry" Visible="false">
                <PropertiesComboBox ValueField="PhysicalCountry" TextField="Name" DataSourceID="DataSourceCountry">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Physical Country" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

             <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="PostalCountry" Visible="false">
                <PropertiesComboBox ValueField="PostalCountry" TextField="Name" DataSourceID="DataSourceCountry">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Postal Country" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>


             <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="PhysicalCity" Visible="false">
                <PropertiesComboBox ValueField="PhysicalCity" TextField="Name" DataSourceID="DataSourceCity">
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

             <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="PostalCity" Visible="false">
                <PropertiesComboBox ValueField="PostalCity" TextField="Name" DataSourceID="DataSourceCity">
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>




      




            <dx:GridViewDataColumn Visible="false" FieldName="ID" />
            <dx:GridViewDataColumn Visible="false" FieldName="CounterpartyID" />
            <dx:GridViewDataColumn Visible="false" FieldName="MMCounterpartyID" />

            <dx:GridViewDataColumn FieldName="Name" Width="25%" />
            <dx:GridViewDataColumn FieldName="IdentificationNo" Width="25%" />

              <dx:GridViewDataCheckColumn FieldName="HasUSGreenCard" Width="25%" />
               <dx:GridViewDataCheckColumn FieldName="IsUSResident" Width="25%" Visible="false" />
       

            <dx:GridViewDataMemoColumn FieldName="PostalAddress" Width="20%" />
            <dx:GridViewDataColumn FieldName="PhoneNo" Width="20%" />
             <dx:GridViewDataColumn FieldName="PhoneNo2" Width="20%" Visible="false"/>


          
            <dx:GridViewDataColumn FieldName="OwnershipPercent" Width="25%" />
            <dx:GridViewDataMemoColumn FieldName="PhysicalAddress" Width="25%" />
            <dx:GridViewDataMemoColumn FieldName="PhysicalAddress2" Width="25%" Visible="false" />
            <dx:GridViewDataMemoColumn FieldName="PostalAddress" Width="20%" />
            <dx:GridViewDataMemoColumn FieldName="PostalAddress2" Width="20%" Visible="false"/>
            <dx:GridViewDataColumn FieldName="PhoneNo" Width="20%" />

                 <dx:GridViewDataDateColumn FieldName="CreationDate" >  
              <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy">
                                      <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Date Of Birth" />  
                    </ValidationSettings>
              </PropertiesDateEdit>  
               </dx:GridViewDataDateColumn>



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
                <dx:GridViewTabbedLayoutGroup>
                    <Items>
                        <dx:GridViewLayoutGroup Caption="Basic Details" ColCount="2" GroupBoxDecoration="None">
                            <Items>
                                <dx:GridViewColumnLayoutItem ColumnName="SalutationType" Caption="Title"/>
                                <dx:GridViewColumnLayoutItem ColumnName="Nationality" Caption="Nationality" />
                                <dx:GridViewColumnLayoutItem ColumnName="SexID" Caption="Sex" />
                                <dx:GridViewColumnLayoutItem ColumnName="Citizenship" Caption="Citizenship" />
                                <dx:GridViewColumnLayoutItem ColumnName="Name" Caption="First Name" />

                                <dx:GridViewColumnLayoutItem ColumnName="Citizenship2" Caption="Citizenship 2" />
                                <dx:GridViewColumnLayoutItem ColumnName="IdentificationType" Caption="ID Type" />



                                <dx:GridViewColumnLayoutItem ColumnName="OwnershipPercent" Caption="Ownership Percent" />
                                <dx:GridViewColumnLayoutItem ColumnName="IdentificationNo" Caption="ID Number" />

                                <dx:GridViewColumnLayoutItem ColumnName="HasUSGreenCard" Caption="HasUSGreenCard" />
                                  <dx:GridViewColumnLayoutItem ColumnName="CreationDate" Caption="Date Of Birth" />
                                <dx:GridViewColumnLayoutItem ColumnName="IsUSResident" Caption="IsUSResident" />
                                
                                

                                







                                <%--   <dx:GridViewColumnLayoutItem ColumnName="IsArchived" CaptionSettings-AllowWrapCaption="False" />
                        <dx:GridViewColumnLayoutItem ColumnName="Kind"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Priority" />
                        <dx:GridViewColumnLayoutItem ColumnName="Status" />--%>
                                <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />
                            </Items>
                        </dx:GridViewLayoutGroup>

                        <dx:GridViewLayoutGroup Caption="Contact Details" ColCount="2" GroupBoxDecoration="None">
                            <Items>

                                <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress" />
                                 <dx:GridViewColumnLayoutItem ColumnName="PhysicalCountry" Caption="Physical Country" />
                                <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress2" />
                                 <dx:GridViewColumnLayoutItem ColumnName="PhysicalCity" Caption="Physical City" />
                                <dx:GridViewColumnLayoutItem ColumnName="PostalAddress" Caption="PostalAddress" />
                                <dx:GridViewColumnLayoutItem ColumnName="PostalCountry" Caption="Postal Country" />                                
                                <dx:GridViewColumnLayoutItem ColumnName="PostalAddress2" Caption="PostalAddress" />
                                <dx:GridViewColumnLayoutItem ColumnName="PostalCity" Caption="Postal City" />
                                <dx:GridViewColumnLayoutItem ColumnName="PhoneNo" Caption="PhoneNo" />

                                <dx:GridViewColumnLayoutItem ColumnName="PhoneNo2" Caption="PhoneNo 2" />

                               
                                

                               
                                




                                <%--   <dx:GridViewColumnLayoutItem ColumnName="IsArchived" CaptionSettings-AllowWrapCaption="False" />
                        <dx:GridViewColumnLayoutItem ColumnName="Kind"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Priority" />
                        <dx:GridViewColumnLayoutItem ColumnName="Status" />--%>
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
        <ClientSideEvents SelectionChanged="function(s, e) { SelChanged(s, e); }" />

    </dx:ASPxGridView>

    <asp:ObjectDataSource ID="GridViewDataSource" runat="server" DataObjectTypeName="LastTrialGene.ContactsContext.ContactList"
        TypeName="LastTrialGene.ContactsContext.ContactsContext"
        SelectMethod="GetContacts" InsertMethod="NewContacts" UpdateMethod="UpdateContacts"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="SexSource" runat="server" DataObjectTypeName="LastTrialGene.ContactsContext.Sex"
        TypeName="LastTrialGene.ContactsContext.ContactsContext"
        SelectMethod="GetSex1"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="IdentificationtypeSource" runat="server" DataObjectTypeName="LastTrialGene.ContactsContext.IdentificationType"
        TypeName="LastTrialGene.ContactsContext.ContactsContext"
        SelectMethod="GetIdentification"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="NationalitySource" runat="server" DataObjectTypeName="LastTrialGene.ContactsContext.Nationality"
        TypeName="LastTrialGene.ContactsContext.ContactsContext"
        SelectMethod="GetNationality"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="ObjectDataSalutationType" runat="server" DataObjectTypeName="LastTrialGene.ContactsContext.SalutationType"
        TypeName="LastTrialGene.ContactsContext.ContactsContext"
        SelectMethod="GetTitle"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="DataSourceCountry" runat="server" DataObjectTypeName="LastTrialGene.ContactsContext.Country"
        TypeName="LastTrialGene.ContactsContext.ContactsContext"
        SelectMethod="GetCountry"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="DataSourceCity" runat="server" DataObjectTypeName="LastTrialGene.ContactsContext.City"
        TypeName="LastTrialGene.ContactsContext.ContactsContext"
        SelectMethod="GetCity"></asp:ObjectDataSource>




    <%--<asp:ObjectDataSource ID="GridViewDataSource" runat="server" DataObjectTypeName="LastTrialGene.Models.ClientDetailsDataUpdate1"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetClients" UpdateMethod="UpdateClients" InsertMethod="NewClients">


    </asp:ObjectDataSource>--%>



    <asp:ObjectDataSource runat="server" ID="ObjectDataSourceCompanyEmployees" DataObjectTypeName="LastTrialGene.Models.ClientDetailsDataUpdate1" TypeName="LastTrialGene.Code.ClientsContext"
        InsertMethod="NewClients"
        SelectMethod="GetClients"
        UpdateMethod="UpdateClients"></asp:ObjectDataSource>

    <%-- UpdateMethod="UpdateClients"<asp:ObjectDataSource ID="CustodialGroup" runat="server" DataObjectTypeName=" LastTrialGene.Model.CustodialgroupMapper"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="getmapper"></asp:ObjectDataSource>--%>

    <asp:ObjectDataSource ID="RiskRating" runat="server" DataObjectTypeName=" LastTrialGene.Model.RiskRating"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetRiskRating"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="SectorSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sector"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetSector"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="ClientGroupSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.ClientGroup"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetClientGroup"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="SourceOfIncomeSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.SourceOfIncome"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetSourceOfIncome"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="BranchSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Branch"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetBranch"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="titleSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Salutationtype"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetTitle"></asp:ObjectDataSource>









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
    <uc1:SideBar runat="server" Visible="true" ID="SideBar" />
</asp:Content>







<asp:Content runat="server" ContentPlaceHolderID="RightPanelContent">
    <div class="settings-content">
        <h2>Settings</h2>
        <p>Place your content here</p>
    </div>
</asp:Content>
