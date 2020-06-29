<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<article class="row">
  <div class="rowFull">
    <div class="projectTitle">
      <div
        class="overlay"
        style="
          background-image: url('${project.projectImageUrl}');
        "
      ></div>
      <h3><span>${project.categoryName}</span></h3>
      <h2>${project.projectName}</h2>
    </div>
  </div>
</article>
<nav class="row">
  <div class="rowFull">
    <ul class="detailNav">
      <li class="on">
        <a href="#"><span>스토리</span></a>
      </li>
      <li>
        <a href="#"><span>펀딩 안내</span></a>
      </li>
      <li>
        <a href="#"><span>새소식</span><span class="badge">3</span></a>
      </li>
      <li>
        <a href="#"><span>커뮤니티</span><span class="badge">20</span></a>
      </li>
      <li>
        <a href="#"><span>서포터</span><span class="badge">1190</span></a>
      </li>
    </ul>
  </div>
</nav>
<article class="row">
  <div class="rowFull">
    <div class="detailWrap">
      <div class="detailContent">
		<div class="detailSummary">
		<p>
			<img class="fullWidth" src="${project.projectImageUrl}" alt="${project.projectName}" />
		</p>
		<p>
			${project.projectSummary}
		</p>
		</div>
		<hr class="divider deeper" />
      	<div class="detailStory">
		${project.projectStory}
      	</div>
      </div>
      <div class="detailSide">
        <div class="stateBox">
          <p class="stateText">13일 남음</p>
          <div class="progress">
            <div class="progressBar" style="width: ${project.projectAttainmentRate}%;"></div>
          </div>
          <p class="stateText"><strong>${project.projectAttainmentRate}</strong>% 달성</p>
          <p class="stateText"><strong>${project.projectAttainAmount}</strong>원 펀딩</p>
          <p class="stateText"><strong>944</strong>명의 서포터</p>
        </div>
        <a href="#" class="btnSubmit">펀딩하기</a>
        <ul class="detailSideController">
          <li>
            <a href="#" class="btnPlain"><span class="icon heart"></span>40</a>
          </li>
          <li>
            <a href="#" class="btnPlain"><span class="icon talk"></span>문의</a>
          </li>
          <li>
            <a href="#" class="btnPlain"><span class="icon share"></span>공유</a>
          </li>
        </ul>
        <div class="brandInfoBox">
          <div class="brandName">
            <a href="#"><span class="image"></span><span class="name">${project.brandName}</span></a>
          </div>
          <div class="brandStatus">
            <div class="statusItem">
              <h5>평판</h5>
              <div class="progress">
                <div class="progressBar" style="width: 100%;"></div>
              </div>
            </div>
            <div class="statusItem">
              <h5>소통</h5>
              <div class="progress">
                <div class="progressBar warning" style="width: 22%;"></div>
              </div>
            </div>
            <div class="statusItem">
              <h5>인기</h5>
              <div class="progress">
                <div class="progressBar" style="width: 44%;"></div>
              </div>
            </div>
          </div>
          <div class="goToInquiry brandInfoBoxRow">
            <p>브랜드에게 문의하세요</p>
            <div class="btnComponent">
              <button class="btnPlain semiRound">
                <span class="icon talk"></span>브랜드에게 문의하기
              </button>
            </div>
          </div>
          <div class="brandInfoBoxRow">
            <p>브랜드 정보</p>
            <div class="brandInfoRowInner">
              <p>브랜드 연락처</p>
              <ul>
                <li>${project.managerEmail}</li>
                <li>${project.managerPhone}</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="rewards rowBox">
          <h3>리워드 선택</h3>
          <c:forEach var="item" items="${reward}">
          <div class="rewardItem">
            <div class="overlay">
              <p class="text">이 리워드 펀딩하기</p>
            </div>
            <dl class="rewardInfo">
              <dt>${item.amount}원 펀딩</dt>
              <dd>
                <p>${item.rewardTitle}</p>
                <c:if test="${not empty item.rewardOption}">
                <p>${item.rewardOption}</p>
                </c:if>
              </dd>
            </dl>
            <c:if test="${isShipping==1}">
            <dl class="rewardOptions">
              <dt>배송비</dt>
              <dd>${item.shipAmount}원</dd>
              <dt>리워드 발송 시작일</dt>
              <dd>2020년 7월 초 예정</dd>
            </dl>
            </c:if>
            <div class="rewardQuantity">
              <div class="quantityRow mint">
                <span class="limitQuantity">제한수량 <strong>${item.limitQuantity}</strong>개</span>
                <span class="remainingQuantity highlighting">
                  현재 <strong>${item.remainQuantity}</strong>개 남음!
                </span>
              </div>
              <div class="quantityRow">
                <span class="soldQuantity">총 00개 펀딩완료</span>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
        <div class="reports rowBox border">
          <div class="rowBoxInner">
            <h4>신고하기란?</h4>
            <p class="gray small">
              해당 프로젝트에 허위내용 및 지적재산권을 침해한 내용이 있으면 제보해주시기
              바랍니다.
            </p>
            <a href="#" id="reportProject" class="btnPlain gray semiRound"
              >프로젝트 신고하기</a
            >
          </div>
        </div>
        <div class="rank rowBox border">
          <div class="rowBoxInner">
            <h4 class="title large">인기 프로젝트</h4>
            <ol class="rankList">
              <li>
                <p>
                  <span class="rankNumber">1</span
                  ><a href="#">[글로벌 최초 펀딩] 스마트워치가 3만...</a>
                </p>
              </li>
              <li>
                <p>
                  <span class="rankNumber">2</span
                  ><a href="#">3만원 대로 매일 집에서 몸상태 체크하...</a>
                </p>
              </li>
              <li>
                <p>
                  <span class="rankNumber">3</span
                  ><a href="#">[하이테크 마스크] 꿈의 소재 그래핀으...</a>
                </p>
              </li>
              <li>
                <p>
                  <span class="rankNumber">4</span
                  ><a href="#">[요청앵콜] 브라의 상식을 깨다! 후기로...</a>
                </p>
              </li>
              <li>
                <p>
                  <span class="rankNumber">5</span
                  ><a href="#">[airable] 바람과 한 몸이 되다. 360도 ...</a>
                </p>
              </li>
              <li>
                <p>
                  <span class="rankNumber">6</span
                  ><a href="#">[만족도 1위 선풍기] 아직도 들고 다녀? ...</a>
                </p>
              </li>
              <li>
                <p>
                  <span class="rankNumber">7</span
                  ><a href="#">푸딩이야 베개야 내 목에 딱 맞는 &quot;숙...</a>
                </p>
              </li>
              <li>
                <p>
                  <span class="rankNumber">8</span
                  ><a href="#">[5700%앵콜]#설탕쏙뺀 8kcal 탄산음...</a>
                </p>
              </li>
              <li>
                <p>
                  <span class="rankNumber">9</span
                  ><a href="#">"선 빼고 다 드려요" ANKER 10만원 대...</a>
                </p>
              </li>
              <li>
                <p>
                  <span class="rankNumber">10</span
                  ><a href="#">[마지막 앵콜] 남자도 민망함이 없이 입는...</a>
                </p>
              </li>
            </ol>
          </div>
        </div>
      </div>
    </div>
  </div>
</article>