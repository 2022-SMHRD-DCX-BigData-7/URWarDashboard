// 뉴스기사

function resizeIframe() {
    var iframe = document.getElementById('myIframe');
    iframe.style.height = "100%"; // 부모 요소의 높이에 맞게 iframe 높이 조정
}

// 페이지 크기 변화를 감지하여 resizeIframe 함수 호출
window.addEventListener('resize', resizeIframe);



    // 월별 뉴스기사 수 나타내는 기능
var iframeContainer = document.getElementById('iframeContainer');
var button = document.getElementById('newsButton');
var isIframeVisible = false; // 기본적으로 iframe을 표시합니다.

function toggleIframe() {
    if (isIframeVisible) {
        iframeContainer.style.display = "none";
         // iframe을 숨깁니다.    
    } else {
        iframeContainer.style.display = "block";
        iframeContainer2.style.display = "none"; // iframe을 표시합니다.
		imgContainer.style.display = "none"
    }
    isIframeVisible = !isIframeVisible;
}
// 버튼 클릭 시 toggleIframe 함수 호출
button.addEventListener('click', toggleIframe);


    // 키워드 건수 나타내는 기능
var iframeContainer2 = document.getElementById('iframeContainer2');
var keybutton = document.getElementById('keyButton');
var isIframeVisible2 = false; // 기본적으로 iframe을 표시합니다.

function toggleIframe2() {
    if (isIframeVisible2) {
        iframeContainer2.style.display = "none";
         // iframe을 숨깁니다.    
    } else {
        iframeContainer2.style.display = "block";
        iframeContainer.style.display = "none"; // iframe을 표시합니다.
		imgContainer.style.display = "none"
    }
    isIframeVisible2 = !isIframeVisible2;
}
// 버튼 클릭 시 toggleIframe 함수 호출
keybutton.addEventListener('click', toggleIframe2);

    
// 워드클라우드
var imgContainer = document.getElementById('imgContainer');
var wordButton = document.getElementById('wordButton');
var isImageVisible = false; // 기본적으로 이미지를 숨깁니다.

function toggleImage() {
    if (isImageVisible) {
        imgContainer.style.display = "none"; // 이미지를 숨깁니다.
    } else {
        imgContainer.style.display = "block"; // 이미지를 표시합니다.
        iframeContainer.style.display = "none"; // iframe1 숨김
        iframeContainer2.style.display = "none"; // iframe2 숨김
    }
    isImageVisible = !isImageVisible;
}

// 버튼 클릭 시 toggleIframe 함수 호출
wordButton.addEventListener('click', toggleImage);






