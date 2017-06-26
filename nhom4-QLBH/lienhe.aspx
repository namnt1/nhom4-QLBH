<%@ Page Title="Liên hệ" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" >
<div class="featured">
    <div class="container">
        <div class="row">
            <div class="feature-grids">
                <h1 style=" font-family: 'JosefinSans-Regular';color:#0094ff;">Liên hệ</h1>
                <div class="map"></div>
            <script src='https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyDTaYS2A-mL4_JBPtgD1qXqgGq9Cxkhm9s'></script>
            <div style='overflow:hidden;height:600px;width:100%;'><div id='gmap_canvas' style='height:600px;width:100%;'>
            </div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div>
            <a href='http://www.shopbeleuchtung.net'>http://Shop Beleuchtung.net</a>
            <script type='text/javascript' src='https://embedmaps.com/google-maps-authorization/script.js?id=ee85c301463cd68dec41cb7a62407423b4bb67a5'></script><script type='text/javascript'>function init_map() {
    var myOptions = { zoom: 12, center: new google.maps.LatLng(21.0279571, 105.771796), mapTypeId: google.maps.MapTypeId.ROADMAP };
    map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
    marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(21.0279571, 105.771796) });
    infowindow = new google.maps.InfoWindow({ content: '<strong>FPoly</strong><br>My Dinh 2<br>100000 Hanoi<br>' });
    google.maps.event.addListener(marker, 'click', function () { infowindow.open(map, marker); }); infowindow.open(map, marker);
}
                                                                                                                                                                    google.maps.event.addDomListener(window, 'load', init_map);</script>
                </div>
                <div class="khung">
                    <h1 style="color:#1747bb">Phone:</h1>
                </br>
                <p>
                    <span style="float:left; font-weight:bold;">Giờ làm việc:</span>
                    </br>
                    <span>+084.043.113</span>
                </p>
                <p>
                    <span style="float:left; font-weight:bold;">Sau giờ làm việc:</span>
                    </br>
                    <span>+084.043.114</span>
                </p>
                </div>
                <div class="khung">
                    <h1 style="color:#1747bb">Email:</h1>
                </br>
                <p>
                    <span style="float:left; font-weight:bold;">Hỗ trợ:</span>
                    </br>
                    <span><a href="nhom3@yahoo@example.com">nhom4-QLBH@gmail.com</a></span>
                </p>
                <p>
                    <span style="float:left; font-weight:bold;">Bán hàng:</span>
                    </br>
                    <span><a href="nhom3@yahoo.com">nhom4-QLBH@gmail.com</a></span>
                </p>
                <p>
                    <span style="float:left; font-weight:bold;">Liên hệ:</span>
                    </br>
                    <span><a href="nhom3@yahoo.com">nhom4-QLBH@gmail.com</a></span>
                </p>
                    </div>
                <div class="khung">
                    <h1 style="color:#1747bb">Địa chỉ:</h1>
                </br>
                <p>
                    999 Hàm Nghi<br />
                    Hanoi, HN 100000
                </p>
                    </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>