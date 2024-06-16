<%@ Page Title="" Language="C#" MasterPageFile="~/Client-Side.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Delivery_Project.MainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="register">
            <p>רוצים להצטרף אלינו</p>
            <asp:Button ID="Login" Text="login" OnClick="Login_Click" runat="server" />
        </div>
        <div class="box">
            <h1>פתרונות תובלה מהפכניים בהישג ידך</h1>
            <p>התחבר אל CargoWay ותהנה ממערכת מתקדמת לניהול תובלה שמתאימה בדיוק לצרכים שלך.</p>
            <h3>ברוכים הבאים ל-CargoWay</h3>
            <p>אנחנו מבינים שלנהל צי של נהגים זו משימה מאתגרת. כאן ב-CargoWay, יצרנו פתרון שמקל עליך לנהל ולתכנן את העבודה של הנהגים בצורה היעילה והחכמה ביותר.</p>
            <h3>מה אנחנו מציעים?</h3>
            <h3>ניהול מסלולים קל ופשוט:</h3>
            <p>האפליקציה שלנו מאפשרת לך ליצור, לתכנן ולנהל מסלולים במהירות ובפשטות. תוכל להקצות משימות לנהגים בצורה אופטימלית ולהבטיח שכל משלוח יגיע ליעדו בזמן.</p>
        </div>
        
    </div>
</asp:Content>
