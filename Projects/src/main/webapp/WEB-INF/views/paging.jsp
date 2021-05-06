<fmt:parseNumber integerOnly="true" value="${totalCount/15 }"
   var="totalPage" />
<c:if test="${(totalCount%15) > 0 }">
   <c:set value="${totalPage + 1 }" var="totalPage" />
</c:if>
<c:if test="${page%15 != 0 }">
   <fmt:parseNumber integerOnly="true" value="${(page / 15) }"
      var="startPage" />
   <c:set var="startPage" value="${startPage * 15 + 1 }" />
</c:if>
<c:if test="${page%15 == 0 }">
   <c:set var="startPage" value="${page - 14}" />
</c:if>
<c:set var="endPage" value="${startPage + 14 }" />
<c:if test="${startPage + 15 gt totalPage }">
   <c:set var="endPage" value="${totalPage }" />
</c:if>