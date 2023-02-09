<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="LastTrialGene.Search" %>
<%@ Register Src="~/Controls/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftPanelContent" runat="server">
        <br />
<uc1:SideBar runat="server" id="SideBar" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightPanelContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageToolbar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageContent" runat="server">

      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <dx:ASPxFormLayout ID="flSearch" runat="server" Width="100%">
                        <Items>
                            <dx:LayoutGroup Caption="Search Details" ColSpan="1">
                                <Items>
                                    <dx:LayoutItem ColSpan="1" Caption="Search" Width="100%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxButtonEdit runat="server" ID="txtSearch" Width="100%" OnButtonClick="txtSearch_ButtonClick" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged">
                                                    <Buttons>
                                                        <dx:EditButton>
                                                            <Image IconID="find_find_16x16"></Image>
                                                        </dx:EditButton>
                                                    </Buttons>
                                                    <ClearButton DisplayMode="Always">
                                                    </ClearButton>
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField ErrorText="No search text specified" IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxButtonEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                        </Items>
                    </dx:ASPxFormLayout>
                    <dx:ASPxGridView ID="grdSearch" runat="server" AutoGenerateColumns="False" DataSourceID="dsSearch" Width="100%" EnableViewState="False" ClientInstanceName="grdSearch" OnFillContextMenuItems="grdSearch_FillContextMenuItems" OnContextMenuItemClick="grdSearch_ContextMenuItemClick" KeyFieldName="ID">
                        <ClientSideEvents
                            ContextMenu="function(s, e) {
	                        s.SelectRowOnPage(e.index);
                        }"
                            RowDblClick="function(s, e) {
                            __doPostBack('rowDblClicked', 'RowSelected');
                        }"
                            ContextMenuItemClick="function(s, e) {
                            __doPostBack(e.item.name, 'RowSelected');
                        }"></ClientSideEvents>
                        <SettingsContextMenu Enabled="True" EnableRowMenu="True">
                            <RowMenuItemVisibility>
                                <ExportMenu Visible="True" />
                            </RowMenuItemVisibility>
                        </SettingsContextMenu>
                        <SettingsCustomizationDialog Enabled="True" />
                        <SettingsPager Mode="ShowAllRecords" Visible="False">
                        </SettingsPager>
                        <Settings ShowFilterBar="Visible" ShowGroupPanel="True" ShowHeaderFilterButton="True" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="300" />
                        <SettingsBehavior AllowEllipsisInText="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                        <SettingsResizing ColumnResizeMode="Control" />
                        <SettingsCookies CookiesID="GSAM_CompanionSearch_grdSearch4" Enabled="True" Version="1" />
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        <SettingsPopup>
                            <FilterControl AutoUpdatePosition="False">
                            </FilterControl>
                        </SettingsPopup>
                        <SettingsExport EnableClientSideExportAPI="True">
                        </SettingsExport>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0"></dx:GridViewDataTextColumn>
                               <dx:GridViewDataTextColumn FieldName="CounterpartyType" VisibleIndex="3"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ClientNo" VisibleIndex="2"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CustodialGroup" VisibleIndex="18" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PostalAddress" VisibleIndex="19" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PostalAddress2" VisibleIndex="20" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PostalAddress3" VisibleIndex="21" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PostalCity" VisibleIndex="22" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PostalCountry" VisibleIndex="23" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhysicalAddress" VisibleIndex="5"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhysicalAddress2" VisibleIndex="6"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhysicalAddress3" VisibleIndex="7"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhysicalCity" VisibleIndex="13" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhysicalCountry" VisibleIndex="14" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="EmailAddress" VisibleIndex="10"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhoneNo" VisibleIndex="11"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhoneNo2" VisibleIndex="12"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FaxNo" VisibleIndex="15" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CustodialGroupName" VisibleIndex="4" Caption="Custodial Group"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PostalCityName" VisibleIndex="16" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PostalCountryName" VisibleIndex="17" Visible="False"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhysicalCityName" VisibleIndex="8" Caption="Physical City"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhysicalCountryName" VisibleIndex="9" Caption="Physical Country"></dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:ObjectDataSource ID="dsSearch" TypeName=" LastTrialGene.Models.SearchEntity+Entity" SelectMethod="Fill" runat="server">
                        <%--<SelectParameters>
                            <asp:QueryStringParameter QueryStringField="SelectedID" Name="searchString" Type="String"></asp:QueryStringParameter>
                        </SelectParameters>--%>
                    </asp:ObjectDataSource>
    
                </ContentTemplate>

            </asp:UpdatePanel>
</asp:Content>
