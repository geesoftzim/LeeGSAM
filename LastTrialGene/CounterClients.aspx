<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="CounterClients.aspx.cs" Inherits="LastTrialGene.CounterClients" %>

<%@ Register Src="~/Controls/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>
<%@ Register Src="~/Controls/ClientsCreation.ascx" TagPrefix="uc1" TagName="ClientsCreation" %>
<%@ Register Src="~/Controls/ClientsCreation2.ascx" TagPrefix="uc1" TagName="ClientsCreation2" %>





<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
        <link rel="stylesheet" type="text/css" href='<%# ResolveUrl("~/Content/GridView.css") %>' />
    <script type="text/javascript" src='<%# ResolveUrl("~/Content/GridView.js") %>'></script>

    <script type="text/javascript">
    /**    var isResetRequired = false;
        function onSelectedCountryChanged(s, e) {
            isResetRequired = true;
            grid.GetEditor("PhysicalCity").PerformCallback(s.GetValue());
        }
        function onCityEndCallback(s, e) {
            if (isResetRequired) {
                isResetRequired = false;
                s.SetSelectedIndex(0);
            }
        }*/

       /* function CountriesCombo_SelectedIndexChanged(s, e) {
            grid.GetEditor("PhysicalCity").PerformCallback(s.GetValue());
        }*/


    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LeftPanelContent" runat="server">
    <uc1:SideBar runat="server" ID="SideBar" />
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="RightPanelContent" runat="server">
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="PageToolbar" runat="server">
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
                    <h1>Clients Creation</h1>
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


<asp:Content ID="Content5" ContentPlaceHolderID="PageContent" runat="server">
    <asp:ScriptManager runat="server" ID="scptClientFormsPage" />
    <updatepanel id="UpdatePanel1" AutoPostBack="true">
    <section style="background-color: #eee;">
        <div style="padding-top: 10px; padding-left: 40px">

            <div class="row justify-content-center align-items-center">
                <dx:ASPxRadioButtonList ID="rdoClientType" runat="server" ClientInstanceName="rdoClientType" AutoPostBack="true" RepeatDirection="Horizontal">
                    <Items>
                        <dx:ListEditItem Text="New Individual Client" Value="NewIndividualClient" Selected="true"></dx:ListEditItem>
                        <dx:ListEditItem Text="New Non-Individual Client" Value="NewNonIndividualClient"></dx:ListEditItem>
                    </Items>
                </dx:ASPxRadioButtonList>
            </div>
<uc1:ClientsCreation runat="server" id="ClientsCreation" />
<uc1:ClientsCreation2 runat="server" id="ClientsCreation2" />
        </div>
    </section>
    </updatepanel>
</asp:Content>
