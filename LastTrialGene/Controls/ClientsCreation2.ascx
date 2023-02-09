<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClientsCreation2.ascx.cs" Inherits="LastTrialGene.Controls.ClientsCreation2" %>







    
    <%--<dx:ASPxGridView ID="grid" runat="server" DataSourceID="GridViewDataSource" CssClass="grid-view"
        KeyFieldName="ID" AutoGenerateColumns="False" OnRowUpdating="grid_RowUpdating"
        Width="100%" OnRowInserting="grid_RowInserting">  OnCellEditorInitialize="grid_CellEditorInitialize" --%>
     <dx:ASPxGridView runat="server" ID="GridView" ClientInstanceName="gridView"
        KeyFieldName="ID" EnablePagingGestures="False" SeparatorWidth="0"
        CssClass="grid-view" Width="100%"
        DataSourceID="ObjectDataSourceCompanyEmployees"
        OnCustomCallback="GridView_CustomCallback"
        OnInitNewRow="GridView_InitNewRow"
        PreviewFieldName="Name"  OnRowInserted="ASPxGridView1_RowInserted" onrowupdated="GridView_RowUpdated" OnRowValidating="grid_RowValidating" OnEditFormLayoutCreated="grid_EditFormLayoutCreated">
                  <clientsideevents
        EndCallback="function(s, e) {
                        if (s.cpUpdatedMessage) {
                            alert(s.cpUpdatedMessage);
                            delete s.cpUpdatedMessage;
                        }
                    }"
    />
                                  <clientsideevents
        EndCallback="function(s, e) {
                        if (s.cpInsertNote) {
                            alert(s.cpInsertNote);
                            delete s.cpInsertNote;
                        }
                    }"
    />
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="AllPages" VisibleIndex="0" Width="52"></dx:GridViewCommandColumn>

             <dx:GridViewDataTextColumn FieldName="ID" />
            <dx:GridViewDataTextColumn ReadOnly="true" FieldName="ClientNo" visible="false"  />
            <dx:GridViewDataTextColumn FieldName="Name" caption="First Name" Width="20%" />
                <dx:GridViewDataTextColumn FieldName="RegistrationOffice" visible="false"/>
            <dx:GridViewDataTextColumn FieldName="IncomeTaxNo" visible="false"/>
            
          

             <dx:GridViewDataTextColumn FieldName="PhoneNo" visible="false"/>
            <dx:GridViewDataTextColumn FieldName="PhoneNo2" visible="false" />
            <dx:GridViewDataTextColumn FieldName="PhoneNo3" visible="false"/>

              <dx:GridViewDataTextColumn FieldName="EmailAddress" visible="false" />
            <dx:GridViewDataTextColumn FieldName="FaxNo" visible="false"/>

            <dx:GridViewDataTextColumn FieldName="IdentificationNo" Width="20%"/>

            <dx:GridViewDataMemoColumn FieldName="PhysicalAddress" visible="false"/>
            <dx:GridViewDataMemoColumn FieldName="PhysicalAddress2" visible="false"/>

            <dx:GridViewDataMemoColumn FieldName="PostalAddress" visible="false"/>
            <dx:GridViewDataMemoColumn FieldName="PostalAddress2" visible="false"/>


            <dx:GridViewDataMemoColumn FieldName="SpecialInstructions" visible="false"/>

           
         <dx:GridViewDataCheckColumn FieldName="LedgerFee" visible="false"/>
         <dx:GridViewDataCheckColumn FieldName="IsFundAdmin" visible="false"/>
         <dx:GridViewDataCheckColumn FieldName="IsUSResident" visible="false"/>
         <dx:GridViewDataCheckColumn FieldName="ManagedClient" visible="false"/>
                    <dx:GridViewDataCheckColumn FieldName="HasUSGreenCard" visible="false"/>
                       <dx:GridViewDataCheckColumn FieldName="SendSMS" visible="false"/>
                    <dx:GridViewDataCheckColumn FieldName="WithholdingTaxStatus" visible="false"/>
                
                
        <dx:GridViewDataCheckColumn FieldName="Active" visible="false"/>
                
               <dx:GridViewDataCheckColumn FieldName="UpfrontFee" visible="false"/>
       
          
          

            

         <dx:GridViewDataDateColumn>  
              <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy"></PropertiesDateEdit>  
               </dx:GridViewDataDateColumn>
           
            <dx:GridViewDataComboBoxColumn  VisibleIndex="4" FieldName="PhysicalCity" Visible="false">
                <PropertiesComboBox   ValueField="PhysicalCity" TextField="city"   DataSourceID="CitySource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select City" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />   
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn  VisibleIndex="4" FieldName="PhysicalCountry" Visible="false">
                <PropertiesComboBox   ValueField="PhysicalCountry" TextField="country"   DataSourceID="CountrySource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Country" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />   
            </dx:GridViewDataComboBoxColumn>


              <dx:GridViewDataComboBoxColumn  VisibleIndex="4" FieldName="PostalCity" Visible="false">
                <PropertiesComboBox   ValueField="PostalCity" TextField="city"   DataSourceID="CitySource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select City" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />   
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn  VisibleIndex="4" FieldName="PostalCountry" Visible="false">
                <PropertiesComboBox   ValueField="PostalCountry" TextField="country"   DataSourceID="CountrySource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Country" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />   
            </dx:GridViewDataComboBoxColumn>




           
            <dx:GridViewDataComboBoxColumn  VisibleIndex="4" FieldName="ClientGroup" Visible="false">
                <PropertiesComboBox   ValueField="ClientGroup" TextField="Name"   DataSourceID="ClientGroupSource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Custodial Group" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />   
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn  VisibleIndex="4" FieldName="BranchID" Visible="false">
                <PropertiesComboBox   ValueField="BranchID" TextField="Name"   DataSourceID="BranchSource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Branch" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />   
            </dx:GridViewDataComboBoxColumn>
           

             <dx:GridViewDataComboBoxColumn  VisibleIndex="4" FieldName="IdentificationType" Visible="false">
                <PropertiesComboBox   ValueField="IdentificationType" TextField="Name"   DataSourceID="IdentificationSource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Identification Type" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />   
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn  VisibleIndex="4" FieldName="Sector" Visible="false">
                <PropertiesComboBox   ValueField="Sector" TextField="SectorName"   DataSourceID="SectorSource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Sector" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                
                 <EditFormSettings ColumnSpan="2" Visible="True" />   
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn  VisibleIndex="4" FieldName="IncomeType" Visible="false">
                <PropertiesComboBox   ValueField="IncomeType" TextField="Name"   DataSourceID="SourceOfIncomeSource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Income Type" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />   
            </dx:GridViewDataComboBoxColumn>





             <dx:GridViewDataComboBoxColumn  VisibleIndex="3" FieldName="CustodialGroup" Visible="true">              
                <PropertiesComboBox ValueField="CustodialGroup" TextField="Name"    DataSourceID="ObjectDataCustodialgroup">
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
                        <dx:GridViewLayoutGroup Caption="CounterParty Details" ColCount="2" GroupBoxDecoration="None">
                            <Items>
                                  <dx:GridViewColumnLayoutItem ColumnName="ClientNo"  Caption ="ClientNo" />
                                         <dx:GridViewColumnLayoutItem ColumnName="Name" Caption ="Entity Name" />
                                  <dx:GridViewColumnLayoutItem ColumnName="RegistrationOffice" Caption="Registration Office"/>
                                         <dx:GridViewColumnLayoutItem ColumnName="IdentificationType"/>
                                  <dx:GridViewColumnLayoutItem ColumnName="IncomeTaxNo" Caption="Income TaxNo"/>
                                        <dx:GridViewColumnLayoutItem ColumnName="IdentificationNo" Caption="Registration No"/>
                              
                              
                                     
                                  
                        
                                        <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />
                                    </Items>
                        </dx:GridViewLayoutGroup>

                        <dx:GridViewLayoutGroup Caption="Contact Details" ColCount="2" GroupBoxDecoration="None">
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
                        </dx:GridViewLayoutGroup>

                           <dx:GridViewLayoutGroup Caption="Investment Details" ColCount="2" GroupBoxDecoration="None">
                       <Items>
                                      <dx:GridViewColumnLayoutItem ColumnName="Sector" caption="Sector"/> 
                                         <dx:GridViewColumnLayoutItem ColumnName="IncomeType" caption="Source Of Income"/>           
                           <dx:GridViewColumnLayoutItem ColumnName="Active" caption="Active"/> 
                            <dx:GridViewColumnLayoutItem ColumnName="UpfrontFee" caption="UpfrontFee"/> 
                            <dx:GridViewColumnLayoutItem ColumnName="ManagedClient" caption="ManagedClient"/> 
                            <dx:GridViewColumnLayoutItem ColumnName="SendSMS" caption="SendSMS"/> 
                            <dx:GridViewColumnLayoutItem ColumnName="WithholdingTaxStatus" caption="WithholdingTaxStatus"/> 
                           <dx:GridViewColumnLayoutItem ColumnName="LedgerFee" caption="LedgerFee"/> 
                           <dx:GridViewColumnLayoutItem ColumnName="ClientGroup" caption="Client Group"/> 
                            <dx:GridViewColumnLayoutItem ColumnName="CustodialGroup" caption="CustodialGroup"/>
                       
                             <dx:GridViewColumnLayoutItem ColumnName="BranchID" caption="Branch"/>
                             <dx:GridViewColumnLayoutItem ColumnName="SpecialInstructions" caption="Special Instruction"/>



                            
            

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
        SelectMethod="GetRiskRating">
    </asp:ObjectDataSource>

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

  <asp:ObjectDataSource ID="CitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
        TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
        SelectMethod="GetCity"></asp:ObjectDataSource>

  <asp:ObjectDataSource ID="InceptionDateSource" runat="server"
        TypeName="LastTrialGene.ClientsContext2.ClientsContext2"
        SelectMethod="GetInceptionDate"></asp:ObjectDataSource>
  

   



