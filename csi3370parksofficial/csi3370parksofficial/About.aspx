<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="csi3370parksofficial.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Parks Official</h2>
        <h3>One of the of greatest benefits of living in Michigan is the natural beauty of it. This beauty is most enjoyed and realized when visiting a local, state, or national park. Our site aims to be a one-stop shop for your Metro Detroit Parks needs. Our team has created the most efficient keyword search and filters to help you find what you are looking for in the fastest and easiest way possible. We strive to add new features regularly and monitor for park changes unlike the other park scrapper and aggregator websites. For the time being our team has included the countries of Oakland, Wayne, and Macomb, but we hope to encompass statewide search in the future expansion..</h3>
        <br/>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="Images/Macomb County Park.jpg" style="width:100%" />
                    <div class="carousel-caption">
                        <h3>Macomb</h3>
                    </div>
                </div>

                <div class="item">
                    <img src="Images/Oakland County Park.jpg" width="1140px" style="max-height: 502.933px" />
                    <div class="carousel-caption">
                        <h3>Oakland</h3>
                    </div>
                </div>
    
                <div class="item">
                    <img src="Images/Wayne County Photo.jpg"  width="1140px" style="max-height: 502.933px" />
                    <div class="carousel-caption">
                        <h3>Wayne</h3>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</asp:Content>
