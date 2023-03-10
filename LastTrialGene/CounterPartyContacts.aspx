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
        PreviewFieldName="Name"  OnInit="Grid_Init" OnRowInserted="ASPxGridView1_RowInserted" onrowupdated="GridView_RowUpdated" OnRowValidating="grid_RowValidating" OnEditFormLayoutCreated="grid_EditFormLayoutCreated" OnCellEditorInitialize="grid_CellEditorInitialize">
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
            
             <dx:GridViewDataCheckColumn FieldName = "CoOwner" VisibleIndex="2">
               <propertiescheckedit ValueChecked="True" ValueType="System.String"
                   ValueUnchecked="False">
                   <clientsideevents Init="function(s, e){s.SetChecked(true); gridView.GetMainElement().getElementsByClassName('citizen2')[0].style.visibility ='hidden'; gridView.GetMainElement().getElementsByClassName('HasUSGreenCard')[0].style.visibility ='hidden';}" />
                    <clientsideevents CheckedChanged = "function (s,e) {if( s.GetCheckState()=='Checked'){gridView.GetMainElement().getElementsByClassName('OwnershipPercent')[0].style.visibility ='visible';}if( s.GetCheckState()=='Unchecked'){gridView.GetMainElement().getElementsByClassName('OwnershipPercent')[0].style.visibility ='hidden';} }" />
               </propertiescheckedit>

           </dx:GridViewDataCheckColumn>

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
                <PropertiesComboBox ShowImageInEditBox="true" ImageUrlField="imgUrl" ValueField="Nationality" TextField="Name" DataSourceID="NationalitySource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Nationality" />  
                    </ValidationSettings>
                       <ItemImage Height="20px" Width="28px" />
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="Citizenship" Visible="false">
                <PropertiesComboBox ShowImageInEditBox="true" ImageUrlField="imgUrl" ValueField="Citizenship" TextField="Name" DataSourceID="NationalitySource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Citizenship" />  
                    </ValidationSettings>
                       <ItemImage Height="20px" Width="28px" />
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="Citizenship2" Visible="false">
                <PropertiesComboBox ShowImageInEditBox="true" ImageUrlField="imgUrl" ValueField="Citizenship2" TextField="Name" DataSourceID="NationalitySource">
                       <ItemImage Height="20px" Width="28px" />
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            

                 <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="CountryOfResidence" Visible="false">
                <PropertiesComboBox ShowImageInEditBox="true" ImageUrlField="imgUrl" ValueField="CountryOfResidence" TextField="Name" DataSourceID="DataSourceCountryOfResidence">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Physical Country" />  
                    </ValidationSettings>
                            <ClientSideEvents ValueChanged="function(s, e) {  
                                         if(s.GetText()=='USA'){
                                gridView.GetMainElement().getElementsByClassName('HasUSGreenCard')[0].style.visibility ='visible';
		                                     }else{ gridView.GetMainElement().getElementsByClassName('HasUSGreenCard')[0].style.visibility ='hidden';} 
     
        }" />
                       <ItemImage Height="20px" Width="28px" />
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>


             <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="PhysicalCountry" Visible="false">
                <PropertiesComboBox ShowImageInEditBox="true" ImageUrlField="imgUrl" ValueField="PhysicalCountry" TextField="Name" DataSourceID="DataSourceCountry">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Physical Country" />  
                    </ValidationSettings>
                       <ItemImage Height="20px" Width="28px" />
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

             <dx:GridViewDataComboBoxColumn VisibleIndex="2" FieldName="PostalCountry" Visible="false">
                <PropertiesComboBox ShowImageInEditBox="true" ImageUrlField="imgUrl" ValueField="PostalCountry" TextField="Name" DataSourceID="DataSourceCountry">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Postal Country" />  
                    </ValidationSettings>
                       <ItemImage Height="20px" Width="28px" />
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
      
             <dx:GridViewDataTextColumn FieldName="PhoneNo2" Width="20%" Visible="false">
                                      <PropertiesTextEdit>
                         <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid phone number" ValidationExpression="^[0-9]*$" />
                 </ValidationSettings>
                 </PropertiesTextEdit>
             </dx:GridViewDataTextColumn>
         


          
            <dx:GridViewDataTextColumn FieldName="OwnershipPercent" Width="25%">
                 <PropertiesTextEdit>
                         <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid phone number" ValidationExpression="^[0-9]*$" />
                 <RequiredField ErrorText="Enter number" IsRequired="True" />
                 </ValidationSettings>
                 </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataMemoColumn FieldName="PhysicalAddress" Width="25%">
                <PropertiesMemoEdit>
                     <ValidationSettings>
                 <RequiredField ErrorText="Enter Physical Address" IsRequired="True" />
                 </ValidationSettings>
                </PropertiesMemoEdit>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataMemoColumn FieldName="PhysicalAddress2" Width="25%" Visible="false" />
            <dx:GridViewDataMemoColumn FieldName="PostalAddress" Width="20%" />
            <dx:GridViewDataMemoColumn FieldName="PostalAddress2" Width="20%" Visible="false"/>

            <dx:GridViewDataTextColumn FieldName="PhoneNo" Width="20%">
                
                     <PropertiesTextEdit>
                         <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid phone number" ValidationExpression="^[0-9]*$" />
                 <RequiredField ErrorText="Enter phonenumber" IsRequired="True" />
                 </ValidationSettings>
                 </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

          

                 <dx:GridViewDataDateColumn FieldName="CreationDate" >  
              <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy">
                                      <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Date Of Birth" />  
                    </ValidationSettings>
              </PropertiesDateEdit>  
               </dx:GridViewDataDateColumn>



        <dx:GridViewDataColumn  FieldName="EmailAddress"/>
            <dx:GridViewDataImageColumn>

            </dx:GridViewDataImageColumn>

                   <dx:GridViewDataBinaryImageColumn FieldName="Photo">
                <PropertiesBinaryImage ImageHeight="170px" ImageWidth="160px">
                    <EditingSettings Enabled="true" UploadSettings-UploadValidationSettings-MaxFileSize="4194304" />
                </PropertiesBinaryImage>
            </dx:GridViewDataBinaryImageColumn>

                <dx:GridViewDataBinaryImageColumn FieldName="SignaturePhoto">
                <PropertiesBinaryImage ImageHeight="170px" ImageWidth="160px">
                    <EditingSettings Enabled="true" UploadSettings-UploadValidationSettings-MaxFileSize="4194304" />
                </PropertiesBinaryImage>
            </dx:GridViewDataBinaryImageColumn>
        

    





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
                                    <dx:GridViewColumnLayoutItem CssClass="OwnershipPercent" ColumnName="OwnershipPercent" Caption="Ownership Holding" />
                                  <dx:GridViewColumnLayoutItem ColumnName="CoOwner" Caption="Account Co-Owner"/>
                                 <dx:GridViewColumnLayoutItem ColumnName="ContactOnly" Caption="Contact Only"/>
                                 <dx:GridViewColumnLayoutItem ColumnName="IdentificationNo" Caption="ID Number" />
                                <dx:GridViewColumnLayoutItem ColumnName="SalutationType" Caption="Title"/>
                                  <dx:GridViewColumnLayoutItem ColumnName="CreationDate" Caption="Date Of Birth" />
                                <dx:GridViewColumnLayoutItem ColumnName="Name" Caption="First Name" />
                                 <dx:GridViewColumnLayoutItem ColumnName="SexID" Caption="Sex" />
                                 <dx:GridViewColumnLayoutItem ColumnName="IdentificationType" Caption="ID Type" />
                                 <dx:GridViewColumnLayoutItem ColumnName="GovReg" Caption="GovReg" />
                                
                              

                                <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />
                            </Items>
                        </dx:GridViewLayoutGroup>

                         <dx:GridViewLayoutGroup Caption="Citizenship" ColCount="2" GroupBoxDecoration="None">
                                <Items>
                                           <dx:GridViewColumnLayoutItem ColumnName="Nationality" Caption="Nationality" />
                                    <%--<dx:GridViewColumnLayoutItem ColumnName="IsUSResident" Caption="IsUSResident" />--%>
                               
                                       <dx:GridViewColumnLayoutItem CssClass="citizen2"  ColumnName="Citizenship2" Caption="Citizenship 2" />
                                      <dx:GridViewColumnLayoutItem ColumnName="CountryOfResidence" Caption="Country Of Residence" />
                                
                                          <dx:GridViewColumnLayoutItem ColumnName="ContactType" Caption="Signatory Type" />
                                            <dx:GridViewColumnLayoutItem CssClass="HasUSGreenCard"  ColumnName="HasUSGreenCard" Caption="US Green Cardholder" />

                                       <%--<dx:GridViewColumnLayoutItem ColumnName="Citizenship" Caption="Citizenship" />--%>
                                    <dx:GridViewColumnLayoutItem ColumnName="MandateType" Caption="Mandate Type" />
                                      <dx:GridViewColumnLayoutItem ColumnName="DualCit" Caption="Dual Citizenship" />
                                     
                                      <dx:GridViewColumnLayoutItem ColumnName="RelationShip" Caption="Relationship" />

                                </Items>
                         </dx:GridViewLayoutGroup>
                         <dx:GridViewLayoutGroup Caption="Contact Details" ColCount="2" GroupBoxDecoration="None">
                            <Items>


                                <dx:GridViewColumnLayoutItem ColumnName="PhoneNo" Caption="PhoneNo" />                            
                                 <dx:GridViewColumnLayoutItem ColumnName="EmailAddress2" Caption="Email Address2" />        
                                <dx:GridViewColumnLayoutItem ColumnName="PhoneNo2" Caption="Mobile Number" />                               
                                  <dx:GridViewColumnLayoutItem ColumnName="EmailAddress3" Caption="Email Address3" />
                                  <dx:GridViewColumnLayoutItem ColumnName="EmailAddress" Caption="Email Address" />                               
                                    <dx:GridViewColumnLayoutItem ColumnName="EmailAddress4" Caption="Email Address4" />
                                
                              

                               
                                

                               
                                




                                <%--   <dx:GridViewColumnLayoutItem ColumnName="IsArchived" CaptionSettings-AllowWrapCaption="False" />
                        <dx:GridViewColumnLayoutItem ColumnName="Kind"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Priority" />
                        <dx:GridViewColumnLayoutItem ColumnName="Status" />--%>
       
                            </Items>
                        </dx:GridViewLayoutGroup>
                        <dx:GridViewLayoutGroup Caption="Contact Address" ColCount="2" GroupBoxDecoration="None">
                            <Items>

                                <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress" />
                                <dx:GridViewColumnLayoutItem ColumnName="PostalAddress" Caption="PostalAddress" />
                                 <dx:GridViewColumnLayoutItem ColumnName="PhysicalCountry" Caption="Physical Country" />
                                 <dx:GridViewColumnLayoutItem ColumnName="PostalCountry" Caption="Postal Country" />     
                                <%--<dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress2" />--%>
                                 <dx:GridViewColumnLayoutItem ColumnName="PhysicalCity" Caption="Physical City" />
                                
                                                          
                                <%--<dx:GridViewColumnLayoutItem ColumnName="PostalAddress2" Caption="PostalAddress" />--%>
                                <dx:GridViewColumnLayoutItem ColumnName="PostalCity" Caption="Postal City" />
                  

                   

                        
                            </Items>
                        </dx:GridViewLayoutGroup>

                           <dx:GridViewLayoutGroup Caption="Image Details" ColCount="2" GroupBoxDecoration="None">
                            <Items>

                                <dx:GridViewColumnLayoutItem ColumnName="SignaturePhoto" Caption="Scan/Load Signature"/>

                                <dx:GridViewColumnLayoutItem ColumnName="Photo" Caption="Scan/Load Picture"/>
                             

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

        <asp:ObjectDataSource ID="DataSourceCountryOfResidence" runat="server" DataObjectTypeName="LastTrialGene.ContactsContext.Country"
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
