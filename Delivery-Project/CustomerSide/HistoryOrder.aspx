<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/CustomerSide.Master" AutoEventWireup="true" CodeBehind="HistoryOrder.aspx.cs" Inherits="Delivery_Project.CustomerSide.HistoryOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .order-history-table {
            width: 100%;
            border-collapse: collapse;
        }

        .order-history-table th, .order-history-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .order-history-table th {
            background-color: #f2f2f2;
            text-align: left;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>היסטוריית הזמנות</h2>
    <asp:GridView ID="gvOrderHistory" runat="server" CssClass="order-history-table" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="מזהה הזמנה" />
            <asp:BoundField DataField="FullName" HeaderText="שם מלא" />
            <asp:BoundField DataField="Email" HeaderText="אימייל" />
            <asp:BoundField DataField="Phone" HeaderText="טלפון" />
            <asp:BoundField DataField="Address" HeaderText="כתובת" />
            <asp:BoundField DataField="CityId" HeaderText="מזהה עיר" />
            <asp:BoundField DataField="Quantity" HeaderText="כמות" />
            <asp:BoundField DataField="Notes" HeaderText="הערות" />
            <asp:BoundField DataField="ChooseDeliveryTime" HeaderText="זמן משלוח" />
        </Columns>
    </asp:GridView>
</asp:Content>
