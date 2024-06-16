<%@ Page Title="" Language="C#" MasterPageFile="~/Client-Side.Master" AutoEventWireup="true" CodeBehind="workPage.aspx.cs" Inherits="Delivery_Project.workPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script type="text/javascript">
        var timer;
        var elapsedSeconds = 0;
        var map;
        var markers = [];

        function startTimer() {
            timer = setInterval(function () {
                elapsedSeconds++;
                document.getElementById("timerDisplay").innerText = formatTime(elapsedSeconds);
            }, 1000);
        }


        function stopTimer() {
            clearInterval(timer);
        }

        function formatTime(seconds) {
            var hrs = Math.floor(seconds / 3600);
            var mins = Math.floor((seconds % 3600) / 60);
            var secs = seconds % 60;
            return pad(hrs) + ":" + pad(mins) + ":" + pad(secs);
        }

        function pad(value) {
            return value < 10 ? "0" + value : value;
        }

        function clearMarkers() {
            for (var i = 0; i < markers.length; i++) {
                map.removeLayer(markers[i]);
            }
            markers = [];
        }

        function showMap(city, cityAddresses) {
            var mapDiv = document.getElementById('map');
            mapDiv.style.display = 'block';

            var url = "https://nominatim.openstreetmap.org/search?format=json&q=" + city;

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    if (data && data.length > 0) {
                        var lat = data[0].lat;
                        var lon = data[0].lon;
                        if (!map) {
                            map = L.map('map').setView([lat, lon], 13);
                            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                attribution: '© OpenStreetMap contributors'
                            }).addTo(map);
                        } else {
                            map.setView([lat, lon], 13);
                        }
                        clearMarkers();
                        cityAddresses.forEach(function (address) {
                            var markerLat = parseFloat(address.corddWidth);
                            var markerLon = parseFloat(address.corddHeight);
                            var popupContent = `
                                <div>
                                    <strong>City:</strong> ${address.CityName}<br>
                                    <strong>Address:</strong> ${address.address}<br>
                                    <button onclick="onButtonClick(${address.AddId})">Click me</button>
                                </div>
                            `;
                            var marker = L.marker([markerLat, markerLon]).addTo(map)
                                .bindPopup(popupContent);
                            markers.push(marker);
                        });
                    } else {
                        alert("לא נמצאו קואורדינטות לעיר שנבחרה");
                    }
                })
                .catch(error => {
                    console.error('Error fetching coordinates:', error);
                });
        }

        window.onload = function () {
            startTimer();
        };
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>סטופר עבודה</h2>
        <div id="timerDisplay" style="font-size: 2em;">00:00:00</div>

        <asp:Button ID="endWorkButton" runat="server" Text="סיום עבודה" OnClientClick="stopTimer(); alert('העבודה הסתיימה');" />
    </div>
    <div class="form-group">
        <label>עיר</label>
        <asp:DropDownList ID="ddlCities" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged">
            <asp:ListItem Text="-- בחר עיר --" Value=""></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div id="map" style="height: 400px; width: 500px; display: none;"></div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
