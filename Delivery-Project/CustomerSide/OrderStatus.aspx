<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/CustomerSide.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="Delivery_Project.CustomerSide.OrderStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 90%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .no-orders {
            text-align: center;
            color: #888;
            font-size: 18px;
        }
        .table-responsive {
            overflow-x: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>רשימת הזמנות</h2>
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="mainTbl">
                <thead>
                    <tr>
                        <th>מזהה הזמנה</th>
                        <th>שם מלא</th>
                        <th>אימייל</th>
                        <th>טלפון</th>
                        <th>כתובת</th>
                        <th>עיר</th>
                        
                        <th>כמות</th>
                        <th>הערות</th>
                        <th>זמן משלוח</th>
                        <th>תאריך הגעה</th>
                        <th>תאריך הזמנה</th>
                        <th>תאריך הגעה</th>
                        <th>סטטוס</th>
                       
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="RptProd" runat="server">
                        <ItemTemplate>
                            <tr class="odd gradeX">
                                <td><%#Eval("OrderID") %></td>
                                <td><%#Eval("FullName") %></td>
                                <td><%#Eval("Email") %></td>
                                <td><%#Eval("Phone") %></td>
                                <td><%#Eval("Address") %></td>
                                <td><%#Eval("CityId") %></td>
                                <td><%#Eval("Quantity") %></td>
                                <td><%#Eval("Notes") %></td>
                                <td><%# Eval("DeliveryTime") %></td>
                                <td><%# Eval("ChooseDeliveryTime") %></td>
                                <td><%# Eval("OrderDate") %></td>
                                <td><%# Eval("Datedelivery") %></td>
                                <td><%#Eval("Status") %></td>
                                
                                
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater> 
                </tbody>
            </table>
        </div>
        <asp:Panel ID="NoOrdersPanel" runat="server" CssClass="no-orders" Visible="False">
            אין הזמנות ברשימה.
        </asp:Panel>
    </div>
</asp:Content>
