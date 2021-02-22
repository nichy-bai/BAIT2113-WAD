<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BAIT2113_WAD.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">
    <style>
        body {
        }

        .card {
            width: 100%;
            border: none;
            border-radius: 14px;
        }

        .image {
            top: -62px;
        }

            .image img {
                box-shadow: 5px 6px 6px 2px #e9ecef;
                vertical-align: auto;
                margin-left: 45%;
            }

        .area2 {
            border-bottom-left-radius: 14px !important;
            border-bottom-right-radius: 14px !important
        }

        .name {
            font-size: 25px;
            font-weight: normal;
            margin-left: 44%;
        }

        .information {
            margin-left: 20%;
            margin-right: 20%;
            font-weight: 500;
            font-size: 16px
        }

        .list-icons {
            display: inline-flex;
            color: #C5CAE9;
            margin-left: 38%;
        }

            .list-icons li {
                list-style: none;
                padding: 12px;
                border-radius: 10px;
                width: 49px;
                margin-right: 10px
            }

                .list-icons li i {
                    font-size: 17px;
                    color: #fff
                }

        @media (max-width:700px) {


            html * {
                -webkit-font-smoothing: antialiased;
            }


            .nav-pills .nav-item .nav-link.active {
                color: #fff;
                background-color: #9c27b0;
                box-shadow: 0 5px 20px 0 rgba(0,0,0,.2), 0 13px 24px -11px rgba(156,39,176,.6);
            }

            .nav-pills .nav-item .nav-link {
                line-height: 24px;
                font-size: 12px;
                font-weight: 500;
                min-width: 100px;
                color: #555;
                transition: all .3s;
                border-radius: 30px;
                padding: 10px 15px;
                text-align: center;
            }

                .nav-pills .nav-item .nav-link:not(.active):hover {
                    background-color: rgba(200,200,200,.2);
                }


            .nav-pills .nav-item i {
                display: block;
                font-size: 30px;
                padding: 15px 0;
            }

            .tab-space {
                padding: 20px 0 50px;
            }

            .profile-page .gallery {
                margin-top: 3.213rem;
                padding-bottom: 50px;
            }

                .profile-page .gallery img {
                    width: 100%;
                    margin-bottom: 2.142rem;
                }

            .profile-page .profile .name {
                margin-top: -80px;
            }

            img.rounded {
                border-radius: 6px !important;
            }

            .tab-content > .active {
                display: block;
            }

            /*buttons*/
            .btn {
                position: relative;
                padding: 12px 30px;
                margin: .3125rem 1px;
                font-size: .75rem;
                font-weight: 400;
                line-height: 1.428571;
                text-decoration: none;
                text-transform: uppercase;
                letter-spacing: 0;
                border: 0;
                border-radius: .2rem;
                outline: 0;
                transition: box-shadow .2s cubic-bezier(.4,0,1,1),background-color .2s cubic-bezier(.4,0,.2,1);
                will-change: box-shadow,transform;
            }

                .btn.btn-just-icon {
                    font-size: 20px;
                    height: 41px;
                    min-width: 41px;
                    width: 41px;
                    padding: 0;
                    overflow: hidden;
                    position: relative;
                    line-height: 41px;
                }

                    .btn.btn-just-icon fa {
                        margin-top: 0;
                        position: absolute;
                        width: 100%;
                        transform: none;
                        left: 0;
                        top: 0;
                        height: 100%;
                        line-height: 41px;
                        font-size: 20px;
                    }

                .btn.btn-link {
                    background-color: transparent;
                    color: #999;
                }
        }

        .Grid {
            border: none;
            margin-left: 20%;
        }

            .Grid td {
                border: none;
                text-align: center;
                height: 60px;
                width:50%;
            }

        .GridHeader {
            font-weight: bold;
            background-color: #8b8dbb;
        }

        .GridItem {
            background-color: #e6e6e6;
        }

        .GridAltItem {
            background-color: white;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center">
        <div class="card rounded">
            <div class=" d-block justify-content-center">
                <div class="area2 p- text-center px-3">
                    <div class="image mr-3">
                        <img src="https://i.imgur.com/ZSkeqnd.jpg" class="rounded-circle" width="100" />
                        <asp:DetailsView ID="DetailsView1" CssClass="Grid" runat="server" Height="50px" Width="200px" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Font-Bold="True">
                            <Fields>
                                <asp:BoundField DataField="name" HeaderText="My Name" SortExpression="name" />
                                <asp:BoundField DataField="email" HeaderText="My Email" SortExpression="email" />
                                <asp:BoundField DataField="dob" HeaderText="Birthday" SortExpression="dob" />
                                <asp:BoundField DataField="phoneNum" HeaderText="Contact" SortExpression="phoneNum" />
                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [email], [dob], [phoneNum] FROM [Artist]"></asp:SqlDataSource>
                        <p class="information mt-3 text-justify">I'm doing this as a way to practice my design skills,explore different styles and have fun.I'm fully aware this challenge doesn't pose my real problem to solve,That's why i'm looking for criticism and feedback ,not just likes </p>



                    </div>
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile-tabs">
                                <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link" href="PurchaseHistory.aspx" role="tab" data-toggle="tab">
                                            <i class="material-icons">article</i>
                                            Purchase History
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Wishlist.aspx" role="tab" data-toggle="tab">
                                            <i class="material-icons">favorite</i>
                                            Favourite
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>





</asp:Content>

