<%@ Page Title="" Language="C#" MasterPageFile="~/Client-Side.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Delivery_Project.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <form role="form">
                        <fieldset>
                            <div class="form-group">
                                משתמש: <asp:TextBox ID="userId" runat="server" /><br />
                            </div>
                            <div class="form-group">
                                סיסמה : <asp:TextBox ID="UserPass" TextMode="Password" runat="server" /><br />
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                </label>
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click"/><br />
                            <asp:Literal ID="LtlMsg" runat="server" />
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
