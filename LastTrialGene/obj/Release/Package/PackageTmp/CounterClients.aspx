<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="CounterClients.aspx.cs" Inherits="LastTrialGene.CounterClients" %>

<%@ Register Src="~/Controls/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>
<%@ Register Src="~/Controls/ClientsCreation.ascx" TagPrefix="uc1" TagName="ClientsCreation" %>
<%@ Register Src="~/Controls/ClientsCreation2.ascx" TagPrefix="uc1" TagName="ClientsCreation2" %>





<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftPanelContent" runat="server">
    <uc1:SideBar runat="server" ID="SideBar" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightPanelContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageToolbar" runat="server">
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
