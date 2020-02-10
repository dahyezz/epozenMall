<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script>
/* $(document).ready(fouction(){
	commentList();
}
		)
 */

</script>

<table>

<tr>
<td>
${comment.userId}
<br>
<fmt:formatDate value="${comment.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
<br>
${comment.comContents}
</td></tr>

</table>
<form>
	<div>
		<div>${list.userId}</div>
		<div>${list.comRegdate}</div>
		<div>${list.comContents}</div>
	</div>
	
	<div>
		<div>
			<textarea cols="100" rows="3"></textarea>
			<input type="button" value="등록">
		</div>
	
	</div>
</form>




