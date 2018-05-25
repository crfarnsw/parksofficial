<%@ Control Language="C#" CodeBehind="ForeignKey.ascx.cs" Inherits="csi3370parksofficial.ForeignKeyField" %>

<asp:HyperLink ID="HyperLink1" runat="server"
    Text="<%# GetDisplayString() %>"
    NavigateUrl="<%# GetNavigateUrl() %>"  />

