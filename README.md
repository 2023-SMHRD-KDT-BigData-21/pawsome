# PAWSOME(팀명 : SOA(Smhrd Organization for Animal) )

## 서비스소개
서비스명 : 반려동물용품 전문 중고거래 C2C 서비스 <br>
서비스 소개 : 사용하지 않는 또는 정가로 사기 부담스러운 반려동물용품을 구매하거나 판매할 수 있는 중고거래 서비스

## 프로젝트기간
2024.02.08 ~ 2024.03.19(6주)

## 주요기능
* 기능1 : 동물별 세부 카테고리를 통해 편리한 접근성 제공 <br>
* 기능2 : 판매자와 구매자 간의 실시간 채팅 가능 <br><br>

## 기술스택
<table>
    <tr>
        <th>구분</th>
        <th>내용</th>
    </tr>
    <tr>
        <td>사용언어</td>
        <td>
            <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/>
            <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"/>
            <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"/>
            <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>라이브러리</td>
        <td>
            <img src="https://img.shields.io/badge/BootStrap-7952B3?style=for-the-badge&logo=BootStrap&logoColor=white"/>
            <img src="https://img.shields.io/badge/Socket.io-010101?style=for-the-badge&logo=Socket.io&logoColor=white">
        </td>
    </tr>
    <tr>
        <td>개발도구</td>
        <td>
            <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white"/>
            <img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/>
            <img src="https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge&logo=Jupyter&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>서버환경</td>
        <td>
            <img src="https://img.shields.io/badge/Apache Tomcat-D22128?style=for-the-badge&logo=Apache Tomcat&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>데이터베이스</td>
        <td>
            <img src="https://img.shields.io/badge/Oracle 11g-F80000?style=for-the-badge&logo=Oracle&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>협업도구</td>
        <td>
            <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"/>
            <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/>
        </td>
    </tr>
</table>


## 시스템 아키텍처
<br>
![KakaoTalk_20240320_170030685](https://github.com/2023-SMHRD-KDT-BigData-21/pawsome/assets/156382431/2e232b3b-d5e0-4b4a-8a7a-e9acd1997c76)

<br><br>
## 유스케이스
![KakaoTalk_20240320_170027523](https://github.com/2023-SMHRD-KDT-BigData-21/pawsome/assets/156382431/9127e27c-6f8f-4658-9a8d-59e092c81a71)

<br><br>
## 서비스 흐름도
![KakaoTalk_20240320_170028841](https://github.com/2023-SMHRD-KDT-BigData-21/pawsome/assets/156382431/226d6f03-77c0-4667-a55e-1256e1f74d7b)

<br><br>

## ER 다이어그램
![KakaoTalk_20240320_165906853](https://github.com/2023-SMHRD-KDT-BigData-21/pawsome/assets/156382431/5f630e01-3980-4f53-a04d-0380a4e41221)
<br>

## 화면구성
#### 동물별 세부 카테고리 
![카테고리](https://github.com/2023-SMHRD-KDT-BigData-21/pawsome/assets/156382431/4c203de4-7048-438c-87e8-382b3d30a9c0)
<br>
#### 채팅
![KakaoTalk_20240318_160716288](https://github.com/2023-SMHRD-KDT-BigData-21/pawsome/assets/156382431/509d865d-6757-42a1-a7ec-0275eebfa7e6)
<br>
<br>

## 팀원역할
<table>
  <tr>
    <td align="center"><strong>엄준식</strong></td>
    <td align="center"><strong>방유진</strong></td>
    <td align="center"><strong>양호영</strong></td>
    <td align="center"><strong>엄윤준</strong></td>
    <td align="center"><strong>이현</strong></td>
  </tr>
  <tr>
    <td align="center"><b>Backend</b></td>
    <td align="center"><b>Frontend</b></td>
    <td align="center"><b>Backend,crawling</b></td>
    <td align="center"><b>Backend</b></td>
    <td align="center"><b>Frontend</b></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/Eomjuns1k" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/qkddb" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/hoyoung94" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/june2301" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/LEEHYUN97" target='_blank'>github</a></td>
  </tr>
</table>


## 트러블슈팅
*문제1 : 카테고리분류에 따라 게시물들을 불러오는 기능을 비동기 형식으로 구현하는 데에서 어려움을 겪었음. 
이를 ajax와 json을 통하여 해결하였음.
<br>
*문제2 : Websocket 통신을 통한 실시간 채팅기능 구현에서 메시지 정보를 DB 서버와 연결 및 저장하는 데 어려움을 겪었음.
Websocket.api 의 라이브러리 안에 onMessage, onOpen 함수의 오버라이딩을 통해 해결하였음.
<br>
