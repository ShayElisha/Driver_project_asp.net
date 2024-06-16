<%@ Page Title="" Language="C#" MasterPageFile="~/AdminManager/BackAdmin.Master" AutoEventWireup="true" CodeBehind="UsersAddEdit.aspx.cs" Inherits="Delivery_Project.AdminManager.UsersAddEdit" %>
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
                הוספה / עריכת משתמשים
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <asp:HiddenField ID="hidCus" runat="server" Value="-1"/>
                        <div class="form-group">
                            <label>תעודת זהות</label>
                            <asp:TextBox ID="userId" CssClass="form-control" runat="server" placeholder="נא הזן תיאור מוצר"/>
                        </div> 
                            <div class="form-group">
                                <label>שם משתמש</label>
                                <asp:TextBox ID="userName" CssClass="form-control" runat="server" placeholder="נא הזן תיאור מוצר"/>
                            </div> 
                        <div class="form-group">
                            <label>סיסמה</label>
                            <asp:TextBox ID="password" CssClass="form-control" runat="server" placeholder="נא הזן שם קטגוריה"/>
                        </div>   
                        <div class="form-group">
                            <label>מנהל</label>
                            <asp:TextBox ID="isAdmin" CssClass="form-control" runat="server" placeholder="נא הזן תיאור מוצר"/>
                        </div> 
                          <div class="form-group">
                            <label>טלפון</label>
                            <asp:TextBox ID="phone" CssClass="form-control" runat="server" placeholder="נא הזן תיאור מוצר"/>
                        </div> 
                        <div class="form-group">
                            <label>סטטוס</label>
                            <asp:TextBox ID="STATUS" CssClass="form-control" runat="server" placeholder="נא הזן שם קטגוריה"/>
                        </div>

                            <asp:button ID="btnSave" type="submit" class="btn btn-primary" runat="server" onclick="BtnUser" Text="שמירה" />
                    </div>
                </div>
                <!-- /.row (nested) -->
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterCnt" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="UnderFooterCnt" runat="server">
</asp:Content>
