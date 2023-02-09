<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LastTrialGene.Index" %>

<%@ Register Src="~/Controls/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="LeftPanelContent" runat="server">
     <uc1:SideBar runat="server" Visible="true" ID="SideBar" />
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="RightPanelContent" runat="server">
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="PageToolbar" runat="server">
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="PageContent" runat="server">
    <link href="Content/tryer.css" rel="stylesheet" />
    <section style="background-color: #eee;">
        <div class="container py-5">
            <%--<div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">User</a></li>
                            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                        </ol>
                    </nav>
                </div>
            </div>--%>

            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
                                class="rounded-circle img-fluid" style="width: 150px;">
                            <h5 class="my-3">
                                <asp:Label ID="lblLongName" runat="server" Text=""></asp:Label></h5>
                            <p class="text-muted mb-1">
                                <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                            </p>
                            <p class="text-muted mb-4">
                                <asp:Label ID="lblPhoneNumber" runat="server" Text=""></asp:Label>
                            </p>
                         
                        </div>
                    </div>
               
                </div>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Client Number</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">
                                        <asp:Label ID="lblClientNo" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">ID Number</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">
                                        <asp:Label ID="lblIdentificationNo" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">
                                        <asp:Label ID="lblPostalAddress" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Nationality</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">
                                        <asp:Label ID="lblNationality" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Date Of Birth</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">
                                        <asp:Label ID="lblDateOfBirth" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Active</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">
                                        <dx:ASPxCheckBox ID="chkActiveDetails" runat="server"></dx:ASPxCheckBox>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
