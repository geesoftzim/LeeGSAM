<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClientsCreation2.ascx.cs" Inherits="LastTrialGene.Controls.ClientsCreation2" %>

<script type="text/javascript"> 

    function title_SelectedIndexChanged(s, e) {
        //gridView.GetEditor("PhysicalCity").PerformCallback(s.GetValue());
        document.getElementsByClassName('HasUSGreenCard')[0].style.visibility = "hidden";
        document.getElementsByClassName('citizen2')[0].style.visibility = "hidden";
    }

    function CountriesCombo_SelectedIndexChanged(s, e) {
        console.log('physical city fired');

        gridView.GetEditor("PhysicalCity").PerformCallback(s.GetValue());
    }

    function PostCountriesCombo_SelectedIndexChanged(s, e) {
        console.log('postal city fired');
        gridView.GetEditor("PostalCity").PerformCallback(s.GetValue());
    }

    function EmpCountriesCombo_SelectedIndexChanged(s, e) {
        console.log('employer city fired');
        gridView.GetEditor("EmployerPhysicalCity").PerformCallback(s.GetValue());
    }



    </script>








<%--<dx:ASPxGridView ID="grid" runat="server" DataSourceID="GridViewDataSource" CssClass="grid-view"
        KeyFieldName="ID" AutoGenerateColumns="False" OnRowUpdating="grid_RowUpdating"
        Width="100%" OnRowInserting="grid_RowInserting">  OnCellEditorInitialize="grid_CellEditorInitialize" --%>
