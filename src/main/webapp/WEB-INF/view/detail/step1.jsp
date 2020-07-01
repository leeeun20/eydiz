<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
   <article class="row">
     <div class="rewardWrap">
       <div class="rewardInner">
         <div class="rewardProcessWrap">
           <ul class="rewardProcess">
             <li class="on"><span>리워드 선택</span></li>
             <li><span>결제 예약</span></li>
             <li><span>소문내기</span></li>
           </ul>
         </div>
         <div class="rewardItemTitle">
           <h2>리워드 선택</h2>
           <p>펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
         </div>
         <div class="rewardItemContent">
           <form method="post">
             <ul>
             <c:forEach var="item" items="${reward}">
               <li>
                 <div class="rewardItemBox">
                   <dl>
                     <dt>
                       <label class="checkbox">
                         <input type="checkbox" name="reward${item.rewardNo}" class="rewardId" value="1" />
                         <span class="checkmark"></span>
                       </label>
                     </dt>
                     <dd>
                       <h5>${item.amount}원을 펀딩합니다.</h5>
                       <p>${item.rewardTitle}</p>
                       <p class="rewardItemText">${item.rewardContent}</p>
                       <p class="rewardItemText">${item.rewardOption}</p>
                       <p class="rewardItemText">
                         	배송비 ${item.shipAmount}원 | 리워드 제공 예상일: ${item.startShippingDate}
                       </p>
                       <div class="rewardOptionWrapper">
                         <div class="rewardOptionBox optionRequestQuantity">
                           <p class="optionName">수량</p>
                           <input
                             type="text"
                             name="requestQuantity"
                             value="1"
                             class="center"
                           />
                         </div>
                         <div class="rewardOptionBox optionAnswer">
                           <p class="optionName">옵션</p>
                           <input type="text" name="optionAnswer" />
                         </div>
                       </div>
                     </dd>
                   </dl>
                 </div>
               </li>
				</c:forEach>
             </ul>
             <button type="button" class="btnSubmit">다음 단계로</button>
           </form>
         </div>
       </div>
     </div>
   </article>