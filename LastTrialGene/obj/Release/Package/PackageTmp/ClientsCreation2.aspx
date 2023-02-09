<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="ClientsCreation2.aspx.cs" Inherits="LastTrialGene.ClientsCreation2" %>

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
                    <h1>Grid View</h1>
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
    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="GridViewDataSource" CssClass="grid-view"
        KeyFieldName="ID" AutoGenerateColumns="False" OnRowUpdating="grid_RowUpdating"
        Width="100%" OnRowInserting="grid_RowInserting">
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true" VisibleIndex="0" />
            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                <EditFormSettings VisibleIndex="0" />
            </dx:GridViewDataTextColumn>
            <%-- <dx:GridViewDataColumn FieldName="ClientID" VisibleIndex="2">
                <EditFormSettings VisibleIndex="1" />
            </dx:GridViewDataColumn>--%>
            <dx:GridViewDataColumn FieldName="Name" VisibleIndex="4">
                <EditFormSettings VisibleIndex="2" ColumnSpan="2" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataMemoColumn FieldName="IdentificationNo" Visible="true">
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataColumn FieldName="RegistrationOffice" VisibleIndex="3">
                <EditFormSettings VisibleIndex="3" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn Visible="false" FieldName="CustodialGroup" VisibleIndex="5">
                <EditFormSettings VisibleIndex="4" />
            </dx:GridViewDataColumn>

            <%--  <dx:GridViewDataColumn Visible="false" FieldName="ID" />
            <dx:GridViewDataColumn Visible="false" FieldName="ClientID"/>
            <dx:GridViewDataColumn FieldName="AccountName" Width="25%"/>
            <dx:GridViewDataColumn FieldName="AccountNo" Width="25%"/>
            <dx:GridViewDataColumn FieldName="AccountTypeName" Width="20%"/>
            <dx:GridViewDataColumn FieldName="BankName" Width="20%"/>--%>
        </Columns>
        <SettingsPager Mode="ShowAllRecords" />
        <SettingsPopup>
            <EditForm Width="600" Modal="true">
                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
            </EditForm>
        </SettingsPopup>
        <Templates>
            <EditForm>
                <div style="padding: 4px 3px 4px">
                    <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%">
                        <TabPages>
                            <dx:TabPage Text="Counterparty Details" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <%--<dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors"
                                            runat="server"></dx:ASPxGridViewTemplateReplacement>--%>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <div>
                                                        <dx:ASPxLabel ID="lblClientNumber" runat="server" Text="Client Number"></dx:ASPxLabel>
                                                        <dx:ASPxTextBox ID="txtClientNumber" runat="server" Text='<%# Eval("ID")%>' ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>



                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel44" runat="server" Text="Title"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox SelectedIndex="0" DataSourceID="titleSource" ID="cboSalutation" runat="server" Caption="" ClientInstanceName="cboCountry" ValueField="Type" ValueType="System.Int32" TextField="Name">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select a country" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>

                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel45" runat="server" Text="Identification Type"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox ID="drpIdentificationType" runat="server" Caption="" ClientInstanceName="cboCountry" ValueField="ID" ValueType="System.Int32" TextField="Name" AutoPostBack="True" OnSelectedIndexChanged="cboCountry_SelectedIndexChanged">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select a country" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel37" runat="server" Text="First Name"></dx:ASPxLabel>
                                                    <dx:ASPxTextBox ID="txtMiddleName" runat="server" Text='<%# Eval("Name")%>' ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>



                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel38" runat="server" Text="Identification No"></dx:ASPxLabel>
                                                    <dx:ASPxTextBox ID="txtIdentificationNo" runat="server" Text='<%# Eval("IdentificationNo")%>' ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel46" runat="server" Text="Middle Name"></dx:ASPxLabel>
                                                    <dx:ASPxTextBox ID="txtMiddleName1" runat="server" Text='<%# Eval("Name3")%>' ClientInstanceName="txtMiddleName1"></dx:ASPxTextBox>



                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel47" runat="server" Text="Date Of Birth"></dx:ASPxLabel>
                                                    <dx:ASPxDateEdit runat="server" ClientInstanceName="dteStartOfEmployment" ID="dteDateOfBirth">
                                                        <%--<ValidationSettings>
                                                                <RequiredField IsRequired="True" ErrorText="Start of employment required"></RequiredField>
                                                            </ValidationSettings>--%>
                                                    </dx:ASPxDateEdit>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel48" runat="server" Text="Surname"></dx:ASPxLabel>
                                                    <dx:ASPxTextBox ID="txtSurname" runat="server" Text='<%# Eval("Name2")%>' ClientInstanceName="txtSurname"></dx:ASPxTextBox>



                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel49" runat="server" Text="Inception Date"></dx:ASPxLabel>
                                                       <%--<dx:ASPxDateEdit EditFormat="Custom" runat="server" Text='<%# Bind("InceptionDate","{0:MMM dd,yyyy}")%>' ClientInstanceName="dteInceptionDate" ID="dteInceptionDate">
                                                     <ValidationSettings>
                                                                <RequiredField IsRequired="True" ErrorText="Start of employment required"></RequiredField>
                                                            </ValidationSettings>
                                                    </dx:ASPxDateEdit>--%>

                                                    <dx:ASPxDateEdit ID="dateEdit" runat="server"  EditFormat="Custom"  Width="190" Caption="">
                                                        <TimeSectionProperties>
                                                            <TimeEditProperties EditFormatString="hh:mm tt" />
                                                        </TimeSectionProperties>
                                                        <CalendarProperties>
                                                            <FastNavProperties DisplayMode="Inline" />
                                                        </CalendarProperties>
                                                    </dx:ASPxDateEdit>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel50" runat="server" Text="Sex"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox SelectedIndex="0" DataSourceID="SexSource" ID="cboGender" runat="server" Caption="" ClientInstanceName="cboGender" ValueField="ID" ValueType="System.Int32" TextField="Name">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select Sex" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>




                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel51" runat="server" Text="Gov Reg No"></dx:ASPxLabel>
                                                    <dx:ASPxTextBox ID="txtGovRegNo" runat="server" Text='<%# Eval("GovRegNo")%>' ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel52" runat="server" Text="Nationality"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox SelectedIndex="0"  DataSourceID="NationalitySource" ID="drpNationality" runat="server" Caption="" ClientInstanceName="drpNationality" ValueField="ID" ValueType="System.Int32" TextField="Name">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select Nationality" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>




                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel53" runat="server" Text="CitizenShip"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox  SelectedIndex="0" DataSourceID="NationalitySource" ID="cboCitizenship" runat="server" Caption="" ClientInstanceName="cboCitizenship" ValueField="ID" ValueType="System.Int32" TextField="Name" AutoPostBack="True" OnSelectedIndexChanged="cboCountry_SelectedIndexChanged">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select CitizenShip" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel54" Text="US Resident"></dx:ASPxLabel>
                                                    <dx:ASPxCheckBox runat="server" CheckState="Unchecked" ID="chkIsUSResident" ClientInstanceName="chkIsUSResident">
                                                    </dx:ASPxCheckBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel55" Text="Green Card Holder"></dx:ASPxLabel>
                                                    <dx:ASPxCheckBox runat="server" CheckState="Unchecked" ID="chkGreenCardHolder" ClientInstanceName="chkIsUSResident">
                                                    </dx:ASPxCheckBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="drpCountryOfResidence" Text="Country Of Residence"></dx:ASPxLabel>

                                                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Caption="" ClientInstanceName="cboCitizenship" ValueField="ID" ValueType="System.Int32" TextField="Name" AutoPostBack="True" OnSelectedIndexChanged="cboCountry_SelectedIndexChanged">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select CitizenShip" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>

                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel57" Text="Dual Citizenship"></dx:ASPxLabel>
                                                    <dx:ASPxCheckBox runat="server" CheckState="Unchecked" ID="chkDualCitizenship" ClientInstanceName="chkIsUSResident">
                                                    </dx:ASPxCheckBox>
                                                </div>
                                            </div>
                                        </div>



                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Contact Details" Visible="true">

                                <ContentCollection>
                                    <dx:ContentControl runat="server">



                                        <%-- %> <dx:ASPxMemo runat="server" ID="notesEditor" Text='<%# Eval("ID")%>' Width="100%" Height="93px" />--%>



                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <div>
                                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Phone No"></dx:ASPxLabel>
                                                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Text='<%# Eval("PhoneNo")%>' ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="d" runat="server" Text="Email Address"></dx:ASPxLabel>
                                                    <dx:ASPxTextBox ID="txtEmailAddress" runat="server" Text='<%# Eval("EmailAddress")%>' Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Phone No2"></dx:ASPxLabel>

                                                    <dx:ASPxTextBox class="form-control" ID="txtPhoneNo2" runat="server" Text='<%# Eval("PhoneNo2")%>' Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>

                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel101" runat="server" Text="Fax No"></dx:ASPxLabel>
                                                    <dx:ASPxTextBox class="form-control" ID="txtFaxNo" runat="server" Text='<%# Eval("FaxNo")%>' Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>
                                                </div>
                                            </div>
                                        </div>






                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Mobile No"></dx:ASPxLabel>

                                                    <dx:ASPxTextBox class="form-control" ID="txtMobileNo" runat="server" Text='<%# Eval("PhoneNo3")%>' Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>
                                                </div>
                                            </div>

                                        </div>




                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Physical Address"></dx:ASPxLabel>

                                                    <dx:ASPxMemo class="form-control" ID="txtPhysicalAddressmemo" runat="server" Text='<%# Eval("PhysicalAddress")%>' Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxMemo>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Postal Address"></dx:ASPxLabel>
                                                    <dx:ASPxMemo class="form-control" ID="txtPostalAddressmemo" runat="server" Text='<%# Eval("PostalAddress")%>' Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxMemo>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Physical Address"></dx:ASPxLabel>
                                                    <dx:ASPxMemo class="form-control" ID="txtPhysicalAddressmemo2" runat="server" Text='<%# Eval("PhysicalAddress2")%>' Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxMemo>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Postal Address"></dx:ASPxLabel>
                                                    <dx:ASPxMemo class="form-control" ID="txtPostalAddressmemo2" runat="server" Text='<%# Eval("PostalAddress2")%>' Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxMemo>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Country"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox ID="cboCountry" runat="server" Caption="" ClientInstanceName="cboCountry" ValueField="ID" ValueType="System.Int32" TextField="Name" AutoPostBack="True" OnSelectedIndexChanged="cboCountry_SelectedIndexChanged">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select a country" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Postal Country"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox ID="cboPostCountry" Caption="" runat="server" ClientInstanceName="cboPostCountry" ValueField="ID" ValueType="System.Int32" TextField="Name" AutoPostBack="True" OnSelectedIndexChanged="cboPostCountry_SelectedIndexChanged">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select Post Country" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </div>
                                            </div>
                                        </div>



                                    </dx:ContentControl>
                                </ContentCollection>

                                <%-- <ContentCollection>
                                   <dx:ContentControl runat="server">
                              <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Text='<%# Eval("PhoneNo2")%>' Caption="Phone No2"  ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>
                                    </dx:ContentControl>
                                </ContentCollection>

                                 <ContentCollection>
                                   <dx:ContentControl runat="server">
                                <dx:ASPxTextBox ID="txtEmailAddress" runat="server" Text='<%# Eval("EmailAddress")%>' Caption="EmailAdress"  ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>
                                    </dx:ContentControl>
                                </ContentCollection>

                                 <ContentCollection>
                                   <dx:ContentControl runat="server">
                                        <dx:ASPxTextBox ID="txtFaxNo" runat="server" Text='<%# Eval("txtFaxNo")%>' Caption="Fax No"  ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>
                                    </dx:ContentControl>
                                </ContentCollection>--%>
                            </dx:TabPage>


                            <dx:TabPage Text="Investment Details" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Sector"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox SelectedIndex="0" DataSourceID="SectorSource" ID="cboSector" runat="server" Caption="" ClientInstanceName="cboSector" ValueField="ID" ValueType="System.Int32" TextField="Name" AutoPostBack="True">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select a Sector" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Client Group"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox SelectedIndex="0" DataSourceID="ClientGroupSource" ID="cboClientGroup" Caption="" runat="server" ClientInstanceName="cboPostCountry" ValueField="ID" ValueType="System.Int32" TextField="Name" AutoPostBack="True">

                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select Client Group" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>





                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Source Of Income"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox SelectedIndex="0" DataSourceID="SourceOfIncomeSource" ID="cboSourceOfIncome" runat="server" Caption="" ClientInstanceName="cboCountry" ValueField="ID" ValueType="System.Int32" TextField="Name" AutoPostBack="True">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select a Sector" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel201" runat="server" Text="Branch"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox SelectedIndex="0" DataSourceID="BranchSource" ID="cboBranch" Caption="" runat="server" ClientInstanceName="cboPostCountry" ValueField="ID" ValueType="System.Int32" TextField="Name" AutoPostBack="True">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select Client Group" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Risk Rating"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox ID="cboRiskRating" SelectedIndex="0" DataSourceID="RiskRating" runat="server" Caption="" ClientInstanceName="cboRiskRating" ValueField="ClientRisk" ValueType="System.Int32" TextField="Name" AutoPostBack="True">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select Risk Rating" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Custodial Group"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox ID="cboCustodialGroup" SelectedIndex="0" DataSourceID="CustodialGroup" Caption="" runat="server" ClientInstanceName="cboCustodialGroup" ValueField="CustodialGroup" ValueType="System.Int32" TextField="Name" OnSelectedIndexChanged="cboCustodialGroup_SelectedIndexChanged">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select Custodial Group" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="upfee" Text="Upfront Fee"></dx:ASPxLabel>
                                                    <dx:ASPxCheckBox runat="server" CheckState="Unchecked" ID="chkUpfrontFee" ClientInstanceName="chkIsUSResident">
                                                    </dx:ASPxCheckBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel1" Text="VAT"></dx:ASPxLabel>
                                                    <dx:ASPxCheckBox runat="server" CheckState="Unchecked" ID="chkVAT" ClientInstanceName="chkIsUSResident">
                                                    </dx:ASPxCheckBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel2" Text="Withholdings TAX "></dx:ASPxLabel>
                                                    <dx:ASPxCheckBox runat="server" CheckState="Unchecked" ID="chkWithholdingsTax" ClientInstanceName="chkIsUSResident">
                                                    </dx:ASPxCheckBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel3" Text="Ledger Fee"></dx:ASPxLabel>
                                                    <dx:ASPxCheckBox runat="server" CheckState="Unchecked" ID="chkLedgerFees" ClientInstanceName="chkIsUSResident">
                                                    </dx:ASPxCheckBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel4" Text="Managed"></dx:ASPxLabel>
                                                    <dx:ASPxCheckBox runat="server" CheckState="Unchecked" ID="chkManaged" ClientInstanceName="chkIsUSResident">
                                                    </dx:ASPxCheckBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel5" Text="Send SMS"></dx:ASPxLabel>
                                                    <dx:ASPxCheckBox runat="server" CheckState="Unchecked" ID="chkSendSms" ClientInstanceName="chkIsUSResident">
                                                    </dx:ASPxCheckBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel22" Text="IncomeType"></dx:ASPxLabel>
                                                    <dx:ASPxComboBox ID="cboIncomeType" SelectedIndex="0" DataSourceID="RiskRating" runat="server" Caption="" ClientInstanceName="cboRiskRating" ValueField="ClientRisk" ValueType="System.Int32" TextField="Name" AutoPostBack="True">
                                                        <ValidationSettings>
                                                            <RequiredField ErrorText="Select Income Type" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel23" Text="T-MON Account No."></dx:ASPxLabel>
                                                    <dx:ASPxTextBox ID="txtTmonAcountNumber" runat="server" Text="" Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel24" Text="ZSE Account Number"></dx:ASPxLabel>
                                                    <dx:ASPxTextBox ID="txtZseAccountNumber" runat="server" Text='<%# Eval("ZSENumber")%>' Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>

                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <dx:ASPxLabel runat="server" ID="ASPxLabel25" Text="VFX Account Number"></dx:ASPxLabel>
                                                    <dx:ASPxTextBox ID="txtVfxAccountNumber" runat="server" Text='<%# Eval("VFXNumber")%>' Caption="" ClientInstanceName="txtPhoneNo"></dx:ASPxTextBox>

                                                </div>
                                            </div>
                                        </div>


                                        <columns>
                                            <dx:GridViewDataComboBoxColumn Caption="Custodial kkk" FieldName="CityId" Caption="City">
                                                <propertiescombobox enablesynchronization="false" incrementalfilteringmode="StartsWith"
                                                    datasourceid="CitiesDataSource" valuefield="CityId" textfield="CityName" valuetype="System.Int32" datasecuritymode="Strict">
                                                    <clientsideevents endcallback="onCityEndCallback" />
                                                </propertiescombobox>
                                            </dx:GridViewDataComboBoxColumn>
                                        </columns>


                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                     
                            
                        </TabPages>
                    </dx:ASPxPageControl>
                </div>
                <div style="text-align: right; padding: 2px">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                        runat="server"></dx:ASPxGridViewTemplateReplacement>
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server"></dx:ASPxGridViewTemplateReplacement>
                </div>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>

    <asp:ObjectDataSource ID="GridViewDataSource" runat="server" DataObjectTypeName="LastTrialGene.Models.ClientDetailsDataUpdate1"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetClients" InsertMethod="AddNewCounterBank" UpdateMethod="UpdateClients"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="CustodialGroup" runat="server" DataObjectTypeName=" LastTrialGene.Model.Custodialgroup"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetCustodialGroup"></asp:ObjectDataSource>

    <%-- <asp:ObjectDataSource ID="CustodialGroup" runat="server" DataObjectTypeName=" LastTrialGene.Model.CustodialgroupMapper"
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
    
    <asp:ObjectDataSource ID="SexSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sex"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetSex"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="NationalitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sex"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetNationality"></asp:ObjectDataSource>





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
