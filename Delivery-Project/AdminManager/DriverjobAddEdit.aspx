<%@ Page Title="" Language="C#" MasterPageFile="~/AdminManager/BackAdmin.Master" AutoEventWireup="true" CodeBehind="DriverjobAddEdit.aspx.cs" Inherits="Delivery_Project.AdminManager.DriverjobAddEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainCnt" runat="server">
    <div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">ניהול משתמשים</h1>
    </div>
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                הוספה / עריכת משתמשים
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <asp:HiddenField ID="hidCus" runat="server" Value="-1" />
                        <div class="form-group">
                            <label>עיר</label>
                            <asp:DropDownList ID="DDlUser" CssClass="form-control" runat="server">
                                <asp:ListItem Text="-- בחר עיר --" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>עיר</label>
                            <asp:DropDownList ID="ddlCities" CssClass="form-control" runat="server">
                                <asp:ListItem Text="-- בחר עיר --" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>סטטוס</label>
                            <asp:TextBox ID="STATUS" CssClass="form-control" runat="server" placeholder="נא הזן סטטוס" />
                        </div>
                        <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" OnClick="btnSave_Click" Text="שמירה" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterCnt" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="UnderFooterCnt" runat="server">
</asp:Content>
