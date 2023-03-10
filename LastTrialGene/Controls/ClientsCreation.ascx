<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClientsCreation.ascx.cs" Inherits="LastTrialGene.Controls.ClientsCreation" %>


<%@ Register Src="~/widgets/DockPanel.ascx" TagPrefix="widget" TagName="DockPanel" %>





<style>
    /*.HasUSGreenCard {
    display:none;
    }
    */


    .vpane {
        width: 900px;
        float: left;
        margin-top: 0px;
        padding-top: 5px;
    }

    .dock {
        background-color: red !important;
        color: red !important;
    }
</style>

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

    /**==========================CallBacks============================== */

    /**==========================CallBacks============================== */





    /* function OnGIBleedingValueChanged(s, e) {
         if (s.GetValue() == true) {
             grid.GetMainElement().getElementsByClassName(flContainer)[0].style.visibility = "none";

         }
     }*/

    /**
   
    function OnCheckedChanged(s, e) {
        var value = grid.GetEditor("ee").PerformCallback()

    }*/

        //var allowEdit = false;
        //function OnEditing(s, e) {
        //    e.cancel = allowEdit;
        //}

        //function OnAllowEditChanged(s, e) {
        //    allowEdit = s.GetValue();
        //}


    /* function OnGIBleedingValueChanged(s, e) {
         var group = fl.GetItemByName('Versandkosten');
         group.SetVisible(!(s.GetText() == 'A'));
         */
          //  grid.GetMainElement().getElementsByClassName("flContainer")[0].style.visibility = "none";
    /*   if (s.GetValue() == true) {
           // grid.GetMainElement().getElementsByClassName("flContainer")[0].style.visibility = "";
           //  else
           grid.GetMainElement().getElementsByClassName("flContainer")[0].style.visibility = "none";
   }*/
      //  }

    </script>





<%--<dx:ASPxGridView ID="grid" runat="server" DataSourceID="GridViewDataSource" CssClass="grid-view"
        KeyFieldName="ID" AutoGenerateColumns="False" OnRowUpdating="grid_RowUpdating"
        Width="100%" OnRowInserting="grid_RowInserting">  OnCellEditorInitialize="grid_CellEditorInitialize" --%>


<dx:ASPxDockPanel CssClass="vpane" runat="server" ID="DateTimePanel" PanelUID="DateTime" HeaderText="Gsam Trial Version"
    Left="820" Top="220" ClientInstanceName="dateTimePanel" Width="230px">
    <ClientSideEvents EndDragging="function(s, e) { DXEventMonitor.Trace(s, e, 'EndDragging_for_Panel'); }" Init="function(s, e) { if(1==1){s.SetVisible(false)} }" />
    <ContentCollection>
        <dx:PopupControlContentControl CssClass="dock">
            <widget:DockPanel runat="server" ID="DockPanel" />
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxDockPanel>

