﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Client-Side.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Delivery_Project.MainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* סגנונות ל-modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }
        

        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 400px;
            border-radius: 10px;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* סגנונות לטופס הרשמה */
        .modal-content h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .modal-content input[type="text"],
        .modal-content input[type="password"],
        .modal-content input[type="email"],
        .modal-content input[type="tel"],
        .modal-content input[type="number"] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .modal-content .btn {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .modal-content .btn:hover {
            background-color: #45a049;
        }

        /* סגנונות כלליים */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
            direction: rtl;
        }

        .container1 {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        .register p {
            text-align: center;
            margin: 10px 0;
        }

        .register .btn {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: inline-block;
            margin: 10px;
        }

        .register .btn:hover {
            background-color: #0056b3;
        }

        .box {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }

        .box h1 {
            text-align: center;
            color: #4CAF50;
        }

        .box h3 {
            color: #007BFF;
        }

        .box p {
            text-align: justify;
            margin: 10px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
        <div class="register">
            <p>לקוחות חדשים מקבלים יותר!!!</p>
            <p>להצטרפות</p>
            <asp:Button ID="Register" CssClass="btn" Text="להרשמה" OnClientClick="showRegisterModal(); return false;" runat="server" />
            <asp:Button ID="Login" CssClass="btn" Text="התחברות" OnClientClick="showLoginChoiceModal(); return false;" runat="server" />
        </div>
        <div class="box">
            <h1>פתרונות תובלה מהפכניים בהישג ידך</h1>
            <p>התחבר אל CargoWay ותהנה ממערכת מתקדמת לניהול תובלה שמתאימה בדיוק לצרכים שלך.</p>
            <h3>ברוכים הבאים ל-CargoWay</h3>
            <p>ב-CargoWay, אנחנו מבינים שלנהל צי של נהגים זו משימה מאתגרת ומורכבת. לכן, יצרנו פתרון חכם ויעיל שמקל עליך לנהל ולתכנן את העבודה של הנהגים בצורה המתקדמת ביותר.</p>
            <h3>מה אנחנו מציעים?</h3>
            <h3>ניהול מסלולים קל ופשוט:</h3>
            <p>האפליקציה שלנו מאפשרת לך ליצור, לתכנן ולנהל מסלולים במהירות ובפשטות. תוכל להקצות משימות לנהגים בצורה אופטימלית ולהבטיח שכל משלוח יגיע ליעדו בזמן.</p>
            <h3>מעקב בזמן אמת:</h3>
            <p>המערכת שלנו מאפשרת לך לעקוב אחרי המשלוחים בזמן אמת. תוכל לראות את מיקומם של הנהגים שלך בכל רגע נתון ולקבל עדכונים שוטפים לגבי מצב המשלוחים. כמו כן, תוכל לקבל התראות על עיכובים או בעיות במהלך המסלול, כדי שתוכל לפעול במהירות ולפתור בעיות בזמן אמת.</p>
            <h3>דוחות וניתוחים מתקדמים:</h3>
            <p>CargoWay מספקת לך כלים מתקדמים לניתוח ביצועים. תוכל להפיק דוחות מפורטים על ביצועי הנהגים, זמני המסירה, ודוחות כספיים שיעזרו לך לנהל את התקציב בצורה יעילה. כלים אלה יעזרו לך לקבל החלטות מושכלות ולשפר את יעילות העבודה.</p>
            <h3>ניהול לקוחות והזמנות:</h3>
            <p>המערכת שלנו מאפשרת לך לנהל את פרטי הלקוחות וההזמנות בצורה פשוטה ויעילה. תוכל לעקוב אחרי היסטוריית ההזמנות של כל לקוח ולשלוח התראות ועדכונים בזמן אמת. כמו כן, תוכל ליצור הצעות מחיר ולשלוח חשבוניות בצורה דיגיטלית, מה שמייעל את תהליך ניהול הלקוחות.</p>
            <h3>אינטגרציה עם מערכות אחרות:</h3>
            <p>CargoWay תומכת באינטגרציה מלאה עם מערכות ERP, CRM, ותוכנות ניהול מלאי אחרות. כך תוכל לסנכרן את כל הנתונים בצורה חלקה ולקבל תמונה מלאה ומדויקת של פעילות העסק שלך.</p>
            <h3>אבטחת מידע:</h3>
            <p>אבטחת המידע שלך חשובה לנו מאוד. מערכת CargoWay משתמשת בטכנולוגיות ההצפנה המתקדמות ביותר כדי להבטיח שהמידע שלך מוגן מפני גישה לא מורשית.</p>
            <h3>לנהגים</h3>
            <h3>מעקב אחרי סידור קווים:</h3>
            <p>ב-CargoWay, אנו מקלים על הנהגים עם גישה נוחה לרשימות סידור הקווים שלהם. באמצעות האפליקציה, הנהגים יכולים לבדוק את לוח הזמנים שלהם, לראות את המסלולים המוקצים להם, ולקבל הנחיות ברורות לכל משלוח.</p>
            <h3>ניהול זמן ומשימות:</h3>
            <p>הנהגים יכולים לנהל את הזמן שלהם בצורה יעילה באמצעות האפליקציה שלנו, לקבל התראות על משימות חדשות, ולסמן משימות כבוצעות בזמן אמת. זה עוזר לשפר את הדיוק והאמינות של המשלוחים.</p>
            <h3>תקשורת ישירה:</h3>
            <p>האפליקציה מאפשרת תקשורת ישירה בין הנהגים למנהלים, כך שתוכל לקבל הנחיות ועדכונים בזמן אמת, ולדווח על בעיות או עיכובים באופן מיידי.</p>
            <h3>ללקוחות</h3>
            <h3>שקיפות מלאה:</h3>
            <p>לקוחות CargoWay נהנים משקיפות מלאה בנוגע למצב המשלוחים שלהם. תוכל לעקוב אחרי המשלוח שלך בזמן אמת, לקבל עדכונים על הסטטוס, ולדעת בדיוק מתי הוא יגיע ליעדו.</p>
            <h3>ניהול חשבוניות ודוחות:</h3>
            <p>לקוחות יכולים לנהל את החשבוניות והדוחות שלהם בצורה דיגיטלית ולקבל גישה מהירה לכל המידע הפיננסי הקשור למשלוחים שלהם. זה מאפשר לך לעקוב אחרי ההוצאות והכנסות בצורה יעילה יותר.</p>
            <h3>למנהלים</h3>
            <h3>אופטימיזציה של משאבים:</h3>
            <p>מנהלי צי יכולים לנצל את CargoWay כדי לאתר ולייעל את השימוש במשאבים. תוכל לזהות נהגים וציוד שנמצאים במצב אופטימלי ולבצע התאמות במידת הצורך כדי לשפר את היעילות התפעולית.</p>
            <h3>מעקב אחר ביצועים:</h3>
            <p>מנהלים יכולים לעקוב אחרי ביצועי הנהגים והמשלוחים בעזרת דוחות מפורטים וגרפים ויזואליים. זה מאפשר לך לקבל תמונה ברורה של הפעילות העסקית ולבצע שיפורים מבוססי נתונים.</p>
            <h3>תכנון עתידי:</h3>
            <p>המערכת שלנו תומכת בתכנון עתידי בעזרת כלים לחיזוי וניתוח נתונים. תוכל לתכנן את הפעילות העסקית שלך קדימה ולהיות מוכן לכל תרחיש.</p>
            <h3>ניהול קווים ועדכונם:</h3>
            <p>המנהלים יכולים לנהל ולעדכן קווי נסיעה בקלות באמצעות המערכת שלנו. תוכל להוסיף ולערוך מסלולים בצורה גמישה ומהירה, ולהבטיח שהנהגים והלקוחות מקבלים את השירות הטוב ביותר.</p>
            <h3>קליטת נהגים וניהול שוטף:</h3>
            <p>המערכת מאפשרת למנהלים לקלוט נהגים חדשים ולנהל את הצוות בצורה שוטפת ויעילה. תוכל לנהל את פרטי הנהגים, להקצות להם משימות ולעקוב אחרי ביצועיהם בצורה חכמה ומקיפה.</p>
        </div>
    </div>

    <!-- תיבת הרשמה (Modal) -->
    <div id="registerModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideRegisterModal()">&times;</span>
            <h2>הרשמה</h2>
            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" Placeholder="שם מלא"></asp:TextBox><br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="אימייל"></asp:TextBox><br />
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="סיסמה"></asp:TextBox><br />
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="טלפון"></asp:TextBox><br />
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Placeholder="כתובת"></asp:TextBox><br />
            <asp:TextBox ID="txtCityId" runat="server" CssClass="form-control" Placeholder="מזהה עיר"></asp:TextBox><br />
            <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" Placeholder="חברה"></asp:TextBox><br />
            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="הרשם" OnClick="btnSubmit_Click" />
        </div>
    </div>

    <!-- תיבת בחירת סוג משתמש (Modal) -->
    <div id="loginChoiceModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideLoginChoiceModal()">&times;</span>
            <h2>בחר סוג משתמש</h2>
            <asp:Button ID="btnManagerLogin" runat="server" CssClass="btn btn-primary" Text="מנהל" OnClientClick="showManagerLoginModal(); return false;" />
            <asp:Button ID="btnDriverLogin" runat="server" CssClass="btn btn-secondary" Text="נהג" OnClientClick="showDriverLoginModal(); return false;" />
            <asp:Button ID="btnCustomerLogin" runat="server" CssClass="btn btn-success" Text="לקוח" OnClientClick="showCustomerLoginModal(); return false;" />
        </div>
    </div>

    <!-- תיבת התחברות מנהל (Modal) -->
    <div id="managerLoginModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideManagerLoginModal()">&times;</span>
            <h2>התחברות מנהל</h2>
            <asp:TextBox ID="txtManagerEmail" runat="server" CssClass="form-control" Placeholder="אימייל"></asp:TextBox><br />
            <asp:TextBox ID="txtManagerPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="סיסמה"></asp:TextBox><br />
            <asp:Button ID="btnManagerSubmit" runat="server" CssClass="btn btn-primary" Text="התחבר" OnClick="btnManagerLogin_Click" />
            <asp:Button ID="btnBackToChoiceFromManager" runat="server" CssClass="btn btn-secondary" Text="חזרה" OnClientClick="showLoginChoiceModalFromManager(); return false;" />
        </div>
    </div>

    <!-- תיבת התחברות נהג (Modal) -->
    <div id="driverLoginModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideDriverLoginModal()">&times;</span>
            <h2>התחברות נהג</h2>
            <asp:TextBox ID="txtDriverEmail" runat="server" CssClass="form-control" Placeholder="אימייל"></asp:TextBox><br />
            <asp:TextBox ID="txtDriverPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="סיסמה"></asp:TextBox><br />
            <asp:Button ID="btnDriverSubmit" runat="server" CssClass="btn btn-primary" Text="התחבר" OnClick="btnDriverLogin_Click" />
            <asp:Button ID="btnBackToChoiceFromDriver" runat="server" CssClass="btn btn-secondary" Text="חזרה" OnClientClick="showLoginChoiceModalFromDriver(); return false;" />
            <asp:Literal ID="LtlMsg" runat="server" ></asp:Literal>
        </div>
    </div>

    <!-- תיבת התחברות לקוח (Modal) -->
    <div id="customerLoginModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideCustomerLoginModal()">&times;</span>
            <h2>התחברות לקוח</h2>
            <asp:TextBox ID="txtCustomerEmail" runat="server" CssClass="form-control" Placeholder="אימייל"></asp:TextBox><br />
            <asp:TextBox ID="txtCustomerPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="סיסמה"></asp:TextBox><br />
            <asp:Button ID="btnCustomerSubmit" runat="server" CssClass="btn btn-primary" Text="התחבר" OnClick="btnCustomerLogin_Click" /><br />
            <asp:Button ID="btnBackToChoiceFromCustomer" runat="server" CssClass="btn btn-secondary" Text="חזרה" OnClientClick="showLoginChoiceModalFromCustomer(); return false;" /><br />
            <asp:Literal ID="LtlMsgCustomer" runat="server" EnableViewState="false"></asp:Literal>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <script type="text/javascript">

        function showRegisterModal() {
            document.getElementById("registerModal").style.display = "block";
        }

        function hideRegisterModal() {
            document.getElementById("registerModal").style.display = "none";
        }

        function showLoginChoiceModal() {
            document.getElementById("loginChoiceModal").style.display = "block";
        }

        function hideLoginChoiceModal() {
            document.getElementById("loginChoiceModal").style.display = "none";
        }

        function showManagerLoginModal() {
            hideLoginChoiceModal();
            document.getElementById("managerLoginModal").style.display = "block";
        }

        function hideManagerLoginModal() {
            document.getElementById("managerLoginModal").style.display = "none";
        }

        function showDriverLoginModal() {
            hideLoginChoiceModal();
            document.getElementById("driverLoginModal").style.display = "block";
        }

        function hideDriverLoginModal() {
            document.getElementById("driverLoginModal").style.display = "none";
        }
        function showCustomerLoginModal() {
            hideLoginChoiceModal();
            document.getElementById("customerLoginModal").style.display = "block";
        }

        function hideCustomerLoginModal() {
            document.getElementById("customerLoginModal").style.display = "none";
        }

        function showLoginChoiceModalFromCustomer() {
            hideCustomerLoginModal();
            showLoginChoiceModal();
        }
        function showLoginChoiceModalFromManager() {
            hideManagerLoginModal();
            showLoginChoiceModal();
        }

        function showLoginChoiceModalFromDriver() {
            hideDriverLoginModal();
            showLoginChoiceModal();
        }
        function showErrorModal() {
            document.getElementById("driverLoginModal").style.display = "block";
        }

        // סגירת ה-modal בלחיצה מחוץ לתיבה
        window.onclick = function (event) {
            var registerModal = document.getElementById("registerModal");
            var loginChoiceModal = document.getElementById("loginChoiceModal");
            var managerLoginModal = document.getElementById("managerLoginModal");
            var driverLoginModal = document.getElementById("driverLoginModal");
            var customerLoginModal = document.getElementById("customerLoginModal");
            if (event.target == registerModal) {
                registerModal.style.display = "none";
            }
            if (event.target == loginChoiceModal) {
                loginChoiceModal.style.display = "none";
            }
            if (event.target == managerLoginModal) {
                managerLoginModal.style.display = "none";
            }
            if (event.target == driverLoginModal) {
                driverLoginModal.style.display = "none";
            }
            if (event.target == customerLoginModal) {
                customerLoginModal.style.display = "none";
            }
        }
    </script>
</asp:Content>
