<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClientsCreation.ascx.cs" Inherits="LastTrialGene.Controls.ClientsCreation" %>


<asp:ScriptManager runat="server" ID="ClientsCreation1" EnablePageMethods="true" />
    <%--<dx:ASPxGridView ID="grid" runat="server" DataSourceID="GridViewDataSource" CssClass="grid-view"
        KeyFieldName="ID" AutoGenerateColumns="False" OnRowUpdating="grid_RowUpdating"
        Width="100%" OnRowInserting="grid_RowInserting">--%>
     <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" Width="100%" DataSourceID="ObjectDataSourceCompanyEmployees" ClientInstanceName="clientGrid"
        KeyFieldName="ID" PreviewFieldName="Name" OnRowValidating="grid_RowValidating" OnEditFormLayoutCreated="grid_EditFormLayoutCreated" OnCellEditorInitialize="grid_CellEditorInitialize">
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true" ShowDeleteButton="true" />
             <dx:GridViewDataTextColumn FieldName="ID" />
            <dx:GridViewDataTextColumn FieldName="Name" />
             <dx:GridViewDataTextColumn FieldName="Name2" />
            <dx:GridViewDataTextColumn FieldName="Name3" />

             <dx:GridViewDataTextColumn FieldName="PhoneNo" visible="false"/>
            <dx:GridViewDataTextColumn FieldName="PhoneNo2" visible="false" />
            <dx:GridViewDataTextColumn FieldName="PhoneNo3" visible="false"/>

              <dx:GridViewDataTextColumn FieldName="EmailAddress" visible="false" />
            <dx:GridViewDataTextColumn FieldName="FaxNo" visible="false"/>

            <dx:GridViewDataTextColumn FieldName="IdentificationNo" />

            <dx:GridViewDataMemoColumn FieldName="PhysicalAddress" visible="false"/>
            <dx:GridViewDataMemoColumn FieldName="PhysicalAddress2" visible="false"/>

            <dx:GridViewDataMemoColumn FieldName="PostalAddress" visible="false"/>
            <dx:GridViewDataMemoColumn FieldName="PostalAddress2" visible="false"/>

             <dx:GridViewDataTextColumn FieldName="EmployerName" visible="false"/>
             <dx:GridViewDataTextColumn FieldName="EmployerPhoneNo" visible="false"/>

              <dx:GridViewDataTextColumn FieldName="EmailAddress3" visible="false"/>
             <dx:GridViewDataTextColumn FieldName="EmailAddress4" visible="false"/>

             <dx:GridViewDataMemoColumn FieldName="EmployerPhysicalAddress" visible="false"/>
             <dx:GridViewDataMemoColumn FieldName="EmployerPhysicalAddress2" visible="false"/>
           

          <%--<dx:GridViewDataDateColumn FieldName="InceptionDate" >  
              <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy"></PropertiesDateEdit>  
               </dx:GridViewDataDateColumn>--%>
           

           

           

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



            <dx:GridViewDataComboBoxColumn  VisibleIndex="4" FieldName="SexType" Visible="true">
                <PropertiesComboBox   ValueField="SexType" TextField="SexName"   DataSourceID="SexSource">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Sex" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />   
            </dx:GridViewDataComboBoxColumn>


             <dx:GridViewDataComboBoxColumn  VisibleIndex="3" FieldName="ClientRisk" Visible="true">
                
                <PropertiesComboBox ValueField="ClientRisk" TextField="RiskName"    DataSourceID="RiskRating">
                    <ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Risk" />  
                    </ValidationSettings>
                </PropertiesComboBox>
                 <EditFormSettings ColumnSpan="2" Visible="True" />  
            </dx:GridViewDataComboBoxColumn>

        </Columns>
        <Settings ShowPreview="true" />
        <SettingsPager PageSize="5" />
        <EditFormLayoutProperties AlignItemCaptionsInAllGroups="true">
            <Items>
                <dx:GridViewTabbedLayoutGroup>
                    <Items>
                        <dx:GridViewLayoutGroup ColumnCount="2" Caption="Counterparty Details">
                            <Items>
                                <dx:GridViewLayoutGroup GroupBoxDecoration="None" Paddings-PaddingBottom="0">
                                    <Items>
                                         <dx:GridViewColumnLayoutItem ColumnName="Name" />
                                         <dx:GridViewColumnLayoutItem ColumnName="IdentificationType"/>
                                        <dx:GridViewColumnLayoutItem ColumnName="IdentificationNo"/>
                                        <dx:GridViewColumnLayoutItem ColumnName="ClientRisk"/>
                                         <dx:GridViewColumnLayoutItem ColumnName="Name2" caption="Middle Name"/>
                                        <dx:GridViewColumnLayoutItem ColumnName="Name3" caption="Surname"/>   
                                        <dx:GridViewColumnLayoutItem ColumnName="SexType" caption="Gender"/>  
                                      
                                    </Items>
                                </dx:GridViewLayoutGroup>
                             
                            </Items>
                        </dx:GridViewLayoutGroup>

                         <dx:GridViewLayoutGroup ColumnCount="2" Caption="Contact Details">
                            <Items>
                                <dx:GridViewLayoutGroup GroupBoxDecoration="None" Paddings-PaddingBottom="0">
                                    <Items>
                                         <dx:GridViewColumnLayoutItem ColumnName="PhoneNo" Caption="PhoneNo" />
                                        <dx:GridViewColumnLayoutItem ColumnName="PhoneNo2" Caption="PhoneNo 2"/>
                                         <dx:GridViewColumnLayoutItem ColumnName="PhoneNo3"  Caption="Mobile No"/>

                                        <dx:GridViewColumnLayoutItem ColumnName="EmailAddress" Caption="Email Address"/>
                                         <dx:GridViewColumnLayoutItem ColumnName="FaxNo"  Caption="FaxNo"/>

                                        <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress" Caption="Physical Address"/>
                                         <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress2"  Caption="Physical Address2"/>
                                        <dx:GridViewColumnLayoutItem ColumnName="PostalAddress" Caption="Postal Address"/>
                                         <dx:GridViewColumnLayoutItem ColumnName="PostalAddress2"  Caption="Postal Address2"/>
                                        
                                      
                                    </Items>
                                </dx:GridViewLayoutGroup>
                               
                            </Items>
                        </dx:GridViewLayoutGroup>


                         <dx:GridViewLayoutGroup ColumnCount="2" Caption="Investment Details">
                            <Items>
                                <dx:GridViewLayoutGroup GroupBoxDecoration="None" Paddings-PaddingBottom="0">
                                    <Items>
                                      <dx:GridViewColumnLayoutItem ColumnName="Sector" caption="Sector"/> 
                                         <dx:GridViewColumnLayoutItem ColumnName="IncomeType" caption="IncomeType"/> 
                                        
                                      
                                    </Items>
                                </dx:GridViewLayoutGroup>
                               
                            </Items>
                        </dx:GridViewLayoutGroup>

                        <dx:GridViewLayoutGroup ColumnCount="2" Caption="Add Employment Details">
                            <Items>
                                <dx:GridViewLayoutGroup GroupBoxDecoration="None" Paddings-PaddingBottom="0">
                                    <Items>
                                        <dx:GridViewColumnLayoutItem ColumnName="EmployerName" Caption="Name"/>
                                         <dx:GridViewColumnLayoutItem ColumnName="EmployerPhoneNo" Caption="Phone No"/>
                                         
                                         <dx:GridViewColumnLayoutItem ColumnName="EmployerPhysicalAddress" Caption="Physical Address"/>
                                        <dx:GridViewColumnLayoutItem ColumnName="EmployerPhysicalAddress2" Caption="Physical Address2"/>
                                          <dx:GridViewColumnLayoutItem ColumnName="EmailAddress3" Caption="Work Email"/>
                                        <dx:GridViewColumnLayoutItem ColumnName="EmailAddress4" Caption="HR Email"/>
                                        <%-- <dx:GridViewColumnLayoutItem ColumnName="InceptionDate" Caption="Start of Employment"/>
                                        <dx:GridViewColumnLayoutItem ColumnName="InceptionDate" Caption="End of Employment"/>--%>


                                        
                                        
                                      
                                    </Items>
                                </dx:GridViewLayoutGroup>
                               
                            </Items>
                        </dx:GridViewLayoutGroup>

                      
                    </Items>
                </dx:GridViewTabbedLayoutGroup>
                <dx:EditModeCommandLayoutItem HorizontalAlign="Right" Paddings-PaddingBottom="0" />
            </Items>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
        </EditFormLayoutProperties>
    </dx:ASPxGridView>

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
        SelectMethod="GetRiskRating">
    </asp:ObjectDataSource>

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
        SelectMethod="GetSex1"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="NationalitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sex"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetNationality"></asp:ObjectDataSource>


     <asp:ObjectDataSource ID="IdentificationSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sex"
        TypeName=" LastTrialGene.Code.ClientsContext"
        SelectMethod="GetIdentification"></asp:ObjectDataSource>
