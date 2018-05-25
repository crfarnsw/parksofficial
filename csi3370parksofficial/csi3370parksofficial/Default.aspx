<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="csi3370parksofficial.Default" %>
<asp:Content runat="server"  ContentPlaceHolderID="HeadContent">
    <link rel="Content/font-awesome-4.7.0/css/font-awesome.min.css"/>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container homeContainer">
        <h1 class="text-center">"Parks Official"</h1>
        <div class="text-center">
            <a href="/Search.aspx">Enter Here</a>
        </div>
    </div>
</asp:Content>