<dx:ASPxGridView runat="server" ID="GridView" ClientInstanceName="gridView"
    KeyFieldName="ID" EnablePagingGestures="False" SeparatorWidth="0"
    CssClass="grid-view" Width="100%"
    DataSourceID="ObjectDataSourceCompanyEmployees"
    OnCustomCallback="GridView_CustomCallback"
    OnInitNewRow="GridView_InitNewRow"
    PreviewFieldName="Name" OnInit="Grid_Init" OnCustomUnboundColumnData="Grid_CustomUnboundColumnData" OnCellEditorInitialize="grid_CellEditorInitialize" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="GridView_RowUpdated" OnRowValidating="grid_RowValidating" OnEditFormLayoutCreated="grid_EditFormLayoutCreated">
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
    <%--                          <clientsideevents
        EndCallback="function(s, e) {
                        if (s.cpInsertNote) {
                            alert(s.cpInsertNote);
                            delete s.cpInsertNote;
                        }
                    }"
    />--%>



    <Columns>
        <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="AllPages" VisibleIndex="0" Width="52"></dx:GridViewCommandColumn>

        <dx:GridViewDataTextColumn Visible="false" ReadOnly="true" FieldName="ID" />

        <dx:GridViewDataTextColumn ReadOnly="false" FieldName="ClientNo" Caption="ClientNo" Width="20%" />

        <dx:GridViewDataTextColumn FieldName="Name" Caption="First Name" Width="20%" />
        <dx:GridViewDataTextColumn FieldName="Name2" Caption="Middle Name" Width="20%" />
        <dx:GridViewDataTextColumn FieldName="Name3" Caption="Surname" Width="20%" />



        <dx:GridViewDataTextColumn FieldName="GovRegNo" Visible="false" Width="20%" />

        <dx:GridViewDataTextColumn FieldName="PhoneNo">
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

        <dx:GridViewDataTextColumn FieldName="EmailAddress" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="EmailAddress3" Visible="false" >
            <PropertiesTextEdit HelpText="You can leave this form field unfilled">
             <HelpTextSettings DisplayMode="Popup" />
            </PropertiesTextEdit>

        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="EmailAddress4" Visible="false">
            <PropertiesTextEdit HelpText="You can leave this form field unfilled">
             <HelpTextSettings DisplayMode="Popup" />
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="FaxNo" Visible="false" />

        <%-- <dx:GridViewDataTextColumn FieldName="contactEmail2" visible="false"/>
            <dx:GridViewDataTextColumn FieldName="contactEmail3" visible="false"/>
            <dx:GridViewDataTextColumn FieldName="contactEmail4" visible="false"/>--%>



        <dx:GridViewDataTextColumn FieldName="IdentificationNo" Width="20%" />

        <dx:GridViewDataMemoColumn FieldName="PhysicalAddress" Visible="false" />

        <dx:GridViewDataMemoColumn FieldName="PhysicalAddress2" Visible="false">
         <PropertiesMemoEdit HelpText="You can leave this form field unfilled if N/A">
             <HelpTextSettings DisplayMode="Popup" />
            </PropertiesMemoEdit>
        </dx:GridViewDataMemoColumn>

        <dx:GridViewDataMemoColumn FieldName="PostalAddress" Visible="false" />
        <dx:GridViewDataMemoColumn FieldName="PostalAddress2" Visible="false">
                        <PropertiesMemoEdit HelpText="You can leave this form field unfilled if N/A">
             <HelpTextSettings DisplayMode="Popup" />
            </PropertiesMemoEdit>
        </dx:GridViewDataMemoColumn>

        <dx:GridViewDataTextColumn FieldName="EmployerName" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="EmployerPhoneNo" Visible="false" />






        <dx:GridViewDataTextColumn FieldName="EstimatedAnnualSales" Visible="false">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ValidationExpression="^\d+(\.\d{1,5})?$" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>

        <dx:GridViewDataSpinEditColumn PropertiesSpinEdit-NumberType="Integer" FieldName="EstimatedTransPerMonth" Visible="false" />
        <dx:GridViewDataSpinEditColumn PropertiesSpinEdit-NumberType="Integer" FieldName="AnticipatedTransPerMonth" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="AnticipatedTotalAmount" Visible="false">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ValidationExpression="^\d+(\.\d{1,5})?$" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>

        <dx:GridViewDataTextColumn FieldName="VFXNumber" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="ZSENumber" Visible="false" />


        <%-- <dx:GridViewDataTextColumn FieldName="TMONAcc" visible="false"/>--%>
        <dx:GridViewDataTextColumn FieldName="EmailAddress3" Visible="false" />
        <dx:GridViewDataTextColumn FieldName="EmailAddress4" Visible="false" />

        <dx:GridViewDataMemoColumn FieldName="EmployerPhysicalAddress" Visible="false" />
        <dx:GridViewDataMemoColumn FieldName="EmployerPhysicalAddress2" Visible="false" />

        <dx:GridViewDataMemoColumn FieldName="EmployerPostalAddress" Visible="false" />
        <dx:GridViewDataMemoColumn FieldName="EmployerPostalAddress2" Visible="false" />

        <dx:GridViewDataMemoColumn FieldName="SpecialInstructions" Visible="false" />


        <dx:GridViewDataCheckColumn FieldName="LedgerFee" Visible="false" />
        <dx:GridViewDataCheckColumn FieldName="IsFundAdmin" Visible="false" />

        <dx:GridViewDataCheckColumn FieldName="EmailStatement" Visible="false" />
        <dx:GridViewDataCheckColumn FieldName="HoldStatement" Visible="false" />


        <%-- <dx:GridViewDataCheckColumn FieldName="IsUSResident" visible="false"/>--%>
        <dx:GridViewDataCheckColumn FieldName="ManagedClient" Visible="false" />

        <dx:GridViewDataCheckColumn FieldName="HasUSGreenCard" Visible="false">
            <PropertiesCheckEdit>
            </PropertiesCheckEdit>
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="SendSMS" Visible="false" />
        <dx:GridViewDataCheckColumn FieldName="WithholdingTaxStatus" Visible="false" />


        <dx:GridViewDataCheckColumn FieldName="Active" Visible="false" />
        <dx:GridViewDataCheckColumn FieldName="VAT" Visible="false" />

        <dx:GridViewDataCheckColumn FieldName="UpfrontFee" Visible="false" />


        <%-- <dx:GridViewDataComboBoxColumn FieldName="DualCit" VisibleIndex="27">  
    <PropertiesComboBox FieldName="DualCit" EnableFocusedStyle="False"  
        HelpText="GI bleeding (visible blood) (Y/N)" NullDisplayText=" "  
        NullText="Select...">  
        <HelpTextSettings DisplayMode="Popup" Position="Top">  
        </HelpTextSettings>  
        <ClientSideEvents ValueChanged="OnGIBleedingValueChanged" />  
    </PropertiesComboBox>  
