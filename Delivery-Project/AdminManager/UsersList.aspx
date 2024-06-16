﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminManager/BackAdmin.Master" AutoEventWireup="true" CodeBehind="UsersList.aspx.cs" Inherits="Delivery_Project.AdminManager.UsersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainCnt" runat="server">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">ניהול משתמשים</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                מאגר משתמשים במערכת
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="mainTbl">
                                        <thead>
                                            <tr>
                                                <th>קוד מזהה</th>
                                                <th>תעודת זהות</th>
                                                <th>שם משתמש</th>
                                                <th>סיסמה</th>
                                                <th>מנהל</th>
                                                <th>טלפון</th>
                                                <th>סטטוס</th>
                                                <th>תאריך הוספה</th>
                                                <th>ניהול</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="RptProd" runat="server">
                                                <ItemTemplate>
                                                    <tr class="odd gradeX">
                                                        <td><%#Eval("Uid") %></td>
                                                        <td><%#Eval("UserId") %></td>
                                                        <td><%#Eval("UserName") %></td>
                                                        <td><%#Eval("Password") %></td>
                                                        <td><%#Eval("IsAdmin") %></td>
                                                        <td><%#Eval("phone") %></td>
                                                        <td><%#Eval("status") %></td>
                                                        <td><%#Eval("AddDate") %></td>
                                                        <td class="center"><a href="UsersAddEdit.aspx?Uid=<%#Eval("Uid") %>">ערוך <spann class="fa fa-pencil"></spann></a></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater> 
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                                <div class="well">
                                    <h4>DataTables Usage Information</h4>
                                    <p>DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are using a specialized version of DataTables built for Bootstrap 3. We have also customized the table headings to use Font Awesome icons
                                        in place of images. For complete documentation on DataTables, visit their website at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
                                    <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
                                </div>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterCnt" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="UnderFooterCnt" runat="server">
</asp:Content>

