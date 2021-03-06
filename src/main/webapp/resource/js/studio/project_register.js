///////////////////////////////////
//datepicker 사용

$(function () {
  $("#projectStartDate").datepicker({ dateFormat: "yymmdd" });
  $("#projectEndDate").datepicker({ dateFormat: "yymmdd" });
});

////////////////////////////////////
//이미지가 존재하면 표시하기
$(function () {
  const $imageBox = $(".imageBox");
  const imageUrl = $imageBox.css("background-image");
  const isShow = $imageBox.attr("data-show");
  if (isShow == "true") {
    $imageBox.addClass("show");
  }
});

//이미지 지우기 버튼 클릭
$(function () {
  $("#btnDeleteImage").click(function () {
    const projectNo = $("input[name=projectNo").val();
    const $imageBox = $(".imageBox");
    const url = cp + "/studio/project/" + projectNo + "/register/delete/image";
    ajaxJSON(url, "post", {})
      .then(function (data) {
        console.log(data);
        if (data.result == "ok") {
          $imageBox.removeClass("show");
        }
      })
      .catch(function (e) {
        console.log(e);
      });
  });
});

//이미지 첨부 버튼 클릭
$(function () {
  $("#btnProjectImage").click(function () {
    $("#uploadImage").click();
  });
});

//이미지 첨부 이벤트
$(function () {
  $("#uploadImage").change(function () {
    const projectNo = $("input[name=projectNo]").val();
    const url = cp + "/studio/project/" + projectNo + "/register/upload/image";
    const f = document.projectForm;
    const data = new FormData(f);
    ajaxJSONFile(url, "post", data)
      .then(function (data) {
        const imageUrl = data.url;
        console.log(data, data.url);
        if (imageUrl) {
          //이미지 변경
          $(".imageBox").addClass("show");
          $(".imageBox").css("background-image", "url('" + imageUrl + "')");
        }
      })
      .catch(function (e) {
        console.log(e);
      });
  });
});

//키워드 띄어쓰기 방지
$(function () {
  const $keyword = $("#keyword");
  $keyword.on("keyup blur", function () {
    $keyword.val($keyword.val().replace(/\s/gi, ""));
  });
});

//키워드 불러오기
$(function () {
  const projectNo = $("input[name=projectNo").val();
  const url = cp + "/studio/project/" + projectNo + "/hashtag/view";
  console.log("ajax 호출", url);
  ajaxJSON(url, "get", "")
    .then(function (data) {
      const tags = data.hashtag;
      $.each(tags, function (idx, item) {
        addItem(item.keyword);
      });
    })
    .catch(function (e) {});
});

//키워드 입력
$(function () {
  //엔터키 누르면 해시태그 등록하기
  $("#keyword").keypress(function (e) {
    const code = e.keyCode;
    if (code == 13) {
      //엔터 입력되면
      const projectNo = $("input[name=projectNo]").val();
      const keyword = $(this).val();
      //서버 요청
      const url =
        cp + "/studio/project/" + projectNo + "/hashtag/insert/" + encodeURIComponent(keyword);
      ajaxJSON(url, "post", { projectNo: projectNo, keyword: keyword })
        .then(function (data) {
          if (data.result == "ok") {
            addItem(keyword);
            $("#keyword").removeClass("error");
          }
        })
        .catch(function (e) {
          console.log(e);
          $("#keyword").addClass("error");
          const dup = e.message.indexOf("무결성");
          if (dup > 0) {
            $("#keyword ~ p.msg").text(keyword + "는 이미 등록된 태그입니다.");
          }
        });
      $(this).val("");
      $(this).focus();
    }
  });

  //지우기 누르면 해시태그 삭제하기
  $("body").on("click", ".btnHashDelete", function () {
    const $this = $(this);
    const length = getCountHashItem();
    const keyword = $(this).closest("li").find("span.text").text().trim();
    const projectNo = $("input[name=projectNo]").val();
    const url = cp + "/studio/project/" + projectNo + "/hashtag/delete/" + encodeURI(keyword);
    ajaxJSON(url, "post", {})
      .then(function (data) {
        if (data.result == "ok") {
          $this.closest("li").remove();
          refreshHashTitle(length - 1 - 1); //template 제외
        }
      })
      .catch(function (e) {
        console.log(e);
      });
  });
});

function addItem(keyword) {
  if (keyword.trim() == "") {
    return;
  }
  const length = getCountHashItem();
  if (length - 1 == 10) {
    //template 제외
    alert("10개 이상 추가할 수 없습니다.");
    return;
  }
  refreshHashTitle(length);
  const $template = $("ul.hashItems").eq(0).find(".template").eq(0).clone(1);
  $template.removeClass("template").find(".text").eq(0).text(keyword);
  $template.appendTo(".hashItems");
}

function getCountHashItem() {
  return $("ul.hashItems li").length;
}

function refreshHashTitle(length) {
  const text = length + "/10개의 해시 태그";
  $("#hashTitle").text(text);
}

//저장하기 버튼
$(function () {
  $("#btnSave").click(function () {
    const f = $(this).closest("form");
    const categoryNo = $(this).closest("form").find("select[name=categoryNo]").val();
    if (categoryNo <= 0) {
      alert("카테고리를 선택하세요");
      return false;
    }

    f.submit();
  });
});
