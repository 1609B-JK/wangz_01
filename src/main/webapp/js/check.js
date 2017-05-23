function checkall(){
	$(":checkbox[name='check']").each(function(){
		$(this).prop("checked",$("#first").prop("checked"));
	});
}
function fan(){
	$(":checkbox[name='check']").each(function(){
		$(this).prop("checked",!$(this).prop("checked"));
	});
}
