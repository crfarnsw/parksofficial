<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="csi3370parksofficial.Search" %>
<%@ Import Namespace="System.Activities.Statements" %>
<%@ Import Namespace="Microsoft.Ajax.Utilities" %>
<%@ Import Namespace="csi3370parksofficial.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link rel="stylesheet" href="Content/bootstrap.css" />
    <link href="Content/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" />
    <style type="text/css">
        .center {
            margin: 0 auto;
            width: 80%;
        }
        #map {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container">
                <h1>Search</h1>
                <hr/>
                <div>
                    <div class="input-group input-group-lg">
                        <asp:TextBox runat="server" ID="txtSearch" ClientIDMode="Static" CssClass="form-control" placeholder="Search parks" aria-describedby=""></asp:TextBox>
                        <div class="input-group-btn">
                            <!-- Buttons -->
                            <button class="btn btn-default" type="submit" title="Search">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                            <button type="submit" runat="server" id="btnClear" class="btn btn-default btn-lg" title="Clear" OnServerClick="btnClear_OnServerClick">
                                <i class="fa fa-undo" aria-hidden="true"></i>
                            </button>
                            <a class="btn btn-default btn-lg" runat="server" title="Advanced filter" onserverclick="btnShowAdvancedPanel_Click">
                                <i class="fa fa-cog" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                    <button type="submit" runat="server" visible="false" id="btnSearch" class="btn btn-default btn-lg" OnServerClick="btnSearch_Click">Search</button>
                </div>
                <div>
                </div>
                <%--Search Panel--%>
                <div class="row">
                    <div class="col-md-8">
                    </div>
                    <div class="col-md-4">
<%--                        <a class="btn btn-link" style="float: right" href="\AddPark.aspx">Add new park</a>      --%>
                    </div>
                </div>
                <br />

                <%--Advanced Panel--%>
                <div class="row">
                        <div runat="server" class="panel panel-default" visible="false"  id="pnlAdvanced">
                            <div class="panel-heading">
                                <h3 class="panel-title">Advanced </h3>
                            </div>
                            <div class="panel-body">
                                County:
                                <asp:DropDownList ID="ddlCounty" CssClass="dropdown" runat="server" AutoPostBack="True" >
                                    <asp:ListItem Value="None">All</asp:ListItem>
                                    <asp:ListItem value="Oakland">Oakland</asp:ListItem>
                                    <asp:ListItem value="Macomb">Macomb</asp:ListItem>
                                    <asp:ListItem value="Wayne">Wayne</asp:ListItem>
                                </asp:DropDownList>
                                Park Type:
                                <asp:DropDownList ID="ddlFilterByParkType" runat="server" AutoPostBack="True" 
                                    ItemType="csi3370parksofficial.Models.ParkType"
                                    OnCallingDataMethods="ddlParkTypes_OnCallingDataMethods"
                                    SelectMethod="BindParkTypes"
                                    AppendDataBoundItems="true"
                                    DataTextField="ParkTypeName" 
                                    DataValueField="ParkTypeID">
                                    <asp:ListItem Value="0">Select One:</asp:ListItem>
                                </asp:DropDownList>
                                Facility:
                                <asp:DropDownList runat="server" id="ddlFacilities" AutoPostBack="True"
                                                  SelectMethod="GetFacilities" 
                                                  ItemType="csi3370parksofficial.Models.Facility" 
                                                  OnCallingDataMethods="rptFacilities_OnCallingDataMethods"
                                                  AppendDataBoundItems="true"
                                                  DataTextField="FacilityName"
                                                  DataValueField="FacilityID">
                                    <asp:ListItem Value="0">Select Facility:</asp:ListItem>
                                </asp:DropDownList>

                                <a class="btn" title="Clear all filters" id="btnClearFilters" runat="server" OnServerClick="btnClearFilters_OnServerClick" >
                                    <span class="glyphicon glyphicon-circle-arrow-left"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                
                <%-- Parks Table --%>
                <div class="row">
                    <asp:GridView runat="server" ID="gvParks"
                        CssClass="table table-bordered table-striped"
                        ItemType="csi3370parksofficial.Models.Park" 
                        DataKeyNames="ParkID"
                        SelectMethod="GetParks"
                        DeleteMethod="DeletePark"
                        UpdateMethod="UpdatePark"
                        AllowSorting="true" 
                        AllowPaging="false" 
                        PageSize="10"
                        AutoGenerateColumns="false"
                        EmptyDataText="No Results"
                        >
                        <Columns>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="lblID" Value='<%# Eval("ParkID") %>'/>
                                    <asp:LinkButton ID="btnDelete" runat="server" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;" CommandName="Delete">Delete </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ParkName" HeaderText="Name" SortExpression="ParkName" />
                            <asp:BoundField DataField="ParkAddress" HeaderText="Address"/>
                            <asp:BoundField DataField="ParkCounty" HeaderText="County" SortExpression="ParkCounty" />
                            <asp:BoundField DataField="ParkCity" HeaderText="City"/>
                            <asp:BoundField DataField="ParkZipCode" HeaderText="Zip Code" />
                            <asp:BoundField DataField="ParkHours" HeaderText="Hours" />
                            <asp:TemplateField HeaderText="Type">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblParkType_row" Text='<%#: Item.ParkTypeID == null ? "" : Item.ParkType.ParkTypeName  %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ParkPhoneNumber" HeaderText="Phone Number" />
                            <asp:TemplateField HeaderText="Website">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" id="btnWebsite" text='<%#:Item.ParkWebsite %>' Target="_blank" NavigateUrl='<%#Eval("ParkWebsite") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField HeaderText="Details" text="View" AccessibleHeaderText="" DataNavigateUrlFields="ParkID" DataNavigateUrlFormatString="ParkDetails.aspx?ParkID={0}" />
                        </Columns>
                    </asp:GridView>
                </div>
                
            </div>
        </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