</dx:GridViewDataComboBoxColumn>  --%>



        <%--  <dx:GridViewDataCheckColumn Caption="DualCit" FieldName="DualCit" VisibleIndex="15" Visible="false" EditFormSettings-Visible="True">  
                                    <PropertiesCheckEdit>  
                                   
                                        <ClientSideEvents ValueChanged="OnGIBleedingValueChanged"/>
                                    </PropertiesCheckEdit>  
                                </dx:GridViewDataCheckColumn>  --%>

        <%-- <ClientSideEvents CheckedChanged="OnCheckChanged(s,e)"/> --%>

        <%-- <dx:GridViewDataCheckColumn FieldName="DualCit" visible="false"/>

      <dx:GridViewDataCheckColumn FieldName="DualCit">  
                    <DataItemTemplate>  
                        <dx:ASPxCheckBox  ID="ASPxCheckBox1" runat="server" Checked='true'  OnInit="ASPxCheckBox1_Init">  
                        </dx:ASPxCheckBox>       
                    </DataItemTemplate>                    
                </dx:GridViewDataCheckColumn>--%>

        <%--  <dx:GridViewDataCheckColumn VisibleIndex="4" FieldName="DualCit" Visible="false">
                <PropertiesCheckEdit>
                <ClientSideEvents CheckedChanged="OnAllowEditChanged" />
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>--%>






        <dx:GridViewDataDateColumn FieldName="InceptionDate">
            <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Inception Date" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>

        <dx:GridViewDataDateColumn FieldName="DateOfBirth">
            <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select DateOfBirth" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>

        <%-- <dx:GridViewDataDateColumn FieldName="ExpiryDate" >  
              <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy"></PropertiesDateEdit>  
               </dx:GridViewDataDateColumn>

            <dx:GridViewDataDateColumn FieldName="CreationDate" >  
              <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy"></PropertiesDateEdit>  
               </dx:GridViewDataDateColumn>--%>

        <%--<dx:GridViewDataDateColumn FieldName="empdate2" >  
              <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy"></PropertiesDateEdit>  
               </dx:GridViewDataDateColumn>--%>



        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="SalutationType" Visible="false">
            <PropertiesComboBox ValueField="SalutationType" TextField="Name" DataSourceID="titleSource" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Title" />
                </ValidationSettings>
                <ClientSideEvents SelectedIndexChanged="title_SelectedIndexChanged" />
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="Nationality" Visible="false">
            <PropertiesComboBox ShowImageInEditBox="True" ImageUrlField="imgUrl" ValueField="Nationality" TextField="Name" DataSourceID="NationalitySource" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Country" />
                </ValidationSettings>
                <ItemImage Height="20px" Width="28px" />
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>


        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="Citizenship" Visible="false">
            <PropertiesComboBox ShowImageInEditBox="True" ImageUrlField="imgUrl" ValueField="Citizenship" TextField="Name" DataSourceID="NationalitySource" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Country" />
                </ValidationSettings>
                <ItemImage Height="20px" Width="28px" />
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="Citizenship2" Visible="false">
            <PropertiesComboBox ShowImageInEditBox="True" ImageUrlField="imgUrl" ValueField="Citizenship2" TextField="Name" DataSourceID="NationalitySource" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                <%--<ValidationSettings>  
                     <RequiredField IsRequired="true" ErrorText="Select Country" />  
                    </ValidationSettings>--%>
                <ItemImage Height="20px" Width="28px" />
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>



        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="PhysicalCountry" Visible="false">
            <PropertiesComboBox ShowImageInEditBox="True" ImageUrlField="imgUrl" ValueField="PhysicalCountry" TextField="country" DataSourceID="CountrySource" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
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
            <PropertiesComboBox ShowImageInEditBox="True" ImageUrlField="imgUrl" ValueField="PostalCountry" TextField="country" DataSourceID="CountrySource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Country" />
                </ValidationSettings>
                <ClientSideEvents SelectedIndexChanged="PostCountriesCombo_SelectedIndexChanged" />
                <ItemImage Height="20px" Width="28px" />
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="IsUSResident" Visible="false">
            <PropertiesComboBox ShowImageInEditBox="True" ImageUrlField="imgUrl" ValueField="IsUSResident" TextField="country" DataSourceID="CountrySource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Employer  Physical Country" />
                </ValidationSettings>
                <ItemImage Height="20px" Width="28px" />
                <ClientSideEvents Init="function(s, e){ 
                gridView.GetMainElement().getElementsByClassName('HasUSGreenCard')[0].style.visibility ='hidden';
                   gridView.GetMainElement().getElementsByClassName('citizen2')[0].style.visibility ='hidden';
                }" />
                <ClientSideEvents ValueChanged="function(s, e) {  
                                         if(s.GetText()=='USA'){
                                gridView.GetMainElement().getElementsByClassName('HasUSGreenCard')[0].style.visibility ='visible';
		                                     }else{ gridView.GetMainElement().getElementsByClassName('HasUSGreenCard')[0].style.visibility ='hidden';} 
     
        }" />
                        <ItemImage Height="20px" Width="28px" />
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>



        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="EmployerPhysicalCountry" Visible="false">
            <PropertiesComboBox ValueField="EmployerPhysicalCountry" TextField="country" DataSourceID="CountrySource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Employer  Physical Country" />
                </ValidationSettings>
                <ClientSideEvents SelectedIndexChanged="EmpCountriesCombo_SelectedIndexChanged" />
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="EmployerPhysicalCity" Visible="false">
            <PropertiesComboBox ValueField="EmployerPhysicalCity" TextField="city" DataSourceID="AllCitySourceEmp">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Employer Physical City" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="PostalCity" Visible="false">
            <PropertiesComboBox ValueField="PostalCity" TextField="city" DataSourceID="CitySourcePost">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select City" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="PostalCountry" Visible="false">
            <PropertiesComboBox ImageUrlField="imgUrl" ValueField="PostalCountry" TextField="country" DataSourceID="CountrySource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Country" />
                </ValidationSettings>
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

        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="IncomeSource" Visible="false">
            <PropertiesComboBox ValueField="IncomeSource" TextField="Name" DataSourceID="SourceOfIncomeSource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Income Type" />
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



        <dx:GridViewDataComboBoxColumn VisibleIndex="4" FieldName="SexType" Visible="true">
            <PropertiesComboBox ValueField="SexType" TextField="SexName" DataSourceID="SexSource">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Sex" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataComboBoxColumn>


        <dx:GridViewDataComboBoxColumn VisibleIndex="3" FieldName="ClientRisk" Visible="true">

            <PropertiesComboBox ShowImageInEditBox="True" ImageUrlField="imgUrl" ValueField="ClientRisk" TextField="RiskName" DataSourceID="RiskRating">
                <ValidationSettings>
                    <RequiredField IsRequired="true" ErrorText="Select Risk" />
                </ValidationSettings>
                <ItemImage Height="20px" Width="28px" />
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

                            <dx:GridViewColumnLayoutItem ColumnName="AutoGene" Caption="Auto Generate" />
                            <dx:GridViewColumnLayoutItem ColumnName="SalutationType" Caption="Title" />

                            <dx:GridViewColumnLayoutItem ColumnName="Nationality" Caption="Nationality" />

                            <dx:GridViewColumnLayoutItem ColumnName="Name" />


                            <dx:GridViewColumnLayoutItem ColumnName="Citizenship" Caption="Citizenship" />


                            <dx:GridViewColumnLayoutItem ColumnName="Name2" Caption="Middle Name" />
                            <dx:GridViewColumnLayoutItem ColumnName="InceptionDate" Caption="Inception Date" />

                            <dx:GridViewColumnLayoutItem ColumnName="Name3" Caption="Surname" />
                            <dx:GridViewColumnLayoutItem ColumnName="GovRegNo" Caption="Gov RegNo" />
                            <dx:GridViewColumnLayoutItem ColumnName="SexType" Caption="Gender" />
                            <dx:GridViewColumnLayoutItem ColumnName="DateOfBirth" Caption="DateOfBirth" />

                            <dx:GridViewColumnLayoutItem ColumnName="IdentificationType" />

                            <dx:GridViewColumnLayoutItem Visible="true" ColumnName="DualCit" Caption="Dual Citizeship" />
                            <dx:GridViewColumnLayoutItem ColumnName="IdentificationNo" />



                            <dx:GridViewColumnLayoutItem CssClass="citizen2" ColumnName="Citizenship2" Caption="Citizenship" />



                            <dx:GridViewColumnLayoutItem ColumnName="IsUSResident" Caption="US Resident" />

                            <%--<dx:GridViewColumnLayoutItem ColumnName="USResident" caption="US Resident kk"/>--%>
                            <dx:GridViewColumnLayoutItem CssClass="HasUSGreenCard" ColumnName="HasUSGreenCard" Caption="Green Card Holder">
                                <%--<CaptionStyle CssClass="flContainer"></CaptionStyle>--%>
                            </dx:GridViewColumnLayoutItem>

                            <%--   <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />--%>
                        </Items>
                    </dx:GridViewLayoutGroup>



                    <dx:GridViewLayoutGroup Caption="Investment Details" ColCount="2" GroupBoxDecoration="None">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="Sector" Caption="Sector" />



                            <dx:GridViewColumnLayoutItem ColumnName="WithholdingTaxStatus" Caption="Withholdings Tax" />

                            <dx:GridViewColumnLayoutItem ColumnName="IncomeSource" Caption="Source Of Income" />


                            <dx:GridViewColumnLayoutItem ColumnName="LedgerFee" Caption="Ledger Fee" />
                            <dx:GridViewColumnLayoutItem ColumnName="ClientRisk" />

                            <dx:GridViewColumnLayoutItem ColumnName="ManagedClient" Caption="Managed" />
                            <dx:GridViewColumnLayoutItem ColumnName="CustodialGroup" Caption="CustodialGroup" />


                            <dx:GridViewColumnLayoutItem ColumnName="SendSMS" Caption="Send SMS Message" />

                            <dx:GridViewColumnLayoutItem ColumnName="ClientGroup" Caption="Client Group" />


                            <dx:GridViewColumnLayoutItem ColumnName="WithdrawFrequency" Caption="Withdrawal Frequency" />

                            <dx:GridViewColumnLayoutItem ColumnName="BranchID" Caption="Branch" />


                            <dx:GridViewColumnLayoutItem ColumnName="IncomeType" Caption="Income Type" />

                            <dx:GridViewColumnLayoutItem ColumnName="SpecialInstructions" Caption="Special Instruction" />
                            <dx:GridViewColumnLayoutItem ColumnName="RelationShipManager" Caption="RelationShip Manager" />


                            <dx:GridViewColumnLayoutItem ColumnName="Active" Caption="Active" />


                            <dx:GridViewColumnLayoutItem ColumnName="TMONAcc" Caption="T-MON Account" />
                            <dx:GridViewColumnLayoutItem ColumnName="UpfrontFee" Caption="Upfront Fee" />

                            <dx:GridViewColumnLayoutItem ColumnName="ZSENumber" Caption="ZSE Account Number" />

                            <dx:GridViewColumnLayoutItem ColumnName="VAT" Caption="VAT" />

                            <dx:GridViewColumnLayoutItem ColumnName="VFXNumber" Caption="VFX Account Number" />







                            <%--   <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />--%>
                        </Items>
                    </dx:GridViewLayoutGroup>

                    <dx:GridViewLayoutGroup Caption="Financial Declaration" ColCount="2" GroupBoxDecoration="None">
                        <Items>

                            <dx:GridViewColumnLayoutItem CssClass="EstimatedAnnualSales" ColumnName="EstimatedAnnualSales" Caption="Estimated Annual Sales" />
                            <dx:GridViewColumnLayoutItem ColumnName="EstimatedTransPerMonth" Caption="Estimated Trxn per/Month" />
                            <dx:GridViewColumnLayoutItem ColumnName="AnticipatedTransPerMonth" Caption="Anticipated No of Trans per month" />
                            <dx:GridViewColumnLayoutItem ColumnName="AnticipatedTotalAmount" Caption="Anticipated Total Amount" />




                            <%--   <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />--%>
                        </Items>
                    </dx:GridViewLayoutGroup>

                    <dx:GridViewLayoutGroup Caption="Contact Details" ColCount="2" GroupBoxDecoration="None">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="PhoneNo" Caption="PhoneNo" />
                            <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress" Caption="Physical Address" />
                            <dx:GridViewColumnLayoutItem ColumnName="PhoneNo3" Caption="Mobile No" />
                            <dx:GridViewColumnLayoutItem ColumnName="PhysicalAddress2" Caption="Physical Address2" />
                            <dx:GridViewColumnLayoutItem ColumnName="EmailAddress" Caption="Email Address" />
                            <dx:GridViewColumnLayoutItem ColumnName="PostalAddress" Caption="Postal Address" />

                            <dx:GridViewColumnLayoutItem ColumnName="contactEmail2" Caption="Email Address 2" />
                            <dx:GridViewColumnLayoutItem ColumnName="PostalAddress2" Caption="Postal Address2" />
                            <dx:GridViewColumnLayoutItem ColumnName="EmailAddress3" Caption="Email Address 3" />
                            <dx:GridViewColumnLayoutItem ColumnName="PhysicalCountry" Caption="Physical Country" />
                            <dx:GridViewColumnLayoutItem ColumnName="EmailAddress4" Caption="Email Address 4" />

                            <dx:GridViewColumnLayoutItem ColumnName="PhysicalCity" Caption="Physical City" />
                            <dx:GridViewColumnLayoutItem ColumnName="EmailStatement" Caption="Email Statement" />
                            <dx:GridViewColumnLayoutItem ColumnName="PostalCountry" Caption="Postal Country" />
                            <dx:GridViewColumnLayoutItem ColumnName="HoldStatement" Caption="Hold Statement" />

                            <dx:GridViewColumnLayoutItem ColumnName="PostalCity" Caption="postal City" />

                            <%-- <dx:GridViewColumnLayoutItem ColumnName="PhoneNo2" Caption="PhoneNo 2"/>--%>








                            <%--   <dx:GridViewColumnLayoutItem ColumnName="FaxNo"  Caption="FaxNo"/>--%>



                            <%--<dx:GridViewColumnLayoutItem ColumnName="InceptionDate" Caption="InceptionDate"/>
                                 <dx:GridViewColumnLayoutItem ColumnName="DateOfBirth" Caption="Date Of Birth"/>--%>


                            <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />

                        </Items>
                    </dx:GridViewLayoutGroup>


                    <%--       <dx:GridViewLayoutGroup Caption="Add Employment Details" ColCount="2" GroupBoxDecoration="None">
                          <Items>
                                        <dx:GridViewColumnLayoutItem ColumnName="EmployerName" Caption="Name"/>
                               <dx:GridViewColumnLayoutItem ColumnName="EmployerPhysicalCountry" Caption="Physical Country"/>
                                         <dx:GridViewColumnLayoutItem ColumnName="EmployerPhoneNo" Caption="Phone No"/>
                               <dx:GridViewColumnLayoutItem ColumnName="EmployerPhysicalCity" Caption="Physical City"/>
                                  <dx:GridViewColumnLayoutItem ColumnName="EmailAddress3" Caption="Work Email"/>
                                         
                                         <dx:GridViewColumnLayoutItem ColumnName="EmployerPhysicalAddress" Caption="Physical Address"/>
                                <dx:GridViewColumnLayoutItem ColumnName="EmailAddress4" Caption="HR Email"/>

                                        <dx:GridViewColumnLayoutItem ColumnName="EmployerPhysicalAddress2" Caption="Physical Address2"/>

                             
                                       

                              <dx:GridViewColumnLayoutItem ColumnName="EmployerPostalAddress" Caption="Postal Address"/>
                            

                                        <dx:GridViewColumnLayoutItem ColumnName="EmployerPostalAddress2" Caption="Postal Address2"/>

                                   <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />
                               
                                        
                                        
                                      
                                    </Items>
                        </dx:GridViewLayoutGroup>--%>
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

