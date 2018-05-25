﻿<%@ Page Title="Park Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ParkDetails.aspx.cs" Inherits="csi3370parksofficial.ParkDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        #map {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">  
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:LinkButton runat="server" CssClass="btn-link" ID="btnBack" OnClick="btnBack_OnClick" Text="Back"></asp:LinkButton>
                <div class="row">
                    <h1>
                        <asp:Label runat="server" ID="lblParkName" ClientIDMode="Static"></asp:Label>
                        <asp:LinkButton runat="server" ID="btnParkWebsite" Text="Website" OnClick="lblParkWebsite_OnClick" CssClass="btn btn-link"></asp:LinkButton>
                    </h1>
                    <hr />
                    <div class="col-md-4">
                        <h2>Events
                    </div>
                    <div class="col-md-8">
                        <h2>Map</h2>
                    </div>
                    <br />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="row">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="col-xs-4">
                        
                        <%--Events Table--%>
                        <asp:GridView runat="server"
                            ID="gvEvents"
                            Visible="True"
                            ItemType="csi3370parksofficial.Models.Event"
                            OnCallingDataMethods="gvEvents_OnCallingDataMethods"
                            SelectMethod="GetEvents"
                            DataKeyNames="EventID"
                            DeleteMethod="DeleteEvent"
                            AutoGenerateDeleteButton="False"
                            AutoGenerateColumns="False"
                            CssClass="table table-bordered  table-striped"
                            EmptyDataText="No events">
                            <Columns>
                                <asp:BoundField HeaderText="Event Name" DataField="EventName" />
                                <asp:BoundField HeaderText="Event Date" DataField="EventDate" DataFormatString="{0:MM/dd/yyyy}" />
                            </Columns>
                        </asp:GridView>

                        <h2>Facilities</h2>
                        <%--Facilities Grid--%>
                        <asp:GridView runat="server"
                            ID="gvParksFacilities"
                            SelectMethod="GetParkFacilities"
                            InsertMethod="AddParkFacility"
                            DeleteMethod="DeleteParkFacility"
                            DataKeyNames="ParkFacilitiesID"
                            ItemType="csi3370parksofficial.Models.ParkFacility"
                            OnCallingDataMethods="lvParksFacilities_CallingDataMethods"
                            AutoGenerateColumns="False"
                            CssClass="table table-bordered table-striped"
                            AutoGenerateDeleteButton="False">
                            <EmptyDataTemplate>
                                <div class="alert alert-danger" role="alert">No facilities!</div>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:BoundField HeaderText="Facility Name" DataField="Facility.FacilityName" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%-- Map --%>
            <div class="col-md-4">
                <div id="map" style="height: 354px; width: 713px;"></div>
                <input id="address" class="hidden" clientidmode="Static" type="text" runat="server" value="" />
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBm5Uts5Y3hUtduEqc_SpsFvGC3BWs7zeE&callback=InitMap"
            type="text/javascript"></script>
    <script>
        var directionsDisplay,
            directionsService,
            map;

        function InitMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                center: { lat: -34.397, lng: 150.644 }
            });
            var geocoder = new google.maps.Geocoder();

            window.onload = geocodeAddress(geocoder, map);
        }

        function geocodeAddress(geocoder, resultsMap) {
            var address = document.getElementById('address').value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status === 'OK') {
                    resultsMap.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: resultsMap,
                        position: results[0].geometry.location
                    });
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }
    </script>
</asp:Content>