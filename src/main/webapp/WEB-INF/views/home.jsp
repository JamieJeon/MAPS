<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <!-- Map of Google -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.1.0.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key={YOUR_KEY}"></script>
    <script>
        var GMap;
        function GoogleMap() {
            GMap = new google.maps.Map(document.getElementById('GoogleMap'), {
                center: {lat: 37.488059393661544, lng: 127.02511583892249},
                zoom: 15
            });
        }
    </script>

    <!-- Map of Kakao -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey={YOUR_KEY}"></script>
    <script>
        var DMap;
        function DaumMap(){
            var container = document.getElementById('DaumMap'); //지도를 담을 영역의 DOM 레퍼런스
            var options = { //지도를 생성할 때 필요한 기본 옵션
                center: new daum.maps.LatLng(37.488116515686336,127.05236350453426), //지도의 중심좌표.
                level: 5 //지도의 레벨(확대, 축소 정도)
            };

            DMap = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
        }
    </script>
    <!-- Map of Naver -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId={YOUR_KEY}"></script>
    <script>
        var NMap;
        function NaverMap() {
            NMap = new naver.maps.Map('NaverMap', {
                center: new naver.maps.LatLng(37.4752866, 127.0255968),
                zoom: 10
            });
        }
    </script>

    <!-- Map of SK T map -->
    <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey={YOUR_KEY}"></script>
    <script>
        var TMap;
        // 페이지가 로딩이 된 후 호출하는 함수입니다.
        function SKTmap(){
            // map 생성
            // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
            TMap = new Tmap.Map({div:'SKMap', // map을 표시해줄 div
                width:'48%',  // map의 width 설정
                height:'48%' // map의 height 설정
            });
            TMap.setCenter(new Tmap.LonLat("127.05209868305813","37.47658173998897").transform("EPSG:4326", "EPSG:3857"), 15);
        }
    </script></head>
<body>
<script>
    $(document).ready(function(){
        GoogleMap();
        DaumMap();
        NaverMap();
        SKTmap();
    });
</script>
<div id="map">
    <div id="GoogleMap" class="inMap"></div>
    <div id="DaumMap" class="inMap"></div>
    <div id="NaverMap" class="inMap"></div>
    <div id="SKMap" class="inMap"></div>
</div>
</body>
</html>