<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPark.aspx.cs" Inherits="csi3370parksofficial.AddPark" %>
<%@ Import Namespace="csi3370parksofficial.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1>Add Park</h1>
        <div class="row">
            <div class="col-md-4">
                <asp:ValidationSummary runat="server" ShowModelStateErrors="true" />
                <asp:FormView runat="server"
                    ID="addStudentForm"
                    ItemType="csi3370parksofficial.Models.Park"
                    DataKeyNames="ParkID"
                    OnCallingDataMethods="addParkForm_CallingDataMethods"
                    InsertMethod="InsertPark" DefaultMode="Insert"
                    RenderOuterTable="false" OnItemInserted="addParkForm_ItemInserted">
                    <InsertItemTemplate>
                        <fieldset>
                            <ol>
                                Park Name:
                                <asp:DynamicControl runat="server" DataField="ParkName" Mode="Insert"></asp:DynamicControl>
                                <br />
                                Park Address:
                                <asp:DynamicControl runat="server" DataField="ParkAddress" Mode="Insert"></asp:DynamicControl>
                                <br />
                                Park City:
                                <asp:DynamicControl runat="server" DataField="ParkCity" Mode="Insert"></asp:DynamicControl>
                                <br />
                                Park County:
                                <asp:DynamicControl runat="server" DataField="ParkCounty" Mode="Insert"></asp:DynamicControl>
                                <br />
                                Park Zip Code:
                                <asp:DynamicControl runat="server" DataField="ParkZipCode" Mode="Insert"></asp:DynamicControl>
                                <br />
                                Park Fee:
                                <asp:DynamicControl runat="server" DataField="ParkFee" Mode="Insert"></asp:DynamicControl>
                                <br />
                                Park Hours:
                                <asp:DynamicControl runat="server" DataField="ParkHours" Mode="Insert"></asp:DynamicControl>
                                <br />
                                Dog Friendly:
                                <asp:DynamicControl runat="server" DataField="DogFriendly" Mode="Insert"></asp:DynamicControl>
                                <br />
                                Park Phone Number:
                                <asp:DynamicControl runat="server" DataField="ParkPhoneNumber" Mode="Insert"></asp:DynamicControl>
                                <br />
                                Park Type:
                                <asp:DynamicControl runat="server" DataField="ParkTypeID" Mode="Insert"></asp:DynamicControl>
                                <br />
                                Park Website:
                                <asp:DynamicControl runat="server" DataField="ParkWebsite" mode="Insert"></asp:DynamicControl>
                            </ol>
                            <asp:Button runat="server" Text="Insert" CommandName="Insert" />
                            <asp:Button runat="server" Text="Cancel" CausesValidation="false" OnClick="cancelButton_Click" />
                        </fieldset>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
            <div class="col-md-4">
                <table class="table table-bordered">
                    <tr>
                        <td colspan="2"> Key for ParkType</td>
                    </tr>
                    <tr>
                        <td>
                            ParkTypeID
                        </td>
                        <td>
                            ParkTypeName
                        </td>
                    </tr>
                    <tr>
                        <td>
                            47
                        </td>
                        <td>
                            County
                        </td>
                    </tr>
                    <tr>
                        <td>
                            49	
                        </td>
                        <td>
                            National
                        </td>
                    </tr>
                    <tr>
                        <td>
                            50
                        </td>
                        <td>
                            State
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