<dx:ASPxGridView runat="server" ID="GridView" ClientInstanceName="gridView"
    KeyFieldName="ID" EnablePagingGestures="False" SeparatorWidth="0"
    CssClass="grid-view" Width="100%"
    DataSourceID="ObjectDataSourceCompanyEmployees"
    OnCustomCallback="GridView_CustomCallback"
    OnInitNewRow="GridView_InitNewRow"
    PreviewFieldName="Name" OnInit="Grid_Init" OnCellEditorInitialize="grid_CellEditorInitialize" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="GridView_RowUpdated" OnRowValidating="grid_RowValidating" OnEditFormLayoutCreated="grid_EditFormLayoutCreated">
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

        <dx:GridViewDataTextColumn FieldName="ID" />
        <dx:GridViewDataTextColumn ReadOnly="true" FieldName="ClientNo" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="Name" Caption="First Name" Width="20%" />
        <dx:GridViewDataTextColumn FieldName="RegistrationOffice" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="IncomeTaxNo" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="VATRegistrationNo" Visible="false" />

        <dx:GridViewDataTextColumn FieldName="EmailAddress" Visible="false">
             <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <RequiredField ErrorText="Email required" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>

        <dx:GridViewDataTextColumn FieldName="EmailAddress3" Visible="false">
             <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <RequiredField ErrorText="Email required" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>

        <dx:GridViewDataTextColumn FieldName="EmailAddress4" Visible="false">
             <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <RequiredField ErrorText="Email required" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>

        <dx:GridViewDataCheckColumn FieldName="HoldStatement" Caption="HoldStatement" Width="20%" />

        <dx:GridViewDataCheckColumn FieldName="EmailStatement" Caption="EmailStatement" Width="20%" />


        <dx:GridViewDataTextColumn FieldName="BPNumber" Visible="false" />

        <dx:GridViewDataTextColumn FieldName="PhoneNo" Visible="false">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid phone number" ValidationExpression="^[0-9]*$" />
                    <RequiredField ErrorText="Enter phonenumber" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>

        <dx:GridViewDataTextColumn FieldName="PhoneNo2" Visible="false">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid phone number" ValidationExpression="^[0-9]*$" />
                    <RequiredField ErrorText="Enter phonenumber" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>

        <dx:GridViewDataTextColumn FieldName="PhoneNo3" Visible="false">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid phone number" ValidationExpression="^[0-9]*$" />
                    <RequiredField ErrorText="Enter phonenumber" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        

                <dx:GridViewDataTextColumn FieldName="EmailAddress2" Visible="false">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ErrorText="This is not a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <RequiredField ErrorText="Email required" IsRequired="True" />
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
        <dx:GridViewDataTextColumn FieldName="FaxNo" Visible="false" />

        <dx:GridViewDataTextColumn FieldName="IdentificationNo" Width="20%" />

        <dx:GridViewDataMemoColumn FieldName="PhysicalAddress" Visible="false" />
        <dx:GridViewDataMemoColumn FieldName="PhysicalAddress2" Visible="false" />

        <dx:GridViewDataMemoColumn FieldName="PostalAddress" Visible="false" />
        <dx:GridViewDataMemoColumn FieldName="PostalAddress2" Visible="false" />


        <dx:GridViewDataMemoColumn FieldName="SpecialInstructions" Visible="false" />


        <dx:GridViewDataCheckColumn FieldName="LedgerFee" Visible="false" />
        <dx:GridViewDataCheckColumn FieldName="IsFundAdmin" Visible="false" />
        <dx:GridViewDataCheckColumn FieldName="IsUSResident" Visible="false" />
        <dx:GridViewDataCheckColumn FieldName="ManagedClient" Visible="false" />
        <dx:GridViewDataCheckColumn FieldName="HasUSGreenCard" Visible="false" />
        <dx:GridViewDataCheckColumn FieldName="SendSMS" Visible="false" />
        <dx:GridViewDataCheckColumn FieldName="WithholdingTaxStatus" Visible="false" />


        <dx:GridViewDataCheckColumn FieldName="Active" Visible="false" />

        <dx:GridViewDataCheckColumn FieldName="UpfrontFee" Visible="false" />


        <dx:GridViewDataDateColumn FieldName="DateOfBirth">
            <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy"></PropertiesDateEdit>
        </dx:GridViewDataDateColumn>




        <dx:GridViewDataDateColumn>
            <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy"></PropertiesDateEdit>
        </dx:GridViewDataDateColumn>



        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="PhysicalCountry" Visible="false">
            <PropertiesComboBox ShowImageInEditBox="true" ImageUrlField="imgUrl" ValueField="PhysicalCountry" TextField="country" DataSourceID="CountrySource" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Country" />
                </ValidationSettings>
                <ClientSideEvents SelectedIndexChanged="CountriesCombo_SelectedIndexChanged" />
                  <ItemImage Height="20px" Width="28px" />
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />

        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="PhysicalCity" Visible="false">
            <PropertiesComboBox ValueField="PhysicalCity" TextField="city" DataSourceID="AllCitySource" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select City" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>




        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="PostalCity" Visible="false">
            <PropertiesComboBox ValueField="PostalCity" TextField="city" DataSourceID="AllCitySourcePost">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select City" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="PostalCountry" Visible="false">
            <PropertiesComboBox ShowImageInEditBox="true" ImageUrlField="imgUrl" ValueField="PostalCountry" TextField="country" DataSourceID="CountrySource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Country" />
                </ValidationSettings>
                <ClientSideEvents SelectedIndexChanged="PostCountriesCombo_SelectedIndexChanged" />
                  <ItemImage Height="20px" Width="28px" />
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>











        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="ClientGroup" Visible="false">
            <PropertiesComboBox ValueField="ClientGroup" TextField="Name" DataSourceID="ClientGroupSource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Custodial Group" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="BranchID" Visible="false">
            <PropertiesComboBox ValueField="BranchID" TextField="Name" DataSourceID="BranchSource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Branch" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>


        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="IdentificationType" Visible="false">
            <PropertiesComboBox ValueField="IdentificationType" TextField="Name" DataSourceID="IdentificationSource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Identification Type" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="Sector" Visible="false">
            <PropertiesComboBox ValueField="Sector" TextField="SectorName" DataSourceID="SectorSource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Sector" />
                </ValidationSettings>
            </PropertiesComboBox>

            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="IncomeType" Visible="false">
            <PropertiesComboBox ValueField="IncomeType" TextField="Name" DataSourceID="SourceOfIncomeSource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Income Type" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>





        <dx:GridViewDataComboBoxColumn VisibleIndex="3" FieldName="CustodialGroup" Visible="true">
            <PropertiesComboBox ValueField="CustodialGroup" TextField="Name" DataSourceID="ObjectDataCustodialgroup">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Risk" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

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
            <SettingsAdaptivity MaxWidth="900" Mode="Always" VerticalAlign="WindowCenter" />
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

                            <dx:GridViewColumnLayoutItem CssClass="flContainer" ColumnName="ClientNo" Caption="ClientNo">
                                <%--<CaptionStyle CssClass="flContainer"></CaptionStyle>--%>
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="AutoGene" Caption="AutoGene" />

                            <dx:GridViewColumnLayoutItem ColumnName="EntityType" Caption="Entity Type" />

                            <dx:GridViewColumnLayoutItem ColumnName="IdentificationNo" Caption="Registration Number" />
                            <dx:GridViewColumnLayoutItem ColumnName="Name" Caption="Entity Name" />

                            <dx:GridViewColumnLayoutItem ColumnName="DateOfBirth" Caption="Registration Date" />
                            <dx:GridViewColumnLayoutItem ColumnName="IdentificationType" Caption="ID Type" />

                            <dx:GridViewColumnLayoutItem ColumnName="IncomeTaxNo" Caption="Income Tax Number" />

                            <dx:GridViewColumnLayoutItem ColumnName="RegistrationOffice" Caption="Registration Office" />

                            <dx:GridViewColumnLayoutItem ColumnName="RelationShipManager" Caption="RelationShip Manager" />





                            <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />
                        </Items>
                    </dx:GridViewLayoutGroup>
                    <dx:GridViewLayoutGroup Caption="Investment Details" ColCount="2" GroupBoxDecoration="None">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="CustodialGroup" Caption="Custodial Group" />
                            <dx:GridViewColumnLayoutItem ColumnName="UpfrontFee" Caption="Upfront Fee" />
                            <dx:GridViewColumnLayoutItem ColumnName="ClientGroup" Caption="Client Group" />
                            <dx:GridViewColumnLayoutItem ColumnName="VAT" Caption="VAT" />
                            <dx:GridViewColumnLayoutItem ColumnName="BranchID" Caption="Branch" />
                            <dx:GridViewColumnLayoutItem ColumnName="WithholdingTaxStatus" Caption="Withholdings Tax" />
                            <dx:GridViewColumnLayoutItem ColumnName="VATRegistrationNo" Caption="VAT Number" />
                            <dx:GridViewColumnLayoutItem ColumnName="LedgerFee" Caption="Ledger Fee" />
                            <dx:GridViewColumnLayoutItem ColumnName="BPNumber" Caption="BP Number" />
                            <%-- <dx:GridViewColumnLayoutItem ColumnName="Sector" caption="Sector"/>--%>

                            <%--<dx:GridViewColumnLayoutItem ColumnName="IncomeType" caption="Source Of Income"/>   --%>
                            <dx:GridViewColumnLayoutItem ColumnName="ManagedClient" Caption="Managed" />
                            <dx:GridViewColumnLayoutItem ColumnName="SpecialInstructions" Caption="Special Instruction" />

                            <dx:GridViewColumnLayoutItem ColumnName="SendSMS" Caption="Send SMS Message" />
                            <dx:GridViewColumnLayoutItem ColumnName="Active" Caption="Active" />













                            <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />
                        </Items>
                    </dx:GridViewLayoutGroup>

                    <%-- <dx:GridViewLayoutGroup Caption="Contact Details" ColCount="2" GroupBoxDecoration="None">
                          <Items>
                                         <dx:GridViewColumnLayoutItem ColumnName="PhoneNo" Caption="PhoneNo" />
                               <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress" Caption="Physical Address"/>
                                        <dx:GridViewColumnLayoutItem ColumnName="PhoneNo2" Caption="PhoneNo 2"/>
                               <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress2"  Caption="Physical Address2"/>
                                         <dx:GridViewColumnLayoutItem ColumnName="PhoneNo3"  Caption="Mobile No"/>
                               <dx:GridViewColumnLayoutItem ColumnName="PostalAddress" Caption="Postal Address"/>

                                        <dx:GridViewColumnLayoutItem ColumnName="EmailAddress" Caption="Email Address"/>
                                   <dx:GridViewColumnLayoutItem ColumnName="PostalAddress2"  Caption="Postal Address2"/>
                                         <dx:GridViewColumnLayoutItem ColumnName="FaxNo"  Caption="FaxNo"/>
                                  <dx:GridViewColumnLayoutItem ColumnName="PhysicalCountry"  Caption="Physical Country"/>
                               <dx:GridViewColumnLayoutItem ColumnName="PostalCountry"  Caption="Postal Country"/>
                                   <dx:GridViewColumnLayoutItem ColumnName="PhysicalCity"  Caption="Physical City"/>
                              
                               <dx:GridViewColumnLayoutItem ColumnName="PostalCity"  Caption="postal City"/>
                                 
                              
                                         <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />
                                      
                                    </Items>
                        </dx:GridViewLayoutGroup>--%>

                    <dx:GridViewLayoutGroup Caption="Contact Details" ColCount="2" GroupBoxDecoration="None">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="PhoneNo" Caption="PhoneNo" />
                            <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress" Caption="Physical Address" />
                            <dx:GridViewColumnLayoutItem ColumnName="PhoneNo3" Caption="Mobile No" />
                            <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress2" Caption="Physical Address2" />
                            <dx:GridViewColumnLayoutItem ColumnName="EmailAddress" Caption="Email Address" />
                            <dx:GridViewColumnLayoutItem ColumnName="PostalAddress" Caption="Postal Address" />

                            <dx:GridViewColumnLayoutItem ColumnName="EmailAddress2" Caption="Email Address 2" />
                            <dx:GridViewColumnLayoutItem ColumnName="PostalAddress2" Caption="Postal Address2" />
                            <dx:GridViewColumnLayoutItem ColumnName="EmailAddress3" Caption="Email Address 3" />
                            <dx:GridViewColumnLayoutItem ColumnName="PhysicalCountry" Caption="Physical Country" />
                            <dx:GridViewColumnLayoutItem ColumnName="EmailAddress4" Caption="Email Address 4" />

                            <dx:GridViewColumnLayoutItem ColumnName="PhysicalCity" Caption="Physical City" />
                            <dx:GridViewColumnLayoutItem ColumnName="EmailStatement" Caption="EmailStatement" />
                            <dx:GridViewColumnLayoutItem ColumnName="PostalCountry" Caption="Postal Country" />
                            <dx:GridViewColumnLayoutItem ColumnName="HoldStatement" Caption="HoldStatement" />

                            <dx:GridViewColumnLayoutItem ColumnName="PostalCity" Caption="postal City" />

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