<asp:ObjectDataSource ID="SexSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sex"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetSex1"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="NationalitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sex"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetNationality"></asp:ObjectDataSource>


<asp:ObjectDataSource ID="IdentificationSource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Sex"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetIdentification"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="ObjectDataCustodialgroup" runat="server" DataObjectTypeName=" LastTrialGene.Model.Custodialgroup"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetCustodialGroup"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="CountrySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.Country"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetCountry"></asp:ObjectDataSource>

<%----/////////////////////////////Physical Country///////////////////////////////////-----%>

<asp:ObjectDataSource ID="AllCitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetCity"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="CitySource" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetCity">
    <SelectParameters>
        <asp:Parameter Name="PhysicalCountry" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<%----////////////////////////////////////////////////////////////////-----%>


<%----/////////////////////////////Postal Country///////////////////////////////////-----%>
<asp:ObjectDataSource ID="AllCitySourcePost" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetCityPost"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="CitySourcePost" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetCityPost">
    <SelectParameters>
        <asp:Parameter Name="PostalCountry" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<%----////////////////////////////////////////////////////////////////-----%>


<%----/////////////////////////////Emp Country///////////////////////////////////-----%>
<asp:ObjectDataSource ID="AllCitySourceEmp" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetCityEmp"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="CitySourceEmp" runat="server" DataObjectTypeName=" LastTrialGene.Model.City"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetCityEmp">
    <SelectParameters>
        <asp:Parameter Name="EmployerPhysicalCountry" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<%----////////////////////////////////////////////////////////////////-----%>



<asp:ObjectDataSource ID="InceptionDateSource" runat="server"
    TypeName=" LastTrialGene.Code.ClientsContext"
    SelectMethod="GetInceptionDate"></asp:ObjectDataSource>






