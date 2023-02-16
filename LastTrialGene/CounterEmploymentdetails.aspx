<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="CounterEmploymentdetails.aspx.cs" Inherits="LastTrialGene.Clients" %>
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

<asp:Content style="max-width:100% !important;padding-left:0px !important" ID="Content" ContentPlaceHolderID="PageContent" runat="server">

    <dx:ASPxGridView runat="server" ID="GridView" ClientInstanceName="gridView"
        KeyFieldName="id" EnablePagingGestures="False" SeparatorWidth="0"
        CssClass="grid-view" Width="100%"
        DataSourceID="GridViewDataSource"
        OnCustomCallback="GridView_CustomCallback"
        OnInitNewRow="GridView_InitNewRow"  OnCellEditorInitialize="grid_CellEditorInitialize" OnRowValidating="grid_RowValidating" OnRowInserted="ASPxGridView1_RowInserted" onrowupdated="GridView_RowUpdated">
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
        <%--<dx:GridViewDataHyperLinkColumn FieldName="id" CellStyle-HorizontalAlign="Left" Caption="EmployerName" Width="300px" ExportCellStyle-HorizontalAlign="Left">
                <Settings FilterMode="DisplayText" SortMode="DisplayText" />
                <PropertiesHyperLinkEdit NavigateUrlFormatString="GridViewDetailsPage.aspx?id={0}" TextField="EmployerName" />
                <EditItemTemplate>
                    <dx:ASPxTextBox runat="server" ID="SubjectTextBox"
                        Value='<%# Bind("EmployerName") %>'
                        ValidationSettings-ValidationGroup="<%# Container.ValidationGroup %>">
                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </EditItemTemplate>
            </dx:GridViewDataHyperLinkColumn>--%>

            <dx:GridViewDataComboBoxColumn VisibleIndex="1" FieldName="Country"  Visible="false">
                <PropertiesComboBox ValueField="ID" TextField="Name" ValueType="System.Int64"  DataSourceID="ContactsDataSource">
                      <ClientSideEvents SelectedIndexChanged="CountriesCombo_SelectedIndexChanged" />
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />  
            </dx:GridViewDataComboBoxColumn>



            

            <dx:GridViewDataComboBoxColumn VisibleIndex="1" FieldName="City" Visible="false">
                <PropertiesComboBox  ValueField="City" TextField="Name" ValueType="System.Int64"  DataSourceID="AllCitySource">
                                    
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"></ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />  
            </dx:GridViewDataComboBoxColumn>

           
       


            <dx:GridViewDataColumn Visible="true" FieldName="id" />
            <dx:GridViewDataTextColumn FieldName="EmployerName" Width="25%">
                <PropertiesTextEdit>
                <ValidationSettings>
             
                    <RequiredField ErrorText="Employer Name required" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Address">

                 <PropertiesTextEdit>
                <ValidationSettings>
             
                    <RequiredField ErrorText="Employer Name required" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>




                    <dx:GridViewDataTextColumn FieldName="EmailAddress" Visible="false">
             <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <RequiredField ErrorText="Email required" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn FieldName="EmailAddress2" Visible="false">
             <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        

            <dx:GridViewDataTextColumn FieldName="PhoneNo" Width="25%">
                                                 <PropertiesTextEdit>
                         <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid phone number" ValidationExpression="^[0-9]*$" />
                 <RequiredField ErrorText="Enter phonenumber" IsRequired="True" />
                 </ValidationSettings>
                 </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

             <dx:GridViewDataTextColumn FieldName="PhoneNo2">
                                                  <PropertiesTextEdit>
                         <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid phone number" ValidationExpression="^[0-9]*$" />
           
                 </ValidationSettings>
                 </PropertiesTextEdit>
             </dx:GridViewDataTextColumn>

            
            <dx:GridViewDataDateColumn FieldName="Start" >  
              <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy">
                <ValidationSettings>  
               <RequiredField IsRequired="true" ErrorText="Select Start Date" />  
              </ValidationSettings>
              </PropertiesDateEdit>  
               </dx:GridViewDataDateColumn>

            
            <dx:GridViewDataDateColumn FieldName="End" >  
              <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy">
                                      <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select End Date" />  
                    </ValidationSettings>
              </PropertiesDateEdit>  
               </dx:GridViewDataDateColumn>
         
             
       
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
                        <dx:GridViewColumnLayoutItem ColumnName="EmployerName" />
                      
                           <dx:GridViewColumnLayoutItem ColumnName="PhoneNo2" caption="Phone Number2" />
                      
                        <dx:GridViewColumnLayoutItem ColumnName="Address" Caption="Physical Address" />
                         <dx:GridViewColumnLayoutItem ColumnName="EmailAddress" CAPTION="Email Address"/>
                          <dx:GridViewColumnLayoutItem ColumnName="Country" />
                              <dx:GridViewColumnLayoutItem ColumnName="EmailAddress2" CAPTION="Email Address2"/>
                   
                           <dx:GridViewColumnLayoutItem ColumnName="City" />
                                    <dx:GridViewColumnLayoutItem ColumnName="Start" Caption="Start Date" />            
                   
                        
                     
                     
                           <dx:GridViewColumnLayoutItem ColumnName="PhoneNo" caption="Phone Number" />
                        <dx:GridViewColumnLayoutItem ColumnName="End" Caption="End Date"/>
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
    </dx:ASPxGridView>

    <asp:ObjectDataSource ID="GridViewDataSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.EmploymentDetails"
        TypeName=" LastTrialGene.Model.EmploymentDataProvider"
        SelectMethod="GetEmployentdetails" InsertMethod="AddNewEmployerDetails" UpdateMethod="UpdateEmployerDetails"></asp:ObjectDataSource>

   <asp:ObjectDataSource ID="ContactsDataSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Country"
        TypeName=" LastTrialGene.Model.EmploymentDataProvider"
        SelectMethod="GetCountry"></asp:ObjectDataSource>


    <%----------------ddd ---------%>
         <asp:ObjectDataSource ID="AllCitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
        TypeName=" LastTrialGene.Model.EmploymentDataProvider"
        SelectMethod="GetCity">
  </asp:ObjectDataSource>

  <asp:ObjectDataSource ID="CitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
        TypeName=" LastTrialGene.Model.EmploymentDataProvider"
        SelectMethod="GetCity">
       <SelectParameters>
                <asp:Parameter Name="country" Type="Int32" />
            </SelectParameters>
  </asp:ObjectDataSource>
        
         <%---------------------------------%>

     <%-- <asp:ObjectDataSource ID="ObjectDataSourceCity" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
        TypeName=" LastTrialGene.Model.EmploymentDataProvider"
        SelectMethod="GetCity"></asp:ObjectDataSource>--%>

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
