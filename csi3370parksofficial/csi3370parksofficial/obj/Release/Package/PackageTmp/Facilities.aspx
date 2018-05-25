<%@ Page Title="Facilities" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facilities.aspx.cs" Inherits="csi3370parksofficial.Facilities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:HyperLink runat="server" id="btnBack" CssClass="btn btn-link" Text="Back to Search" NavigateUrl="Search.aspx"></asp:HyperLink>
        <br/>
        <h1>Facilities <small>View park facilities</small></h1> 
        <hr/>
        <div class="row">

            <asp:ListView runat="server"
                ID="lvParksFacilities"
                SelectMethod="GetParkFacilities"
                InsertMethod="AddParkFacility"
                DataKeyNames="ParkID"
                ItemType="csi3370parksofficial.Models.ParkFacility"
                OnCallingDataMethods="lvParksFacilities_CallingDataMethods">
                <EmptyDataTemplate>
                    <div class="alert alert-danger" role="alert">No facilities!</div>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <%# Container.DataItemIndex + 1 %>.
                            </td>
                            <td>
                                <%#: Item.Facility.FacilityName %>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <br/>

        <div class="row">
            <asp:FormView runat="server"
                ItemType="csi3370parksofficial.Models.ParkFacility"
                DefaultMode="Insert"
                OnCallingDataMethods="lvParksFacilities_CallingDataMethods"
                SelectMethod="GetParkFacilities"
                OnItemInserted="OnItemInserted"
                InsertMethod="InsertParkFacility">
                <InsertItemTemplate>
                    <asp:DropDownList runat="server" ID="ddlFacilities"
                        SelectMethod="GetFacilities"
                        ItemType="csi3370parksofficial.Models.Facility"
                        OnCallingDataMethods="ddlFacilities_CallingDataMethods"
                        AppendDataBoundItems="true"
                        DataTextField="FacilityName"
                        DataValueField="FacilityID">
                        <asp:ListItem Value="0">Select Facility:</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button runat="server" Text="Insert" CommandName="Insert" />
                    <asp:Button runat="server" Text="Cancel" ID="btnCancel" CausesValidation="false" OnClick="btnCancel_OnClick" />
                </InsertItemTemplate>
            </asp:FormView>
        </div>
    </div>
</asp:Content>
