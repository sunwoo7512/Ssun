function login(){
	var id = $("#id").val();
	var pw = $("#pw").val();
	if(id.length < 4 || id == ""){
		alert("아이디를 올바르게 입력하세요.");
		$("#id").focus();
		return false;
	}
	if(pw.length < 4 || pw == ""){
		alert("암호를 올바르게 입력하세요.");
		$("#pw").focus();
		return false;
	}
}