<asp:ObjectDataSource runat="server" ID="ObjectDataSourceCompanyEmployees" DataObjectTypeName="LastTrialGene.Models.ClientDetailsDataUpdate1" TypeName=" LastTrialGene.ClientsContext2.ClientsContext2"
    InsertMethod="NewClients"
    SelectMethod="GetClients"
    UpdateMethod="UpdateClients"></asp:ObjectDataSource>

<%-- UpdateMethod="UpdateClients"<asp:ObjectDataSource ID="CustodialGroup" runat="server" DataObjectTypeName=" LastTrialGene.Model.CustodialgroupMapper"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="getmapper"></asp:ObjectDataSource>--%>

<asp:ObjectDataSource ID="RiskRating" runat="server" DataObjectTypeName=" LastTrialGene.Model.RiskRating"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetRiskRating"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="SectorSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sector"
    TypeName=" LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetSector"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="ClientGroupSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.ClientGroup"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetClientGroup"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="SourceOfIncomeSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.SourceOfIncome"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetSourceOfIncome"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="BranchSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Branch"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetBranch"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="titleSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Salutationtype"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetTitle"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="SexSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sex"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetSex1"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="NationalitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sex"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetNationality"></asp:ObjectDataSource>


<asp:ObjectDataSource ID="IdentificationSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sex"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetIdentification"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="ObjectDataCustodialgroup" runat="server" DataObjectTypeName=" LastTrialGene.Model.Custodialgroup"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetCustodialGroup"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="CountrySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Country"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetCountry"></asp:ObjectDataSource>

<%-- <asp:ObjectDataSource ID="CitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
        TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
        SelectMethod="GetCity"></asp:ObjectDataSource>--%>


<%----/////////////////////////////Physical Country///////////////////////////////////-----%>

<asp:ObjectDataSource ID="AllCitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetCity"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="CitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetCity">
    <SelectParameters>
        <asp:Parameter Name="PhysicalCountry" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<%----////////////////////////////////////////////////////////////////-----%>


<%----/////////////////////////////Postal Country///////////////////////////////////-----%>
<asp:ObjectDataSource ID="AllCitySourcePost" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetCityPost"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="CitySourcePost" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetCityPost">
    <SelectParameters>
        <asp:Parameter Name="PostalCountry" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<%----////////////////////////////////////////////////////////////////-----%>


<asp:ObjectDataSource ID="InceptionDateSource" runat="server"
    TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
    SelectMethod="GetInceptionDate"></asp:ObjectDataSource>






